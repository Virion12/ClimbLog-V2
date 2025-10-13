import 'package:climblog_mobile/Riverpod/trening.riverpod.dart';
import 'package:climblog_mobile/Services/local_db/workout_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final workoutServiceProvider = Provider<WorkoutService>((ref) {
  return WorkoutService();
});

final workoutPlansProvider = StreamProvider.autoDispose<List<WorkoutPlanFull>>((ref) {
  final workoutService = ref.watch(workoutServiceProvider);
  return workoutService.watchAllWorkoutPlans(); 
});

final selectedWorkoutProvider = StateProvider<WorkoutPlanFull?>((ref) => null);

final mainWorkoutPlanProvider = Provider<WorkoutPlanFull?>((ref) {
  final plansAsync = ref.watch(workoutPlansProvider);

  return plansAsync.maybeWhen(
    data: (plans) {
      try {
        return plans.firstWhere((plan) => plan.plan.isMain == true);
      } catch (_) {
        return null;
      }
    },
    orElse: () => null,
  );
});

final sessionsForSelectedDayProvider = Provider<List<WorkoutSessionFull>>((ref) {
  final mainPlan = ref.watch(mainWorkoutPlanProvider);
  final selectedDayName = ref.watch(selectedDay);
  
  if (mainPlan == null || selectedDayName == null) {
    return [];
  }
  
  final dayMap = {
    'monday': 0,
    'tuesday': 1,
    'wednesday': 2,
    'thursday': 3,
    'friday': 4,
    'saturday': 5,
    'sunday': 6,
  };
  
  final selectedDayNumber = dayMap[selectedDayName.toLowerCase()];
  
  if (selectedDayNumber == null) {
    return [];
  }
  
  final matchingDay = mainPlan.days.where(
    (day) => day.day.workoutDayOfWeek == selectedDayNumber
  ).firstOrNull;
  
  return matchingDay?.sessions ?? [];
});

