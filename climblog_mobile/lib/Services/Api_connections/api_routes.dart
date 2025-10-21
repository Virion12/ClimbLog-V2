import 'dart:convert';
import 'dart:io';

import 'package:climblog_mobile/Services/Api_connections/file_api.dart';
import 'package:climblog_mobile/Services/Auth/auth_service.dart';
import 'package:climblog_mobile/Services/local_db/route_service.dart';
import 'package:climblog_mobile/database/database.dart';
import 'package:flutter/material.dart';
import 'package:http/io_client.dart';
import 'package:path_provider/path_provider.dart';

class ApiRoutes {

  final AppDatabase _db;
  final AuthService _authService;
  final RouteService _localRouteService;
  final String baseUrl = "https://10.0.2.2:7116"; 
  final FileService _fileService; 
    IOClient _createIoClient() {
    final client = HttpClient()
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
    return IOClient(client);
  }

  ApiRoutes(this._db, this._authService,this._localRouteService, this._fileService);

  Future<String> _validateToken() async {
    final token = await _authService.tokenValidation();
    return token;
    }

  Future<int> _getUserId() async {
    final userId = await _authService.getUserId();
    if (userId == null) {
      throw Exception("User ID not found. User might not be logged in.");
    }
    return int.parse(userId);
    }

    //Adding 
    Future<void> AddRoute(int id) async{
      final userId = await _getUserId();
      final userToken = await _validateToken();

      ClimbingRoute route = await _localRouteService.getOne(id);
      String ImagePathAfterchange ="";
      if(route.imagePath != ""){
          String path = (await getApplicationDocumentsDirectory()).path;
            final file = File('$path/${route.imagePath}');
            if(await file.exists() == false){
              throw Exception("No file in local device");
            }
          
          String imagePath = await _fileService.uploadFileApi(file);
          await _fileService.RemoveFileLocal(route.imagePath);
          ImagePathAfterchange = imagePath;
          await _localRouteService.addImagePath(route.id, ImagePathAfterchange);
          
      }


      final url = Uri.parse("$baseUrl/api/Route/add-one");
      final body = jsonEncode({
        "isPublic": route.isPublic,
        "name": route.name,
        "color": route.color,
        "heigth": route.height,
        "isPowery": route.isPowery,
        "isSloppy": route.isSloppy,
        "isDynamic": route.isDynamic,
        "isCrimpy": route.isCrimpy,
        "isReachy": route.isReachy,
        "isOnsighted": route.isOnsighted,
        "isRedPointed": route.isRedPointed,
        "isFlashed": route.isFlashed,
        "isFavorite": route.isFavorite,
        "numberOfTried": route.numberOfTried,
        "isDone": route.isDone,
        "grade": route.grade,
        "thumbnailPath": route.thumbnailPath,
        "imagePath": ImagePathAfterchange,
      });
      debugPrint("Request body: $body");

      final ioClient = _createIoClient();
      final response = await ioClient.post(
        url,
        headers: {"Content-Type": "application/json", "Accept": "application/json","Authorization" : "Bearer $userToken"},
        body: body,
      );

      debugPrint("Response status: ${response.statusCode}");
      debugPrint("Response body: ${response.body}");

      if(response.statusCode != 200){
        throw Exception("adding of the route failed");
      }
      ioClient.close();
      
      final data = jsonDecode(response.body);
      final routeid = data["routeid"];
      await _localRouteService.markRouteAsUploaded(id,routeid);
    }

     //Remove 
  Future<void> RemoveRoute(int id, bool isConected) async{

    //validation if route is added to backend
    final route = await (_db.select(_db.climbingRoutes)..where((r) => r.id.equals(id))).getSingle();
    final routeId = route.backendId;
    final isAdded = route.isAddedToBackend;
    debugPrint(routeId.toString());

    if(routeId == 0 || isAdded == false){
      _localRouteService.removeRoute(id);
      return;
    }

    if(isConected){
      try{
        final userId = await _getUserId();
        final userToken = await _validateToken();
        var isFileRemoved = false;
        
        if(route.imagePath != "" && route.imagePath.isNotEmpty){
          final fileUploadService = FileService();
           isFileRemoved =  await  fileUploadService.RemoveFileAPi(route.imagePath);
            String path = (await getApplicationDocumentsDirectory()).path;
            final file = File('$path/${route.imagePath}');
            if(await file.exists()){
             await file.delete();
            }  
              
        }else{
          isFileRemoved = true;
        }
        
        if(isFileRemoved){
          
          final url = Uri.parse("$baseUrl/api/Route/$routeId");
          final ioClient = _createIoClient();
          final response = await ioClient.delete(
            url,
            headers: {"Content-Type": "application/json", "Accept": "application/json","Authorization" : "Bearer $userToken"},
          );
          debugPrint("Response status: ${response.statusCode}");
          debugPrint("Response body: ${response.body}");

          if(response.statusCode != 204){
            throw Exception("removing of the route failed");
          }
          await  _localRouteService.removeRoute(route.id);
        }else{
          _localRouteService.markRouteAsToDeletion(id);
        }
      }catch (e){
        _localRouteService.markRouteAsToDeletion(id);
      }
    }else{
            String path = (await getApplicationDocumentsDirectory()).path;
            final file = File('$path/${route.imagePath}');
            if(await file.exists()){
             await file.delete();
            }
      _localRouteService.markRouteAsToDeletion(id);
    }
  }
}
