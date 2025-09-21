import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';

import 'package:climblog_mobile/Services/Auth/auth_service.dart';

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

//Todo implement 
  Future<void> uploadFileLocaly(File file) async {

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
    return fileName;
  }
}
