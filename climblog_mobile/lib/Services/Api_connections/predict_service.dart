import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/io_client.dart';

class PredictService {
  final baseUrl = "http://10.0.2.2:8000";

  IOClient _createIoClient() {
    final client = HttpClient()
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
    return IOClient(client);
  }

  Future<String> predict(String prompt) async {
    final url = Uri.parse("$baseUrl/generate-training-plan");
    final body = jsonEncode({"prompt": prompt});
    final ioClient = _createIoClient();

    try {
      final response = await ioClient.post(
        url,
        body: body,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      debugPrint("Response status: ${response.statusCode}");
      debugPrint("Response body: ${response.body}");

      if (response.statusCode != 200) {
        throw Exception("Prediction failed: ${response.body}");
      }

      final data = jsonDecode(response.body);
      return data['result'] ?? data.toString();
    } catch (e) {
      debugPrint("Error: $e");
      rethrow;
    } finally {
      ioClient.close();
    }
  }
}