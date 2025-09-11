import 'package:climblog_mobile/Riverpod/auth_riverpod.dart';
import 'package:drift/drift.dart';
import 'package:climblog_mobile/database/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class RouteService {
  final _storage = const FlutterSecureStorage();
  final AppDatabase _db;
  final AuthStateNotifier _authStateNotifier;
  

  RouteService(this._db, this._authStateNotifier);

  Future<void> addRoute() async{

    final routes = await (_db.select(_db.climbingRoutes)..where((t) => t.isAddedToBackend.equals(false))).get();
    final userAccessToken = await _storage.read(key: "accessToken");
    
    final isValid = await _authStateNotifier.isAccessTokenValid();
    
    final userAccesToken = await _authStateNotifier.getToken();
    
    if(userAccesToken == null){
      throw Exception("User is not loggedd in");
    }
    
    if(isValid!){
      
    }

    for(var route in routes){
      try{

      }catch (e){
        throw new Exception(e);
      }

    }
  }
  
}
