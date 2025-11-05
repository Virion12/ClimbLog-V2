import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:climblog_mobile/Services/Api_connections/predict_service.dart';

final selectedDay = StateProvider<String?>((ref) {
  final now = DateTime.now();
  const daysOfWeek = [
    'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday',
  ];
  return daysOfWeek[now.weekday - 1]; 
});


class GeneratedPlanNotifier extends StateNotifier<GeneratedPlanData?> {
  GeneratedPlanNotifier() : super(null);

  void setPlan(GeneratedPlanData plan) {
    state = plan;
  }

  void clear() {
    state = null;
  }
}

final generatedPlanProvider =
    StateNotifierProvider<GeneratedPlanNotifier, GeneratedPlanData?>(
  (ref) => GeneratedPlanNotifier(),
);