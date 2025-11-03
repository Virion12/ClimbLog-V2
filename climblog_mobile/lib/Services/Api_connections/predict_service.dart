import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';

class PredictSerivce{
  final baseUrl = "http://10.0.2.2:8000";
   IOClient _createIoClient() {
    final client = HttpClient()
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
    return IOClient(client);
  }

  Future<String> predict (String prompt) async{
    final url = Uri.parse("$baseUrl/generate-training-plan");
    final body = jsonEncode({
      "prompt" : prompt,
    });
    final ioClient = _createIoClient();
    String responseString = "";
    try{
     final response = await ioClient.post(
      url,
      body: body,
    );
    debugPrint("Response status: ${response.statusCode}");
    debugPrint("Response body: ${response.body}");
    if (response.statusCode != 200) {
      throw Exception("adding of the route failed");
    }
    ioClient.close();
    final data = jsonDecode(response.body);
    responseString = data;
    }catch (e){
      debugPrint("$e");
      ioClient.close();
    }
    return responseString;
  }

}