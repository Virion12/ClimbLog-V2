import 'package:climblog_mobile/Riverpod/auth_riverpod.dart';
import 'package:climblog_mobile/Riverpod/connectivity_riverpod.dart';
import 'package:climblog_mobile/Services/Api_connections/workout_api_service.dart';
import 'package:climblog_mobile/Services/local_db/workout_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TreningAddForm extends ConsumerStatefulWidget {
  const TreningAddForm({super.key});

  @override
  ConsumerState<TreningAddForm> createState() => _TreningAddFormState();
}

class _TreningAddFormState extends ConsumerState<TreningAddForm> {
  final _workoutService = WorkoutService();
  final _nameWorkoutController = TextEditingController();
  
  final Map<String, List<SessionData>> _daysSessions = {};
  final Map<String, TextEditingController> _sessionNameControllers = {};
  final Map<String, TextEditingController> _sessionLocationControllers = {};
  final Map<String, int?> _selectedHours = {};
  final Map<String, int?> _selectedMinutes = {};

  final List<String> dayNames = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];

  @override
  void initState() {
    super.initState();
    for (final day in dayNames) {
      _daysSessions[day] = [];
      _sessionNameControllers[day] = TextEditingController();
      _sessionLocationControllers[day] = TextEditingController();
      _selectedHours[day] = null;
      _selectedMinutes[day] = null;
    }
  }

  void _addSessionForDay(String dayName) {
    final sessionName = _sessionNameControllers[dayName]!.text.trim();
    final sessionLocation = _sessionLocationControllers[dayName]!.text.trim();
    final hour = _selectedHours[dayName];
    final minute = _selectedMinutes[dayName];

    if (sessionName.isEmpty) {
      _showSnackBar("Enter session name for $dayName");
      return;
    }

    if (hour == null || minute == null) {
      _showSnackBar("Select start time for $dayName");
      return;
    }

    setState(() {
      _daysSessions[dayName]!.add(SessionData(
        name: sessionName,
        location: sessionLocation.isEmpty ? null : sessionLocation,
        startTime: "${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}",
        exercises: [],
      ));

      _sessionNameControllers[dayName]!.clear();
      _sessionLocationControllers[dayName]!.clear();
      _selectedHours[dayName] = null;
      _selectedMinutes[dayName] = null;
    });
  }

  void _removeSession(String dayName, int index) {
    setState(() {
      _daysSessions[dayName]!.removeAt(index);
    });
  }

  void _addExerciseToSession(String dayName, int sessionIndex) {
    showDialog(
      context: context,
      builder: (context) => _ExerciseDialog(
        onAdd: (exercise) {
          setState(() {
            _daysSessions[dayName]![sessionIndex].exercises.add(exercise);
          });
        },
      ),
    );
  }

  void _removeExercise(String dayName, int sessionIndex, int exerciseIndex) {
    setState(() {
      _daysSessions[dayName]![sessionIndex].exercises.removeAt(exerciseIndex);
    });
  }

  void _saveWorkout() async {
    if (_nameWorkoutController.text.trim().isEmpty) {
      _showSnackBar("Enter workout plan name");
      return;
    }

    final hasAnySessions = _daysSessions.values.any((sessions) => sessions.isNotEmpty);
    if (!hasAnySessions) {
      _showSnackBar("Add at least one session");
      return;
    }

    try {
      final List<WorkoutDayInput> days = [];

      for (int i = 0; i < dayNames.length; i++) {
        final dayName = dayNames[i];
        final sessions = _daysSessions[dayName]!;

        if (sessions.isNotEmpty) {
          final List<WorkoutSessionInput> sessionInputs = sessions.map((s) {
            return WorkoutSessionInput(
              name: s.name,
              location: s.location,
              start: s.startTime,
              exercises: s.exercises,
            );
          }).toList();

          days.add(WorkoutDayInput(
            dayOfWeek: i + 1,
            sessions: sessionInputs,
          ));
        }
      }

      final id = await _workoutService.addWorkoutPlan(
        name: _nameWorkoutController.text.trim(),
        isPublic: false,
        days: days,
      );

      // Synchronizacja w tle - nie blokuje UI
      _syncToBackendInBackground(id);

      if (mounted) {
        _showSnackBar("Workout plan saved", success: true);
        Navigator.of(context).pop();
      }
    } catch (e) {
      if (mounted) {
        _showSnackBar("Error: $e");
      }
    }
  }

  void _syncToBackendInBackground(int id) async {
    try {
      final isConnected = await ref.read(connectivityProvider.future);
      if (isConnected) {
        final auth = ref.read(authServiceProvider);
        final apiWorkoutService = WorkoutApiService(auth, _workoutService);
        await apiWorkoutService.addWorkoutPlan(id);
        debugPrint("✅ Workout plan synced to backend (ID: $id)");
      } else {
        debugPrint("⚠️ No connection - workout will be synced later");
      }
    } catch (e) {
      debugPrint("❌ Background sync failed: $e");
    }
  }

  void _showSnackBar(String message, {bool success = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: success ? Colors.green : Colors.red.shade700,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  void dispose() {
    _nameWorkoutController.dispose();
    for (final controller in _sessionNameControllers.values) {
      controller.dispose();
    }
    for (final controller in _sessionLocationControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.grey, width: 0.8),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("New Workout Plan"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      backgroundColor: const Color(0xFFF9F9F9),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: _nameWorkoutController,
                    decoration: InputDecoration(
                      labelText: "Workout plan name",
                      filled: true,
                      fillColor: Colors.white,
                      border: inputBorder,
                      enabledBorder: inputBorder,
                      focusedBorder: inputBorder.copyWith(
                        borderSide: const BorderSide(color: Colors.black, width: 1.5),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    "Training days",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),
                  
                  for (final day in dayNames) _buildDayCard(day, inputBorder),
                ],
              ),
            ),
          ),
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
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xFF00a896),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: _saveWorkout,
                  child: const Text(
                    "Save workout plan",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDayCard(String day, OutlineInputBorder inputBorder) {
    final sessions = _daysSessions[day]!;
    final hasActiveSessions = sessions.isNotEmpty;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
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
                    "${sessions.length}",
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (hasActiveSessions) ...[
                    const Text(
                      "Added sessions:",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    for (int i = 0; i < sessions.length; i++)
                      _buildSessionCard(day, i, sessions[i]),
                    const Divider(height: 24),
                  ],
                  const Text(
                    "Add new session:",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _sessionNameControllers[day],
                    decoration: InputDecoration(
                      labelText: "Session name",
                      border: inputBorder,
                      enabledBorder: inputBorder,
                      focusedBorder: inputBorder.copyWith(
                        borderSide: const BorderSide(color: Colors.black, width: 1.5),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _sessionLocationControllers[day],
                    decoration: InputDecoration(
                      labelText: "Location (optional)",
                      border: inputBorder,
                      enabledBorder: inputBorder,
                      focusedBorder: inputBorder.copyWith(
                        borderSide: const BorderSide(color: Colors.black, width: 1.5),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: DropdownButtonFormField<int>(
                          dropdownColor: Colors.white,
                          decoration: InputDecoration(
                            labelText: "Hour",
                            border: inputBorder,
                            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                          ),
                          value: _selectedHours[day],
                          items: List.generate(
                            24,
                            (i) => DropdownMenuItem(
                              value: i,
                              child: Text(i.toString().padLeft(2, '0')),
                            ),
                          ),
                          onChanged: (v) => setState(() => _selectedHours[day] = v),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: DropdownButtonFormField<int>(
                          dropdownColor: Colors.white,
                          decoration: InputDecoration(
                            labelText: "Minute",
                            border: inputBorder,
                            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                          ),
                          value: _selectedMinutes[day],
                          items: List.generate(
                            60,
                            (i) => DropdownMenuItem(
                              value: i,
                              child: Text(i.toString().padLeft(2, '0')),
                            ),
                          ),
                          onChanged: (v) => setState(() => _selectedMinutes[day] = v),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton.icon(
                      style: FilledButton.styleFrom(
                        backgroundColor: const Color(0xFF00a896),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () => _addSessionForDay(day),
                      icon: const Icon(Icons.add_rounded, size: 20),
                      label: const Text("Add session"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSessionCard(String day, int sessionIndex, SessionData session) {
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
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      session.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Start: ${session.startTime}",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    if (session.location != null) ...[
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          Icon(Icons.location_on, size: 12, color: Colors.grey.shade700),
                          const SizedBox(width: 4),
                          Text(
                            session.location!,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.delete_outline, size: 20),
                color: Colors.red.shade700,
                onPressed: () => _removeSession(day, sessionIndex),
              ),
            ],
          ),
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
            for (int i = 0; i < session.exercises.length; i++)
              Container(
                margin: const EdgeInsets.only(bottom: 6),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            session.exercises[i].name,
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            _buildExerciseDetails(session.exercises[i]),
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, size: 16),
                      color: Colors.red.shade600,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () => _removeExercise(day, sessionIndex, i),
                    ),
                  ],
                ),
              ),
          ],
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.black,
                side: const BorderSide(color: Colors.black),
                padding: const EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () => _addExerciseToSession(day, sessionIndex),
              icon: const Icon(Icons.fitness_center, size: 16),
              label: const Text("Add exercise", style: TextStyle(fontSize: 13)),
            ),
          ),
        ],
      ),
    );
  }

  String _buildExerciseDetails(ExerciseInput exercise) {
    List<String> details = [];
    if (exercise.setNumber != null && exercise.setNumber! > 0) {
      details.add("Sets: ${exercise.setNumber}");
    }
    if (exercise.repNumber != null && exercise.repNumber! > 0) {
      details.add("Reps: ${exercise.repNumber}");
    }
    if (exercise.time != null && exercise.time! > 0) {
      details.add("Time: ${exercise.time}s");
    }
    if (exercise.breakTime != null && exercise.breakTime! > 0) {
      details.add("Break: ${exercise.breakTime}s");
    }
    return details.isEmpty ? "No details" : details.join(" • ");
  }
}

class SessionData {
  final String name;
  final String? location;
  final String startTime;
  final List<ExerciseInput> exercises;

  SessionData({
    required this.name,
    this.location,
    required this.startTime,
    required this.exercises,
  });
}

class _ExerciseDialog extends StatefulWidget {
  final Function(ExerciseInput) onAdd;

  const _ExerciseDialog({required this.onAdd});

  @override
  State<_ExerciseDialog> createState() => _ExerciseDialogState();
}

class _ExerciseDialogState extends State<_ExerciseDialog> {
  final _nameController = TextEditingController();
  final _setsController = TextEditingController();
  final _repsController = TextEditingController();
  final _timeController = TextEditingController();
  final _breakController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _setsController.dispose();
    _repsController.dispose();
    _timeController.dispose();
    _breakController.dispose();
    super.dispose();
  }

  void _addExercise() {
    if (_nameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Enter exercise name"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final exercise = ExerciseInput(
      name: _nameController.text.trim(),
      setNumber: int.tryParse(_setsController.text),
      repNumber: int.tryParse(_repsController.text),
      time: double.tryParse(_timeController.text),
      breakTime: double.tryParse(_breakController.text),
    );

    widget.onAdd(exercise);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.grey, width: 0.8),
    );

    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Add exercise",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: "Exercise name *",
                  border: inputBorder,
                  enabledBorder: inputBorder,
                  focusedBorder: inputBorder.copyWith(
                    borderSide: const BorderSide(color: Colors.black, width: 1.5),
                  ),
                ),
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _setsController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Sets",
                        border: inputBorder,
                        enabledBorder: inputBorder,
                        focusedBorder: inputBorder.copyWith(
                          borderSide: const BorderSide(color: Colors.black, width: 1.5),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      controller: _repsController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Reps",
                        border: inputBorder,
                        enabledBorder: inputBorder,
                        focusedBorder: inputBorder.copyWith(
                          borderSide: const BorderSide(color: Colors.black, width: 1.5),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _timeController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Time (s)",
                        border: inputBorder,
                        enabledBorder: inputBorder,
                        focusedBorder: inputBorder.copyWith(
                          borderSide: const BorderSide(color: Colors.black, width: 1.5),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      controller: _breakController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Break (s)",
                        border: inputBorder,
                        enabledBorder: inputBorder,
                        focusedBorder: inputBorder.copyWith(
                          borderSide: const BorderSide(color: Colors.black, width: 1.5),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text("Cancel"),
                  ),
                  const SizedBox(width: 12),
                  FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color(0xFF00a896),
                      foregroundColor: Colors.white,
                    ),
                    onPressed: _addExercise,
                    child: const Text("Add"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}