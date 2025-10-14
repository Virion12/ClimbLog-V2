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
  }

  Future<void> _addTestPlan() async {
    setState(() {
      _isAdding = true;
    });

    try {
      final List<String> dayNames = [
        'Monday',
        'Tuesday',
        'Wednesday',
        'Thursday',
        'Friday',
        'Saturday',
        'Sunday'
      ];

      final List<WorkoutDayInput> allDays = List.generate(7, (index) {
        return WorkoutDayInput(
          dayOfWeek: index, // 0–6
          sessions: [
            WorkoutSessionInput(
              name: '${dayNames[index]} - Session 1',
              location: 'Gym A',
              start: '08:00',
              exercises: [
                ExerciseInput(name: 'Push-ups', setNumber: 3, repNumber: 15),
                ExerciseInput(name: 'Pull-ups', setNumber: 3, repNumber: 8),
                ExerciseInput(name: 'Plank', time: 60),
              ],
            ),
            WorkoutSessionInput(
              name: '${dayNames[index]} - Session 2',
              location: 'Gym B',
              start: '17:00',
              exercises: [
                ExerciseInput(name: 'Squats', setNumber: 4, repNumber: 10),
                ExerciseInput(name: 'Lunges', setNumber: 3, repNumber: 12),
                ExerciseInput(name: 'Jump Rope', time: 120),
              ],
            ),
          ],
        );
      });

      final planId = await _service.addWorkoutPlan(
        name: 'Full Week Training Plan',
        isPublic: true,
        days: allDays,
      );

      print('✅ Workout plan added with ID: $planId');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('✅ Workout plan added! ID: $planId')),
      );

      await _loadPlans();
    } catch (e) {
      print('❌ Error adding plan: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('❌ Error adding workout plan')),
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
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green.shade600,
            padding: const EdgeInsets.symmetric(vertical: 14),
          ),
          child: _isAdding
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Text(
                  'Add Test Workout Plan',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
        ),
        const SizedBox(height: 20),
        const Text(
          'All Workout Plans:',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        if (_plans.isEmpty)
          const Text('No plans in database.')
        else
          ..._plans.map((plan) => Card(
                margin: const EdgeInsets.symmetric(vertical: 4),
                child: ListTile(
                  title: Text(plan.plan.name),
                  subtitle: Text(
                      '${plan.days.length} days • ${plan.days.fold(0, (sum, d) => sum + d.sessions.length)} sessions total'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.redAccent),
                    onPressed: () async {
                      await _service.removeWorkoutPlan(plan.plan.id);
                      await _loadPlans();
                    },
                  ),
                ),
              )),
      ],
    );
  }
}
