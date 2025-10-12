import 'package:climblog_mobile/Services/local_db/workout_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final workoutServiceProvider = Provider<WorkoutService>((ref) {
  return WorkoutService();
});

final workoutPlansProvider = StreamProvider.autoDispose<List<WorkoutPlanFull>>((ref) {
  final workoutService = ref.watch(workoutServiceProvider);
  return workoutService.watchAllWorkoutPlans(); // <- metoda zwracająca Stream
});

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
