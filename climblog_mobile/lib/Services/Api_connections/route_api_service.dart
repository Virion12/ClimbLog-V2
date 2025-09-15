import 'dart:convert';
import 'dart:io';
import 'package:climblog_mobile/Services/Auth/auth_service.dart';
import 'package:climblog_mobile/Services/local_db/route_service.dart';
import 'package:climblog_mobile/database/database.dart';
import 'package:flutter/material.dart';
import 'package:http/io_client.dart';


class RouteServiceApi {
  final AppDatabase _db;
  final AuthService _authService;
  final RouteService _localRouteService;
  final String baseUrl = "https://10.0.2.2:7116"; 

  IOClient _createIoClient() {
    final client = HttpClient()
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
    return IOClient(client);
  }
  

  RouteServiceApi(this._db, this._authService,this._localRouteService);

  Future<String> tokenValidation() async {
  var userAccessToken = await _authService.getToken();

  if (userAccessToken == null) {
    throw Exception("User is not logged in");
  }

  final isValid = await _authService.isAccessTokenValid();

  if (!isValid) {
    try {
      await _authService.refreshToken();
      userAccessToken = await _authService.getToken();
      if (userAccessToken == null) {
        throw Exception("No access token after refresh");
      }
    } catch (e) {
      throw Exception("Failed to refresh token: $e");
    }
  }

  return userAccessToken;
}


  Future<void> bachAddRoute() async{

    final routes = await (_db.select(_db.climbingRoutes)..where((t) => t.isAddedToBackend.equals(false))).get();
    
    final userAccessToken = await tokenValidation();

    for(var route in routes){
      try{

      }catch (e){
        throw new Exception(e);
      }

    }
  }

  Future<void> AddRoute(int id) async{
    final route = await (_db.select(_db.climbingRoutes)..where((r) => r.id.equals(id))).getSingle();

    final userAccessToken = await tokenValidation();

    final url = Uri.parse("$baseUrl/api/Route/add-one");
    final body = jsonEncode({
  "isPublic": route.isPublic,
  "name": route.name,
  "color": route.color,
  "heigth": route.height,
  "isPowery": route.isPowery,
  "isSloppy": route.isSloppy,
  "isDynamic": route.isDynamic,
  "isCrimpy": route.isSloppy,
  "isReachy": route.isReachy,
  "isOnsighted": route.isOnsighted,
  "isRedPointed": route.isRedPointed,
  "isFlashed": route.isFlashed,
  "isFavorite": route.isFavorite,
  "numberOfTried": route.numberOfTried,
  "isDone": route.isDone,
  "grade": route.grade,
  "thumbnailPath": route.thumbnailPath,
  "imagePath": route.imagePath
});

    debugPrint("Request body: $body");

    final ioClient = _createIoClient();
    final response = await ioClient.post(
      url,
      headers: {"Content-Type": "application/json", "Accept": "application/json","Authorization" : "Bearer $userAccessToken"},
      body: body,
    );

    debugPrint("Response status: ${response.statusCode}");
    debugPrint("Response body: ${response.body}");

    if(response.statusCode != 200){
      throw Exception("adding of the route failed");
    }
    
    final data = jsonDecode(response.body);
    final routeid = data["routeid"];
    _localRouteService.markRouteAsUploaded(id,routeid);


  }

  //Remove 
  Future<void> RemoveRoute(int id) async{
    final route = await (_db.select(_db.climbingRoutes)..where((r) => r.id.equals(id))).getSingle();
    final routeId = route.backendId;
    debugPrint(routeId.toString());
    
    final userAccessToken = await tokenValidation();

    final url = Uri.parse("$baseUrl/api/Route/$routeId");
    final ioClient = _createIoClient();
    final response = await ioClient.delete(
      url,
      headers: {"Content-Type": "application/json", "Accept": "application/json","Authorization" : "Bearer $userAccessToken"},
    );
    debugPrint("Response status: ${response.statusCode}");
    debugPrint("Response body: ${response.body}");

    if(response.statusCode != 204){
      throw Exception("removing of the route failed");
    }
    
  }
  
}
