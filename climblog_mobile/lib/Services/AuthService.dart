import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  final _storage = const FlutterSecureStorage();

  final String baseUrl = "https://10.0.2.2:7116"; 

  IOClient _createIoClient() {
    final client = HttpClient()
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
    return IOClient(client);
  }

  Future<bool> login(String username, String password) async {
    final url = Uri.parse("$baseUrl/api/auth/login");
    final body = jsonEncode({
      "username": username.trim(),
      "password": password.trim()
    });

    print("Request body: $body");

    final ioClient = _createIoClient();
    final response = await ioClient.post(
      url,
      headers: {"Content-Type": "application/json", "Accept": "application/json"},
      body: body,
    );

    print("Response status: ${response.statusCode}");
    print("Response body: ${response.body}");

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final token = data["token"];
      if (token != null) {
        await _storage.write(key: "jwt", value: token);
        return true;
      }
    }
    return false;
  }

  Future<String?> getToken() async {
    return await _storage.read(key: "jwt");
  }

  Future<void> logout() async {
    await _storage.delete(key: "jwt");
  }
}
