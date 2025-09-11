import 'dart:convert';
import 'dart:io';
import 'package:flutter/rendering.dart';
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

  Future<bool> register(String username, String password) async {
    final url = Uri.parse("$baseUrl/api/auth/register");
    final body = jsonEncode({
      "username": username.trim(),
      "password": password.trim()
    });

    debugPrint("Request body: $body");

    final ioClient = _createIoClient();
    final response = await ioClient.post(
      url,
      headers: {"Content-Type": "application/json", "Accept": "application/json"},
      body: body,
    );

    debugPrint("Response status: ${response.statusCode}");
    debugPrint("Response body: ${response.body}");

    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  

  Future<bool> login(String username, String password) async {
    final url = Uri.parse("$baseUrl/api/auth/login");
    final body = jsonEncode({
      "username": username.trim(),
      "password": password.trim()
    });

    debugPrint("Request body: $body");

    final ioClient = _createIoClient();
    final response = await ioClient.post(
      url,
      headers: {"Content-Type": "application/json", "Accept": "application/json"},
      body: body,
    );

    debugPrint("Response status: ${response.statusCode}");
    debugPrint("Response body: ${response.body}");

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final refreshToken = data["refreshToken"];
      final token = data["accessToken"];
      final userId = data["userid"];
      if (token != null && refreshToken != null) {
        await _storage.write(key: "username", value: username.trim());
        await _storage.write(key: "accessToken", value: token);
        await _storage.write(key: "accessTokenExpiration", value: DateTime.now().toUtc().add(const Duration(minutes: 9)).toString());
        await _storage.write(key: "refreshToken", value: refreshToken);
        await _storage.write(key: "refreshTokenExpiration", value: DateTime.now().toUtc().add(const Duration(days: 30)).toString());
        await _storage.write(key: "userid", value: userId.toString());
        
        debugPrint(await _storage.read(key: "refreshTokenExpiration"));
        debugPrint(await _storage.read(key: "userid"));
        return true;
      }
    }
    return false;
  }

  Future<String?> getToken() async {
    return await _storage.read(key: "accessToken");
  }

  
  Future<bool> isAccessTokenValid() async {
   var accessTokenExpiration =  await _storage.read(key: "accessTokenExpiration");
   if(accessTokenExpiration != null){
    final tokenExpiration = DateTime.parse(accessTokenExpiration);
    if(DateTime.now().toUtc().isBefore(tokenExpiration)){
      return true;
    }
   }
   return false;
  }

  Future<void> refreshToken() async{
    final username = await _storage.read(key: "username");


    if(username == null ){
      throw Exception("No username for user please re-login");
    }

    final refreshToken = await _storage.read(key: "accessToken");
    final refreshTokenExpiration = await _storage.read(key: "accessTokenExpiration");

    if(refreshToken == null){
      throw Exception("No refresh token assigned to user please re-login");
    }

    if(refreshTokenExpiration == null){
      throw Exception("User does not have refreshtoken please re-login");
    }

    final refreshTokenExpirationValidated = DateTime.parse(refreshTokenExpiration);
    if(refreshTokenExpirationValidated.isBefore(DateTime.now().toUtc())){
      throw Exception("User does not have correct refreshtoken please re-login");
    }

    final url = Uri.parse("$baseUrl/api/auth/refresh");
    final body = jsonEncode({
      "username": username.trim(),
      "RefreshToken": refreshToken
    });

    debugPrint("Request body: $body");

    final ioClient = _createIoClient();
    final response = await ioClient.post(
      url,
      headers: {"Content-Type": "application/json", "Accept": "application/json"},
      body: body,
    );

    debugPrint("Response status: ${response.statusCode}");
    debugPrint("Response body: ${response.body}");

    if(response.statusCode == 200){
       final data = jsonDecode(response.body);
      final refreshToken = data["refreshToken"];
      final token = data["accessToken"];
      await _storage.write(key: "accessToken", value: token);
      await _storage.write(key: "accessTokenExpiration", value: DateTime.now().toUtc().add(const Duration(minutes: 9)).toString());
      await _storage.write(key: "refreshToken", value: refreshToken);
      await _storage.write(key: "refreshTokenExpiration", value: DateTime.now().toUtc().add(const Duration(days: 30)).toString());
    }
  }

  Future<void> logout() async {
    await _storage.delete(key: "accessToken");
    await _storage.delete(key: "refreshToken");
    await _storage.delete(key: "refreshTokenExpiration");
  }

  Future<bool> logincheck() async{
   var refreshTokenExpirationTime = await _storage.read(key: "refreshTokenExpiration");
   if(refreshTokenExpirationTime != null){
   final expirationDate = DateTime.parse(refreshTokenExpirationTime);
    if(DateTime.now().isBefore(expirationDate)){
      return  true;
    }
   }
   return false;
  }
}
