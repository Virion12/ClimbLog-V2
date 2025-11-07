import 'dart:convert';
import 'dart:io';
import 'package:climblog_mobile/Services/Api_connections/file_api.dart';
import 'package:climblog_mobile/Services/Auth/auth_service.dart';
import 'package:climblog_mobile/Services/local_db/route_service.dart';
import 'package:climblog_mobile/database/database.dart';
import 'package:flutter/material.dart';
import 'package:http/io_client.dart';
import 'package:path_provider/path_provider.dart';

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

  RouteServiceApi(this._db, this._authService, this._localRouteService);



  
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

    Future<void> getMyAll() async{
      // List<ClimbingRoute> routesFromBackend = ;
      final userAccessToken = await tokenValidation();



      final ioClient = _createIoClient();
      try{
        final url = Uri.parse("$baseUrl/api/Route/my-all");
        final response = await ioClient.get(
          url,
          headers: {
            "Content-Type": "application/json", 
            "Accept": "application/json",
            "Authorization": "Bearer $userAccessToken"
          }
        );
        debugPrint("Response status: ${response.statusCode}");
        debugPrint("Response body: ${response.body}");
        if (response.statusCode != 200) {
          throw Exception("adding of the route failed");
        }
        final List<dynamic> data = jsonDecode(response.body);
        final fileService = FileService();
        for(var route in data){
          try{
            String? localPath;
            if(route['imagePath'] != null && route['imagePath'] != ""){
              
              await fileService.downloadFileApi(route['imagePath']);
              localPath = route['imagePath'];
            }
            await _localRouteService.addRoute(
                  name: route['name'] ?? '',
                  color: route['color'] ?? '',
                  height: (route['heigth'] is num) ? (route['heigth'] as num).toDouble() : 0.0,
                  isPowery: route['isPowery'] ?? false,
                  isSloppy: route['isSloppy'] ?? false,
                  isDynamic: route['isDynamic'] ?? false,
                  isCrimpy: route['isCrimpy'] ?? false,
                  isReachy: route['isReachy'] ?? false,
                  isOnsighted: route['isOnsighted'] ?? false,
                  isRedPointed: route['isRedPointed'] ?? false,
                  isFlashed: route['isFlashed'] ?? false,
                  isFavorite: route['isFavorite'] ?? false,
                  backendId: route['id'],
                  numberOfTried: route['numberOfTried'] ?? 0,
                  isDone: route['isDone'] ?? false,
                  grade: route['grade'] ?? '4a',
                  imagePathLocal: localPath ?? '',
                  imagePathBackend: route['imagePath'] ?? '',
                  thumbnailPath: route['thumbnailPath'] ?? '',
                  createdAt: DateTime.tryParse(route['createdAt'] ?? ''),
                  lastUpdatedAt: DateTime.tryParse(route['lastUpdatedAt'] ?? ''),
                  isToUpdate: false,
                  isToDelete: false,
                  isAddedToBackend: true,
                  isImagePendingUpdate: false,
                );

          }catch (e){
            debugPrint("Failed to add route due to : $e");
            continue;
          }
        }

      }catch(e){
        throw Exception(e);
      }


    }

  /// Dodaje trasę do backendu
  /// Wysyła imagePathBackend (jeśli istnieje) do API
  Future<void> AddRoute(int id) async {
    var route = await (_db.select(_db.climbingRoutes)..where((r) => r.id.equals(id))).getSingle();

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
      "imagePath": route.imagePathBackend
    });

    debugPrint("Request body: $body");

    final ioClient = _createIoClient();
    final response = await ioClient.post(
      url,
      headers: {
        "Content-Type": "application/json", 
        "Accept": "application/json",
        "Authorization": "Bearer $userAccessToken"
      },
      body: body,
    );

    debugPrint("Response status: ${response.statusCode}");
    debugPrint("Response body: ${response.body}");

    if (response.statusCode != 200) {
      throw Exception("adding of the route failed");
    }
    ioClient.close();
    
    final data = jsonDecode(response.body);
    final routeid = data["routeid"];
    await _localRouteService.markRouteAsUploaded(id, routeid);
  }

  /// Usuwa trasę z backendu i lokalnie
  /// Usuwa oba pliki: lokalny i backendowy
  Future<void> RemoveRoute(int id, bool isConnected) async {
    final route = await (_db.select(_db.climbingRoutes)..where((r) => r.id.equals(id))).getSingle();
    final routeId = route.backendId;
    final isAdded = route.isAddedToBackend;
    
    debugPrint("Removing route - backendId: $routeId, isAddedToBackend: $isAdded");

    // Jeśli trasa nie jest w backendzie, po prostu usuń lokalnie
    if (routeId == 0 || isAdded == false) {
      // Usuń lokalny plik jeśli istnieje
      if (route.imagePathLocal.isNotEmpty) {
        final fileService = FileService();
        await fileService.RemoveFileLocal(route.imagePathLocal);
      }
      await _localRouteService.removeRoute(id);
      return;
    }

    if (isConnected) {
      try {
        final userAccessToken = await tokenValidation();
        bool isFileRemovedFromBackend = true;
        
        // Usuń plik z backendu jeśli istnieje
        if (route.imagePathBackend.isNotEmpty) {
          final fileService = FileService();
          isFileRemovedFromBackend = await fileService.RemoveFileAPi(route.imagePathBackend);
        }

        // ZAWSZE usuń lokalny plik
        if (route.imagePathLocal.isNotEmpty) {
          final fileService = FileService();
          await fileService.RemoveFileLocal(route.imagePathLocal);
        }
        
        if (isFileRemovedFromBackend) {
          // Usuń trasę z backendu
          final url = Uri.parse("$baseUrl/api/Route/$routeId");
          final ioClient = _createIoClient();
          final response = await ioClient.delete(
            url,
            headers: {
              "Content-Type": "application/json", 
              "Accept": "application/json",
              "Authorization": "Bearer $userAccessToken"
            },
          );
          
          debugPrint("Response status: ${response.statusCode}");

          if (response.statusCode != 204) {
            throw Exception("removing of the route failed");
          }
          
          // Usuń z lokalnej bazy
          await _localRouteService.removeRoute(route.id);
        } else {
          // Nie udało się usunąć z backendu, oznacz do późniejszego usunięcia
          await _localRouteService.markRouteAsToDeletion(id);
        }
      } catch (e) {
        debugPrint("Error during route removal: $e");
        await _localRouteService.markRouteAsToDeletion(id);
      }
    } else {
      // Brak połączenia - usuń lokalny plik i oznacz do usunięcia
      if (route.imagePathLocal.isNotEmpty) {
        final fileService = FileService();
        await fileService.RemoveFileLocal(route.imagePathLocal);
      }
      await _localRouteService.markRouteAsToDeletion(id);
    }
  }

/// Synchronizuje trasę z backendem
/// Używane w background sync do synchronizacji tras z oczekującymi zmianami
/// Obsługuje zarówno aktualizację danych jak i synchronizację obrazów
Future<bool> syncRoute(ClimbingRoute route) async {
  debugPrint("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
  debugPrint(" Starting sync for route: ${route.name} (ID: ${route.id}, BackendID: ${route.backendId})");
  debugPrint("   isAddedToBackend: ${route.isAddedToBackend}");
  debugPrint("   isToUpdate: ${route.isToUpdate}");
  debugPrint("   isImagePendingUpdate: ${route.isImagePendingUpdate}");
  debugPrint("   imagePathLocal: '${route.imagePathLocal}'");
  debugPrint("   imagePathBackend: '${route.imagePathBackend}'");
  
  if (!route.isAddedToBackend || route.backendId == 0) {
    debugPrint(" Cannot sync route that hasn't been added to backend yet");
    return false;
  }
  
  if (!route.isToUpdate && !route.isImagePendingUpdate) {
    debugPrint(" No pending updates for route: ${route.name}");
    return true;
  }
  
  final fileService = FileService();
  bool needsBackendUpdate = false;
  String finalImagePathBackend = route.imagePathBackend;
  
  debugPrint("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
  
  try {
    // KROK 1: Synchronizacja obrazu jeśli jest oczekująca
    if (route.isImagePendingUpdate) {
      debugPrint(" Syncing image for route: ${route.name}");
      
      // Case A: Nowy obraz lokalny czeka na upload do backendu
      if (route.imagePathLocal.isNotEmpty && route.imagePathBackend.isEmpty) {
        debugPrint(" Case A: Uploading new image to backend");
        String path = (await getApplicationDocumentsDirectory()).path;
        final file = File('$path/${route.imagePathLocal}');
        
        if (await file.exists()) {
          try {
            // Upload do backendu
            finalImagePathBackend = await fileService.uploadFileApi(file);
            debugPrint(" Image uploaded to backend: $finalImagePathBackend");
            
            // Zaktualizuj lokalną ścieżkę backendową
            await _localRouteService.addImagePathBackend(route.id, finalImagePathBackend);
            await _localRouteService.toogleImagePendingUpdate(route.id, false);
            needsBackendUpdate = true;
          } catch (e) {
            debugPrint(" Failed to upload image: $e");
            return false;
          }
        } else {
          debugPrint(" Local image file not found: ${route.imagePathLocal}");
          // Kontynuuj bez obrazu - aktualizuj tylko dane
          await _localRouteService.toogleImagePendingUpdate(route.id, false);
        }
      }
      
      // Case B: Obraz został usunięty lokalnie, usuń również z backendu
      else if (route.imagePathLocal.isEmpty && route.imagePathBackend.isNotEmpty) {
        debugPrint(" Case B: Removing image from backend");
        try {
          bool removed = await fileService.RemoveFileAPi(route.imagePathBackend);
          
          if (removed) {
            debugPrint(" Image removed from backend");
            finalImagePathBackend = "";
            await _localRouteService.addImagePathBackend(route.id, "");
            await _localRouteService.toogleImagePendingUpdate(route.id, false);
            needsBackendUpdate = true;
          } else {
            debugPrint(" Failed to remove image from backend");
            return false;
          }
        } catch (e) {
          debugPrint(" Error removing image from backend: $e");
          return false;
        }
      }
      
      // Case C: Obraz został zmieniony - lokalny różni się od backendowego
      else if (route.imagePathLocal.isNotEmpty && 
               route.imagePathBackend.isNotEmpty &&
               route.imagePathLocal != route.imagePathBackend) {
        debugPrint("Case C: Replacing image in backend");
        String path = (await getApplicationDocumentsDirectory()).path;
        final newFile = File('$path/${route.imagePathLocal}');
        
        if (await newFile.exists()) {
          try {
            // 1. Usuń stary obraz z backendu
            debugPrint("Removing old image: ${route.imagePathBackend}");
            bool oldRemoved = await fileService.RemoveFileAPi(route.imagePathBackend);
            
            if (oldRemoved) {
              debugPrint(" Old image removed from backend: ${route.imagePathBackend}");
            } else {
              debugPrint(" Failed to remove old image, continuing with upload...");
            }
            
            // 2. Upload nowego obrazu
            debugPrint(" Uploading new image: ${route.imagePathLocal}");
            finalImagePathBackend = await fileService.uploadFileApi(newFile);
            debugPrint(" New image uploaded to backend: $finalImagePathBackend");
            
            // 3. Zaktualizuj lokalną ścieżkę backendową
            await _localRouteService.addImagePathBackend(route.id, finalImagePathBackend);
            await _localRouteService.toogleImagePendingUpdate(route.id, false);
            needsBackendUpdate = true;
            
          } catch (e) {
            debugPrint(" Failed to update image: $e");
            return false;
          }
        } else {
          debugPrint(" New local image file not found: ${route.imagePathLocal}");
          // Zresetuj flagę i kontynuuj z aktualizacją danych
          await _localRouteService.toogleImagePendingUpdate(route.id, false);
        }
      }
      
      // Case D: Oba są takie same - prawdopodobnie już zsynchronizowane
      else if (route.imagePathLocal.isNotEmpty && 
               route.imagePathBackend.isNotEmpty &&
               route.imagePathLocal == route.imagePathBackend) {
        debugPrint(" Case D: Image already synced");
        await _localRouteService.toogleImagePendingUpdate(route.id, false);
      }
      
      // Case E: Oba są puste - brak obrazu do synchronizacji
      else if (route.imagePathLocal.isEmpty && route.imagePathBackend.isEmpty) {
        debugPrint("ℹCase E: No image to sync");
        await _localRouteService.toogleImagePendingUpdate(route.id, false);
      }
    }
    
    // KROK 2: Synchronizacja danych trasy jeśli są oczekujące zmiany
    if (route.isToUpdate || needsBackendUpdate) {
      debugPrint(" Syncing route data for: ${route.name}");
      
      try {
        final token = await _authService.tokenValidation();
        final url = Uri.parse("$baseUrl/api/Route/update-route-by-id");
        final ioClient = _createIoClient();
        
        final body = jsonEncode({
          "id": route.backendId,
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
          "imagePath": finalImagePathBackend,
        });
        
        debugPrint(" Sending update to backend for route ${route.backendId}");
        debugPrint(" Body: $body");
        final response = await ioClient.patch(
          url,
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          },
          body: body,
        );
        
        debugPrint("Response status: ${response.statusCode}");
        debugPrint("Response body: ${response.body}");
        
        if (response.statusCode == 204 || response.statusCode == 200) {
          debugPrint(" Route data synced successfully");
          
          // Wyczyść flagi synchronizacji
          await _localRouteService.toogleIsPendingUpdate(route.id, false);
          
          return true;
        } else {
          debugPrint(" Failed to sync route data: ${response.statusCode}");
          debugPrint("Response body: ${response.body}");
          return false;
        }
      } catch (e) {
        debugPrint(" Error syncing route data: $e");
        return false;
      }
    }
    
    debugPrint(" Route sync completed successfully");
    return true;
    
  } catch (e) {
    debugPrint(" Unexpected error in syncRoute: $e");
    return false;
  }
}
 /// Aktualizuje trasę
/// KLUCZOWA LOGIKA: obraz ZAWSZE jest przechowywany lokalnie
Future<bool> updateRoute(ClimbingRoute route, bool isConnected, File? newFile) async {
  try {
    final fileService = FileService();

    String newImagePathLocal = route.imagePathLocal;
    String newImagePathBackend = route.imagePathBackend;
    bool hasImageChanged = false;
    
    debugPrint("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
    debugPrint(" UPDATE ROUTE START");
    debugPrint("   Route ID: ${route.id}");
    debugPrint("   Current imagePathLocal: '$newImagePathLocal'");
    debugPrint("   Current imagePathBackend: '$newImagePathBackend'");
    debugPrint("   NewFile provided: ${newFile != null}");
    debugPrint("   Is connected: $isConnected");
    debugPrint("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");

    // CASE 1: Użytkownik usunął obraz
    if (newFile == null && route.imagePathLocal.isNotEmpty) {
      debugPrint(" CASE 1: User removed the image");
      hasImageChanged = true;
      
      // Usuń z backendu jeśli istnieje i jest połączenie
      if (isConnected && route.imagePathBackend.isNotEmpty) {
        try {
          bool removedBackend = await fileService.RemoveFileAPi(route.imagePathBackend);
          if (removedBackend) {
            debugPrint(" Image removed from backend");
            newImagePathBackend = "";
            await _localRouteService.toogleImagePendingUpdate(route.id, false);
          } else {
            debugPrint(" Failed to remove from backend, marking for later");
            await _localRouteService.toogleImagePendingUpdate(route.id, true);
          }
        } catch (e) {
          debugPrint(" Error removing from backend: $e");
          await _localRouteService.toogleImagePendingUpdate(route.id, true);
        }
      } else if (!isConnected && route.imagePathBackend.isNotEmpty) {
        // Brak połączenia - oznacz do usunięcia później
        debugPrint(" No connection - will remove from backend later");
        await _localRouteService.toogleImagePendingUpdate(route.id, true);
      }
      
      // ZAWSZE usuń lokalny plik
      await fileService.RemoveFileLocal(route.imagePathLocal);
      newImagePathLocal = "";
      debugPrint(" Local image removed");
    }

    // CASE 2: Użytkownik dodał/zmienił obraz
    else if (newFile != null) {
      debugPrint(" CASE 2: User added/changed the image");
      hasImageChanged = true;
      
      // Usuń stary lokalny plik jeśli istnieje
      if (route.imagePathLocal.isNotEmpty) {
        await fileService.RemoveFileLocal(route.imagePathLocal);
        debugPrint(" Old local image removed: ${route.imagePathLocal}");
      }

      // ZAWSZE zapisz nowy obraz lokalnie
      String savedFileName = await fileService.uploadFileLocally(newFile);
      newImagePathLocal = savedFileName;
      debugPrint(" New image saved locally: $newImagePathLocal");

      // Jeśli jest połączenie, spróbuj też upload do backendu
      if (isConnected) {
        try {
          // Usuń stary plik z backendu jeśli istnieje
          if (route.imagePathBackend.isNotEmpty) {
            await fileService.RemoveFileAPi(route.imagePathBackend);
            debugPrint(" Old backend image removed: ${route.imagePathBackend}");
          }
          
          // Upload do backendu
          String uploadedFileName = await fileService.uploadFileApi(newFile);
          newImagePathBackend = uploadedFileName;
          debugPrint(" New image uploaded to backend: $newImagePathBackend");
          await _localRouteService.toogleImagePendingUpdate(route.id, false);
        } catch (e) {
          debugPrint(" Backend upload failed: $e. Image will sync later.");
          newImagePathBackend = "";
          await _localRouteService.toogleImagePendingUpdate(route.id, true);
        }
      } else {
        // Brak połączenia - obraz czeka na upload
        debugPrint(" No connection - image will be uploaded later");
        newImagePathBackend = "";
        await _localRouteService.toogleImagePendingUpdate(route.id, true);
      }
    }

    debugPrint("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
    debugPrint(" UPDATE SUMMARY:");
    debugPrint("   hasImageChanged: $hasImageChanged");
    debugPrint("   New imagePathLocal: '$newImagePathLocal'");
    debugPrint("   New imagePathBackend: '$newImagePathBackend'");
    debugPrint("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");

    // Zaktualizuj lokalną bazę danych
    await _localRouteService.updateRoute(
      id: route.id,
      name: route.name,
      color: route.color,
      height: route.height,
      grade: route.grade,
      numberOfTried: route.numberOfTried,
      isPowery: route.isPowery,
      isSloppy: route.isSloppy,
      isDynamic: route.isDynamic,
      isCrimpy: route.isCrimpy,
      isReachy: route.isReachy,
      isOnsighted: route.isOnsighted,
      isRedPointed: route.isRedPointed,
      isFlashed: route.isFlashed,
      isFavorite: route.isFavorite,
      isDone: route.isDone,
      imagePathLocal: newImagePathLocal,
      imagePathBackend: newImagePathBackend,
      thumbnailPath: route.thumbnailPath,
      isimageToUpdate: hasImageChanged,
    );

    debugPrint(" Local DB updated");

    // Zaktualizuj backend jeśli trasa jest już zsynchronizowana
    if (route.isAddedToBackend && route.backendId != 0 && isConnected) {
      debugPrint("📤 Updating backend...");
      try {
        final userAccessToken = await tokenValidation();
        final url = Uri.parse("$baseUrl/api/Route/update-route-by-id");
        final body = jsonEncode({
          "id": route.backendId,
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
          "imagePath": newImagePathBackend,
        });

        final ioClient = _createIoClient();
        final response = await ioClient.patch(
          url,
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
            "Authorization": "Bearer $userAccessToken"
          },
          body: body,
        );

        if (response.statusCode != 200) {
          debugPrint(" Backend update failed with status: ${response.statusCode}");
          await _localRouteService.toggleUpdate(route.id);
          return false;
        }
        
        debugPrint("Backend updated successfully");
      } catch (e) {
        debugPrint(" Error updating route on backend: $e");
        await _localRouteService.toggleUpdate(route.id);
        return false;
      }
    }

    debugPrint("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
    debugPrint(" UPDATE ROUTE COMPLETED SUCCESSFULLY");
    debugPrint("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
    
    return true;
  } catch (e) {
    debugPrint("UpdateRoute error: $e");
    return false;
  }
}
}