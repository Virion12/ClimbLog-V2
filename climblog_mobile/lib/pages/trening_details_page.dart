import 'package:climblog_mobile/Riverpod/auth_riverpod.dart';
import 'package:climblog_mobile/Riverpod/connectivity_riverpod.dart';
import 'package:climblog_mobile/Riverpod/local_trening_riverpod.dart';
import 'package:climblog_mobile/Services/Api_connections/workout_api_service.dart';
import 'package:climblog_mobile/Services/local_db/workout_service.dart';
import 'package:climblog_mobile/Widgets/Shared/basic_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TreningDetailsPage extends ConsumerStatefulWidget {
  const TreningDetailsPage({super.key});

  @override
  ConsumerState<TreningDetailsPage> createState() => _TreningDetailsPageState();
}

class _TreningDetailsPageState extends ConsumerState<TreningDetailsPage> {
  final List<String> dayNames = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];

  bool _isDeleting = false;

  @override
  Widget build(BuildContext context) {
    final selected = ref.watch(selectedWorkoutProvider);

    if (selected == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) Navigator.of(context).pop();
      });
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final daysMap = <int, WorkoutDayFull>{};
    for (var day in selected.days) {
      daysMap[day.day.workoutDayOfWeek] = day;
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        title: const Text("Workout Plan Details"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Header with plan info
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                Text(
                  selected.plan.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 34, 34, 34),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.calendar_today, 
                      size: 14, 
                      color: Colors.grey.shade600
                    ),
                    const SizedBox(width: 6),
                    Text(
                      "${selected.plan.createdAt.day}.${selected.plan.createdAt.month}.${selected.plan.createdAt.year} "
                      "${selected.plan.createdAt.hour}:${selected.plan.createdAt.minute.toString().padLeft(2, '0')}",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Training days section
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 4, bottom: 12),
                    child: Text(
                      "Training days",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  for (int i = 0; i < dayNames.length; i++)
                    _buildDayCard(dayNames[i], i, daysMap[i]),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),

          // Bottom action button
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: SafeArea(
              child: SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.red.shade700,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: _isDeleting ? null : () async {
                    setState(() {
                      _isDeleting = true;
                    });

                    try {
                      final serviceWorkout = WorkoutService();
                      final isConnected = await ref.read(connectivityProvider.future);
                      final auth = ref.read(authServiceProvider);
                      
                      if (isConnected) {
                        final workoutServiceApi = WorkoutApiService(auth, serviceWorkout);
                        await workoutServiceApi.RemoveWorkoutPlan(selected.plan.id);
                      } else {
                        if (selected.plan.backendId != null && selected.plan.backendId != 0) {
                          await serviceWorkout.toogleIstoDelete(selected.plan.id, selected.plan.backendId!);
                        } else {
                          await serviceWorkout.removeWorkoutPlan(selected.plan.id);
                        }
                      }
                      
                      if (mounted) {
                        Navigator.of(context).pop();
                      }
                    } catch (e) {
                      if (mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Error deleting plan: $e'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    } finally {
                      if (mounted) {
                        setState(() {
                          _isDeleting = false;
                        });
                      }
                    }
                  },
                  icon: _isDeleting 
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      )
                    : const Icon(Icons.delete_outline, size: 20),
                  label: Text(
                    _isDeleting ? "Deleting..." : "Delete",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDayCard(String day, int dayIndex, WorkoutDayFull? dayWorkout) {
    final hasActiveSessions = dayWorkout != null && dayWorkout.sessions.isNotEmpty;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: hasActiveSessions 
            ? Border.all(color: Colors.black, width: 1.5)
            : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          title: Row(
            children: [
              Text(
                day,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              if (hasActiveSessions) ...[
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    "${dayWorkout.sessions.length}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ],
          ),
          children: [
            Padding(
              padding: const EdgeInsets.all(14),
              child: hasActiveSessions
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (var session in dayWorkout.sessions)
                          _buildSessionCard(session),
                      ],
                    )
                  : const Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          'No sessions planned',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSessionCard(WorkoutSessionFull session) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            session.session.name,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
              color: Color(0xFF00a896),
            ),
          ),
          const SizedBox(height: 6),
          if (session.session.start != null) ...[
            Row(
              children: [
                Icon(Icons.access_time, size: 14, color: Colors.grey.shade700),
                const SizedBox(width: 6),
                Text(
                  "Start: ${session.session.start}",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
          ],
          if (session.session.location != null) ...[
            Row(
              children: [
                Icon(Icons.location_on, size: 14, color: Colors.grey.shade700),
                const SizedBox(width: 6),
                Text(
                  session.session.location!,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
          ],
          if (session.exercises.isNotEmpty) ...[
            const Divider(height: 20),
            const Text(
              "Exercises:",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: session.exercises.map((exercise) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        exercise.name,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _buildExerciseDetails(exercise),
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ] else ...[
            const SizedBox(height: 8),
            Text(
              "No exercises added",
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade600,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ],
      ),
    );
  }

  String _buildExerciseDetails(dynamic exercise) {
    List<String> details = [];
    
    if (exercise.setNumber != null && exercise.setNumber > 0) {
      details.add("Sets: ${exercise.setNumber}");
    }
    if (exercise.repNumber != null && exercise.repNumber > 0) {
      details.add("Reps: ${exercise.repNumber}");
    }
    if (exercise.time != null && exercise.time > 0) {
      details.add("Time: ${exercise.time.toInt()}s");
    }
    if (exercise.breakTime != null && exercise.breakTime > 0) {
      details.add("Break: ${exercise.breakTime.toInt()}s");
    }
    
    return details.isEmpty ? "No details" : details.join(" • ");
  }
}