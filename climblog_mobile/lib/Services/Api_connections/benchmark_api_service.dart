import 'dart:convert';
import 'dart:io';
import 'package:climblog_mobile/Services/Auth/auth_service.dart';
import 'package:climblog_mobile/Services/local_db/benchmark_service.dart';
import 'package:flutter/material.dart';
import 'package:http/io_client.dart';

class BenchmarkApiService {
final String baseUrl = "https://10.0.2.2:7116"; 
final AuthService _authService;
final BenchmarkService _benchmarkServiceLocal;

  IOClient _createIoClient() {
    final client = HttpClient()
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
    return IOClient(client);
  }

  BenchmarkApiService(this._authService, this._benchmarkServiceLocal);

  Future<String> _validateToken() async {
  final token = await _authService.tokenValidation();
  return token;
  }

Future<String> _getUserId() async {
  final userId = await _authService.getUserId();
  if (userId == null) {
    throw Exception("User ID not found. User might not be logged in.");
  }
  return userId;
  }

  //Add

  Future<void> AddBenchmark(int id,bool isConnected) async{
   
    final benchmark = await _benchmarkServiceLocal.getOne(id);
    final userId = await _getUserId();

    if(userId.isEmpty){
      throw Exception("No userID");
    }

    final userAccessToken = await _validateToken();

    final url =Uri.parse("$baseUrl/api/Benchmark");
    final body = jsonEncode({
      "userID": int.parse(userId),
      "bodyWeight": benchmark.bodyWeight,
      "ex1Points": benchmark.ex1Points,
      "ex2Points": benchmark.ex2Points,
      "ex3Points": benchmark.ex3Points,
      "ex4Points": benchmark.ex4Points
    });
    debugPrint("Request body: $body");

    final ioClient = _createIoClient();
    final response = await ioClient.post(
      url,
      headers: {"Content-Type": "application/json", "Accept": "application/json","Authorization" : "Bearer $userAccessToken"},
      body: body,
    );
    ioClient.close();
    debugPrint("------------------------------Response from backend------------------------------");
    debugPrint("Response status: ${response.statusCode}");
    debugPrint("Response body: ${response.body}");


    if(response.statusCode != 200 ){
      throw Exception("Adding benchmark to the backend failed");
    }
    final data = jsonDecode(response.body);
    final benchmarkIdFromBackend = data["id"];
    await _benchmarkServiceLocal.ToogleThatItIsInBackend(id, benchmarkIdFromBackend);

  }

  Future<void> GetAll()async{
      final userAccessToken = await _validateToken();
      final ioClient = _createIoClient();
      try{
        final url =Uri.parse("$baseUrl/api/Benchmark");
        final response = await ioClient.get(
            url,
            headers: {"Content-Type": "application/json", "Accept": "application/json","Authorization" : "Bearer $userAccessToken"},
          );

        debugPrint("------------------------------Response from backend------------------------------");
        debugPrint("Response status: ${response.statusCode}");
        debugPrint("Response body: ${response.body}");
        if(response.statusCode != 200){
          throw Exception("Error retriving benchmarks from server");
        }
        final data = jsonDecode(response.body);
        
        for(var benchmark in data){
          try{
           await _benchmarkServiceLocal.Addbenchmark(
            backendId: benchmark["id"],
            body_weight: benchmark["bodyWeight"],
             ex1_points: benchmark["ex1Points"],
              ex2_points: benchmark["ex2Points"],
               ex3_points: benchmark["ex3Points"],
                ex4_points: benchmark["ex4Points"]);
        
          }catch (e){
            debugPrint("$e");
            continue;
          }
        }
        

      }catch (e){
        
        rethrow; 
      }finally{
        ioClient.close();
      }
  }

  //Remove Benchmark
  Future<void> RemoveBenchmark(int id) async{
    final userAccessToken = await _validateToken();
    final benchmark = await _benchmarkServiceLocal.getOne(id);
    final backendId = benchmark.backendId;

    if(benchmark.backendId == 0){
      await _benchmarkServiceLocal.RemoveBenchmark(id);
      return;
    }

    final url =Uri.parse("$baseUrl/api/Benchmark/$backendId");
    final ioClient = _createIoClient();
    final response = await ioClient.delete(
          url,
          headers: {"Content-Type": "application/json", "Accept": "application/json","Authorization" : "Bearer $userAccessToken"},
    );
    ioClient.close();
    debugPrint("------------------------------Response from backend------------------------------");
    debugPrint("Response status: ${response.statusCode}");
    debugPrint("Response body: ${response.body}");
    if(response.statusCode != 204){
            await  _benchmarkServiceLocal.ToogleToDelete(id);
            throw Exception("removing of the route failed toggled to removal later in service");
    }
    await _benchmarkServiceLocal.RemoveBenchmark(id);
  }

}