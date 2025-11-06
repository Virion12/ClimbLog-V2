import 'dart:convert';
import 'dart:io';
import 'package:climblog_mobile/Services/local_db/workout_service.dart';
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

  Future<GeneratedPlanData> predict(String prompt) async {
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

      final Map<String, dynamic> planJson = jsonDecode(response.body);
      
      return _convertJsonToWorkoutData(planJson);
    } catch (e) {
      debugPrint("Error: $e");
      rethrow;
    } finally {
      ioClient.close();
    }
  }

  GeneratedPlanData _convertJsonToWorkoutData(Map<String, dynamic> json) {
    final String name = json['name'] ?? 'Generated Training Plan';
    final List<dynamic> workoutDays = json['workoutDays'] ?? [];

    final List<WorkoutDayInput> days = [];
    
    for (var workoutDay in workoutDays) {
      try {
        final int dayOfWeek = (workoutDay['workoutDayOfWeek'] as int?) ?? 0;
        final List<dynamic> sessions = workoutDay['sessions'] ?? [];

        final List<WorkoutSessionInput> sessionInputs = [];
        
        for (var session in sessions) {
          try {
            final List<dynamic> exercises = session['exercises'] ?? [];

            final List<ExerciseInput> exerciseInputs = [];
            
            for (var ex in exercises) {
              try {
                exerciseInputs.add(ExerciseInput(
                  name: ex['name'] ?? 'Exercise',
                  time: _toDouble(ex['time']),
                  breakTime: _toDouble(ex['breakTime']),
                  setNumber: ex['setNumber'],
                  repNumber: ex['repNumber'],
                ));
              } catch (e) {
                debugPrint("Error parsing exercise: $e");
              }
            }

            sessionInputs.add(WorkoutSessionInput(
              name: session['name'] ?? 'Session',
              location: session['location'],
              start: session['start'] ?? '09:00',
              exercises: exerciseInputs,
            ));
          } catch (e) {
            debugPrint("Error parsing session: $e");
          }
        }

        days.add(WorkoutDayInput(
          dayOfWeek: dayOfWeek + 1,
          sessions: sessionInputs,
        ));
      } catch (e) {
        debugPrint("Error parsing workout day: $e");
      }
    }

    return GeneratedPlanData(
      name: name,
      days: days,
    );
  }

  static double? _toDouble(dynamic value) {
    if (value == null) return null;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) return double.tryParse(value);
    return null;
  }
}

class GeneratedPlanData {
  final String name;
  final List<WorkoutDayInput> days;

  GeneratedPlanData({
    required this.name,
    required this.days,
  });
}