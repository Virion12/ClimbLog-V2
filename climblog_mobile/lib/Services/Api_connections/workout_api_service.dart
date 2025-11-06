import 'dart:convert';
import 'dart:io';
import 'package:climblog_mobile/Services/Auth/auth_service.dart';
import 'package:climblog_mobile/Services/local_db/workout_service.dart';
import 'package:flutter/material.dart';
import 'package:http/io_client.dart';

class WorkoutApiService {
  final String baseUrl = "https://10.0.2.2:7116"; 
  final AuthService _authService;
  final WorkoutService workoutLocalSerrvice;

  WorkoutApiService(this._authService, this.workoutLocalSerrvice);

   IOClient _createIoClient() {
    final client = HttpClient()
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
    return IOClient(client);
  }

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

  Future<void> addWorkoutPlan(int id) async {
  final userId = await _getUserId();

  if (userId.isEmpty) {
    throw Exception("No userID");
  }

  final workoutPlan = await workoutLocalSerrvice.getOneWorkoutPlan(id);

  if (workoutPlan == null) {
    throw Exception("No workout plan found");
  }

  final userAccessToken = await _validateToken();
  final url = Uri.parse("$baseUrl/api/WorkoutPlan");

  
  final plan = workoutPlan.plan;
  final days = workoutPlan.days;

  final body = {
    "isPublic": plan.isPublic,
    "name": plan.name,
    "imagePath": plan.imagePath,
    "workoutDays": days.map((dayFull) {
      final day = dayFull.day;
      return {
        "workoutPlanId": day.workoutPlanId,
        "workoutDayOfWeek": day.workoutDayOfWeek,
        "sessions": dayFull.sessions.map((sessionFull) {
          final session = sessionFull.session;
          return {
            "workoutDayId": session.workoutDayId,
            "start": session.start,
            "location": session.location,
            "name": session.name,
            "exercises": sessionFull.exercises.map((ex) {
              return {
                "workoutSessionId": ex.workoutSessionId,
                "name": ex.name,
                "time": ex.time,
                "breakTime": ex.breakTime,
                "setNumber": ex.setNumber,
                "repNumber": ex.repNumber,
              };
            }).toList(),
          };
        }).toList(),
      };
    }).toList(),
  };

  final jsonBody = jsonEncode(body);
  debugPrint("Request body: $jsonBody");

  final ioClient = _createIoClient();
  final response = await ioClient.post(
    url,
    headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $userAccessToken",
    },
    body: jsonBody,
  );
  ioClient.close();

  debugPrint("------------------------------Response from backend------------------------------");
  debugPrint("Response status: ${response.statusCode}");
  debugPrint("Response body: ${response.body}");

  if (response.statusCode != 200 && response.statusCode != 201) {
    throw Exception("Adding workout plan to backend failed");
  }

  final data = jsonDecode(response.body);
  final planIdFromBackend = data["id"];
  
  await workoutLocalSerrvice.toogleIsAddedToBackend(workoutPlan.plan.id,planIdFromBackend);
}

Future<void> RemoveWorkoutPlan(int id) async{
  final userAccessToken = await _validateToken();
    final plan = await workoutLocalSerrvice.getOneWorkoutPlan(id);

    if(plan == null){
      throw Exception("there is no plan with this id");
    }
    final backendId = plan.plan.backendId;


    if((backendId == 0 || backendId == null) || plan.plan.isAddedToBackend == false){
      await workoutLocalSerrvice.removeWorkoutPlan(id);
      return;
    }

    final url =Uri.parse("$baseUrl/api/WorkoutPlan/$backendId");
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
            await  workoutLocalSerrvice.toogleIstoDelete(id, backendId);
            throw Exception("removing of the route failed toggled to removal later in service");
    }
    await workoutLocalSerrvice.removeWorkoutPlan(id);
}
}

