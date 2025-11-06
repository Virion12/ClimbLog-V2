import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';

import 'package:climblog_mobile/Services/Auth/auth_service.dart';
import 'package:path_provider/path_provider.dart';

class FileService {
  final AuthService _authService;
  final String baseUrl = "https://10.0.2.2:7116";

  FileService([AuthService? authService])
      : _authService = authService ?? AuthService();

  IOClient _createIoClient() {
    final client = HttpClient()
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
    return IOClient(client);
  }

 
  Future<String> uploadFileLocally(File file, [String? filename]) async {
    final appDir = await getApplicationDocumentsDirectory();
    filename ??= '${DateTime.now().millisecondsSinceEpoch}';
    final localPath = '${appDir.path}/$filename';
    try {
      await file.copy(localPath);
    } catch (e) {
      throw Exception("Failed to save file locally: $e");
    }
    return filename; 
  }


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
      await http.MultipartFile.fromPath(
        'file',
        file.path,
      ),
    );

    final streamedResponse = await ioClient.send(request);
    final response = await http.Response.fromStream(streamedResponse);

    debugPrint("Response status: ${response.statusCode}");
    debugPrint("Response body: ${response.body}");

    if(response.statusCode != 200){
      throw Exception("${response.statusCode}");
    }
    final data = jsonDecode(response.body);
    final fileName = data["filename"];
    
    if(fileName == null){
      throw Exception("No file name was returned");
    }
    debugPrint("Uploaded file remotely file $fileName");
    await uploadFileLocally(file, fileName);
    debugPrint("Uplaoding file localy $fileName");
    return fileName;
  }

  Future<bool>  RemoveFileAPi(String fileName)  async {
    var token = await _authService.tokenValidation();
    final url = Uri.parse("$baseUrl/api/FileUpload/$fileName");
    final ioClient = _createIoClient();
     final response = await ioClient.delete(
      url,
      headers: {"Content-Type": "application/json", "Accept": "application/json","Authorization" : "Bearer $token"},
    );
    debugPrint("Response status: ${response.statusCode}");
    debugPrint("Response body: ${response.body}");

    if(response.statusCode != 204){
      return false;
    }

    return true;
  }

  Future<bool> RemoveFileLocal(String filename) async {
    String path = (await getApplicationDocumentsDirectory()).path;
              final file = File('$path/$filename');
              if(await file.exists()){
                try{
                  await file.delete();
                }catch(e){
                  debugPrint(e.toString());
                  return false;
                }
            }
            return true;
  }
}
