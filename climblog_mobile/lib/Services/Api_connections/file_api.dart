import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:climblog_mobile/Services/Auth/auth_service.dart';
import 'package:path_provider/path_provider.dart';

class FileService {
  final AuthService _authService;
  final String baseUrl = "https://10.0.2.2:7116";
  final _storage = const FlutterSecureStorage();

  FileService([AuthService? authService])
      : _authService = authService ?? AuthService();

  IOClient _createIoClient() {
    final client = HttpClient()
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
    return IOClient(client);
  }

  Future<String> getUid() async {
    final userID = await _storage.read(key: "userid");
    if (userID == null) {
      throw Exception("User is not logged in");
    }
    return userID;
  }

  /// Tworzy lokalny katalog użytkownika (Documents/userid)
  Future<Directory> _getUserDirectory() async {
    final appDir = await getApplicationDocumentsDirectory();
    final userId = await getUid();
    final userDir = Directory('${appDir.path}/$userId');

    if (!await userDir.exists()) {
      await userDir.create(recursive: true);
    }
    return userDir;
  }

  /// Zapisuje plik lokalnie w katalogu użytkownika
  Future<String> uploadFileLocally(File file, [String? filename]) async {
    final userDir = await _getUserDirectory();
    filename ??= '${DateTime.now().millisecondsSinceEpoch}';
    final localPath = '${userDir.path}/$filename';
    try {
      await file.copy(localPath);
    } catch (e) {
      throw Exception("Failed to save file locally: $e");
    }
    return filename;
  }

  /// Upload do API + zapis lokalny
  Future<String> uploadFileApi(File file) async {
    var token = await _authService.tokenValidation();
    final url = Uri.parse("$baseUrl/api/FileUpload/upload");

    final ioClient = _createIoClient();
    final request = http.MultipartRequest("POST", url);

    request.headers.addAll({
      "Authorization": "Bearer $token",
      "Accept": "application/json",
    });

    request.files.add(
      await http.MultipartFile.fromPath('file', file.path),
    );

    final streamedResponse = await ioClient.send(request);
    final response = await http.Response.fromStream(streamedResponse);

    debugPrint("Response status: ${response.statusCode}");
    debugPrint("Response body: ${response.body}");

    if (response.statusCode != 200) {
      throw Exception("${response.statusCode}");
    }

    final data = jsonDecode(response.body);
    final fileName = data["filename"];

    if (fileName == null) {
      throw Exception("No file name was returned");
    }

    debugPrint("Uploaded file remotely: $fileName");
    await uploadFileLocally(file, fileName);
    debugPrint("Uploaded file locally: $fileName");
    return fileName;
  }

  /// Pobiera plik z API i zapisuje lokalnie w katalogu użytkownika
  Future<void> downloadFileApi(String filename) async {
    if (filename.isEmpty) {
      debugPrint("Filename is empty — skipping download");
      return;
    }

    final token = await _authService.tokenValidation();
    final ioClient = _createIoClient();
    final url = Uri.parse("$baseUrl/api/FileUpload/$filename");

    try {
      final response = await ioClient.get(
        url,
        headers: {
          "Authorization": "Bearer $token",
          "Accept": "application/octet-stream",
        },
      );

      if (response.statusCode == 404) {
        debugPrint("File not found on server: $filename");
        return;
      }

      if (response.statusCode != 200) {
        debugPrint("Failed to download file: ${response.statusCode}");
        return;
      }

      final userDir = await _getUserDirectory();
      final localPath = '${userDir.path}/$filename';
      final file = File(localPath);

      await file.writeAsBytes(response.bodyBytes);
      debugPrint("File saved locally: $localPath");
    } catch (e) {
      debugPrint("Error downloading file '$filename': $e");
    }
  }

  /// Usuwa plik z API
  Future<bool> RemoveFileAPi(String fileName) async {
    var token = await _authService.tokenValidation();
    final url = Uri.parse("$baseUrl/api/FileUpload/$fileName");
    final ioClient = _createIoClient();

    final response = await ioClient.delete(
      url,
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer $token"
      },
    );

    debugPrint("Response status: ${response.statusCode}");
    debugPrint("Response body: ${response.body}");

    return response.statusCode == 204;
  }

  /// Usuwa plik lokalny użytkownika
  Future<bool> RemoveFileLocal(String filename) async {
    final userDir = await _getUserDirectory();
    final file = File('${userDir.path}/$filename');

    if (await file.exists()) {
      try {
        await file.delete();
      } catch (e) {
        debugPrint(e.toString());
        return false;
      }
    }
    return true;
  }

  /// Usuwa cały katalog użytkownika (np. przy wylogowaniu)
  Future<void> clearUserFiles() async {
    final userDir = await _getUserDirectory();
    if (await userDir.exists()) {
      await userDir.delete(recursive: true);
      debugPrint("Deleted all local files for user ${await getUid()}");
    }
  }
}
