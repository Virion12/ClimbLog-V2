import 'package:climblog_mobile/Riverpod/local_benchamrks_riverpod.dart';
import 'package:climblog_mobile/Services/local_db/workout_service.dart';
import 'package:flutter/material.dart';

class WorkoutAddButton extends StatefulWidget {
  const WorkoutAddButton({super.key});

  @override
  State<WorkoutAddButton> createState() => _WorkoutAddButtonState();
}

class _WorkoutAddButtonState extends State<WorkoutAddButton> {
  final WorkoutService _service = WorkoutService();
  bool _isAdding = false;
  List<WorkoutPlanFull> _plans = [];

  @override
  void initState() {
    super.initState();
    _loadPlans();
  }

  Future<void> _loadPlans() async {
    final plans = await _service.getAllWorkoutPlans();
    setState(() {
      _plans = plans;
    });

    for (final plan in plans) {
      print('Plan: ${plan.plan.name} (ID: ${plan.plan.id})');
      for (final day in plan.days) {
        print('  Day ${day.day.workoutDayOfWeek} (ID: ${day.day.id})');
        for (final session in day.sessions) {
          print('   Session: ${session.session.name} (ID: ${session.session.id})');
          for (final ex in session.exercises) {
            print(
                '      Exercise: ${ex.name}, sets: ${ex.setNumber}, reps: ${ex.repNumber}, time: ${ex.time}, break: ${ex.breakTime}');
          }
        }
      }
    }
  }

  Future<void> _addTestPlan() async {
    setState(() {
      _isAdding = true;
    });

    try {
      final planId = await _service.addWorkoutPlan(
        userId: 1,
        name: 'Test Workout Plan',
        days: [
          WorkoutDayInput(
            dayOfWeek: 1,
            sessions: [
              WorkoutSessionInput(
                location: 'Bronx',
                name: 'Upper Body',
                exercises: [
                  ExerciseInput(name: 'Pull-ups', setNumber: 5, repNumber: 10),
                  ExerciseInput(name: 'Push-ups', setNumber: 4, repNumber: 20),
                ],
              ),
            ],
          ),
          WorkoutDayInput(
            dayOfWeek: 3,
            sessions: [
              WorkoutSessionInput(
                name: 'Lower Body',
                exercises: [
                  ExerciseInput(name: 'Squats', setNumber: 5, repNumber: 8),
                  ExerciseInput(name: 'Lunges', setNumber: 3, repNumber: 12),
                ],
              ),
            ],
          ),
        ],
      );

      print('✅ Hardcoded workout plan added with id: $planId');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Workout plan added! ID: $planId')),
      );

      // 🔹 Odśwież listę planów i wypisz je
      await _loadPlans();
    } catch (e) {
      print('❌ Error adding plan: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error adding workout plan')),
      );
    } finally {
      setState(() {
        _isAdding = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
          onPressed: _isAdding ? null : _addTestPlan,
          child: _isAdding
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Text('Add Test Workout Plan'),
        ),
        const SizedBox(height: 20),
        const Text(
          'All Workout Plans:',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        // Expanded(
        //   child: _plans.isEmpty
        //       ? const Text('No plans in database.')
        //       : ListView.builder(
        //           itemCount: _plans.length,
        //           itemBuilder: (context, index) {
        //             final plan = _plans[index];
        //             return Card(
        //               child: ListTile(
        //                 title: Text(plan.plan.name),
        //                 subtitle: Row(
        //                   children: [
        //                     IconButton(
        //                       icon: Icon(Icons.delete),
        //                       onPressed: () async {
        //                         await _service.removeWorkoutPlan(plan.plan.id);
        //                         await _loadPlans(); 
        //                       },
        //                     ),
        //                     Text(
        //                         '${plan.days.length} day(s), ${plan.days.fold(0, (sum, d) => sum + d.sessions.length)} session(s)'),
        //                   ],
        //                 ),
        //               ),
        //             );
        //           },
        //         ),
        // ),
      ],
    );
  }
}
