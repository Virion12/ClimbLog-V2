import 'package:climblog_mobile/Services/local_db/benchmark_service.dart';
import 'package:climblog_mobile/Services/local_db/route_service.dart';
import 'package:climblog_mobile/Services/local_db/workout_service.dart';
import 'package:flutter/material.dart';
import 'package:climblog_mobile/database/database.dart';

class TestDataGenerator extends StatefulWidget {
  final RouteService routeService;
  final WorkoutService workoutService;
  final BenchmarkService benchmarkService;

  const TestDataGenerator({
    Key? key,
    required this.routeService,
    required this.workoutService,
    required this.benchmarkService,
  }) : super(key: key);

  @override
  State<TestDataGenerator> createState() => _TestDataGeneratorState();
}

class _TestDataGeneratorState extends State<TestDataGenerator> {
  bool _isLoading = false;
  String _message = '';

  Future<void> _generateTestData() async {
    setState(() {
      _isLoading = true;
      _message = 'Generowanie danych testowych...';
    });

    try {
      // Generowanie 12 dróg wspinaczkowych
      await _generateRoutes();
      
      // Generowanie 4 planów treningowych
      await _generateWorkoutPlans();
      
      // Generowanie 5 benchmarków
      await _generateBenchmarks();

      setState(() {
        _isLoading = false;
        _message = 'Sukces! Wygenerowano:\n12 dróg\n2 plany treningowe\n5 benchmarków';
      });

      // Pokaż snackbar
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Dane testowe zostały dodane!'),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 3),
          ),
        );
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
        _message = 'Błąd: ${e.toString()}';
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Błąd: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _generateRoutes() async {
    final routes = [
      {
        'name': 'Czerwona Dynamika',
        'color': 'red',
        'grade': '6a',
        'height': 12.5,
        'isDynamic': true,
        'isPowery': true,
        'isDone': true,
        'isFlashed': true,
        'numberOfTried': 1,
      },
      {
        'name': 'Niebieska Płyta',
        'color': 'blue',
        'grade': '5c',
        'height': 10.0,
        'isSloppy': true,
        'isDone': true,
        'isRedPointed': true,
        'numberOfTried': 3,
      },
      {
        'name': 'Zielony Krymper',
        'color': 'green',
        'grade': '6b+',
        'height': 14.0,
        'isCrimpy': true,
        'isPowery': true,
        'isDone': false,
        'numberOfTried': 5,
      },
      {
        'name': 'Żółty Wysięgnik',
        'color': 'yellow',
        'grade': '6c',
        'height': 15.0,
        'isReachy': true,
        'isDone': false,
        'numberOfTried': 7,
        'isFavorite': true,
      },
      {
        'name': 'Czarna Bestia',
        'color': 'black',
        'grade': '7a',
        'height': 16.0,
        'isPowery': true,
        'isDynamic': true,
        'isCrimpy': true,
        'isDone': false,
        'numberOfTried': 12,
        'isFavorite': true,
      },
      {
        'name': 'Biała Elegancja',
        'color': 'white',
        'grade': '5a',
        'height': 8.0,
        'isSloppy': true,
        'isDone': true,
        'isOnsighted': true,
        'numberOfTried': 1,
      },
      {
        'name': 'Pomarańczowy Przewieszka',
        'color': 'orange',
        'grade': '6a+',
        'height': 13.0,
        'isPowery': true,
        'isDone': true,
        'isRedPointed': true,
        'numberOfTried': 4,
      },
      {
        'name': 'Różowa Slab',
        'color': 'pink',
        'grade': '5b',
        'height': 9.0,
        'isSloppy': true,
        'isDone': true,
        'isFlashed': true,
        'numberOfTried': 1,
        'isFavorite': true,
      },
      {
        'name': 'Fioletowy Dach',
        'color': 'purple',
        'grade': '6b',
        'height': 11.0,
        'isPowery': true,
        'isDynamic': true,
        'isDone': false,
        'numberOfTried': 6,
      },
      {
        'name': 'Szara Krawędź',
        'color': 'gray',
        'grade': '6a',
        'height': 12.0,
        'isCrimpy': true,
        'isDone': true,
        'isRedPointed': true,
        'numberOfTried': 2,
      },
      {
        'name': 'Brązowy Komin',
        'color': 'brown',
        'grade': '5c',
        'height': 10.5,
        'isReachy': true,
        'isDone': false,
        'numberOfTried': 3,
      },
      {
        'name': 'Turkusowa Techniczna',
        'color': 'turquoise',
        'grade': '6c+',
        'height': 14.5,
        'isCrimpy': true,
        'isSloppy': true,
        'isDone': false,
        'numberOfTried': 8,
        'isFavorite': true,
      },
    ];

    for (final route in routes) {
      await widget.routeService.addRoute(
        name: route['name'] as String,
        color: route['color'] as String,
        grade: route['grade'] as String,
        height: route['height'] as double,
        isDynamic: route['isDynamic'] as bool? ?? false,
        isPowery: route['isPowery'] as bool? ?? false,
        isSloppy: route['isSloppy'] as bool? ?? false,
        isCrimpy: route['isCrimpy'] as bool? ?? false,
        isReachy: route['isReachy'] as bool? ?? false,
        isDone: route['isDone'] as bool? ?? false,
        isFlashed: route['isFlashed'] as bool? ?? false,
        isOnsighted: route['isOnsighted'] as bool? ?? false,
        isRedPointed: route['isRedPointed'] as bool? ?? false,
        numberOfTried: route['numberOfTried'] as int? ?? 0,
        isFavorite: route['isFavorite'] as bool? ?? false,
      );
    }
  }

  Future<void> _generateWorkoutPlans() async {
    // Plan 1: Plan 3-dniowy z podwójnymi sesjami
    await widget.workoutService.addWorkoutPlan(
      name: 'Plan Intensywny 3x',
      isPublic: false,
      days: [
        WorkoutDayInput(
          dayOfWeek: 1, // Poniedziałek
          sessions: [
            WorkoutSessionInput(
              name: 'Rozgrzewka + Siła',
              location: 'Siłownia',
              start: '17:00',
              exercises: [
                ExerciseInput(name: 'Rozgrzewka kardio', time: 600),
                ExerciseInput(name: 'Podciąganie', setNumber: 4, repNumber: 8),
                ExerciseInput(name: 'Pompki', setNumber: 3, repNumber: 15),
              ],
            ),
            WorkoutSessionInput(
              name: 'Hangboard',
              location: 'Siłownia',
              start: '18:30',
              exercises: [
                ExerciseInput(name: 'Max Hangs', time: 10, breakTime: 180, setNumber: 6),
                ExerciseInput(name: 'Repeaters', time: 7, breakTime: 3, setNumber: 12),
                ExerciseInput(name: 'Core - Deska', time: 60, setNumber: 3),
              ],
            ),
          ],
        ),
        WorkoutDayInput(
          dayOfWeek: 3, // Środa
          sessions: [
            WorkoutSessionInput(
              name: 'Wspinaczka Techniczna',
              location: 'Ścianka',
              start: '17:00',
              exercises: [
                ExerciseInput(name: 'Boulder 4x4', time: 30, breakTime: 180, setNumber: 4),
                ExerciseInput(name: 'Projekty techniczne', time: 900),
                ExerciseInput(name: 'Silent feet drill', time: 600),
              ],
            ),
            WorkoutSessionInput(
              name: 'Wytrzymałość',
              location: 'Ścianka',
              start: '19:00',
              exercises: [
                ExerciseInput(name: 'Continuous climbing', time: 300, breakTime: 300, setNumber: 3),
                ExerciseInput(name: 'Traverse', time: 180, setNumber: 4),
              ],
            ),
          ],
        ),
        WorkoutDayInput(
          dayOfWeek: 5, // Piątek
          sessions: [
            WorkoutSessionInput(
              name: 'Power Training',
              location: 'Ścianka',
              start: '18:00',
              exercises: [
                ExerciseInput(name: 'Campus Board - Ladder', setNumber: 5, repNumber: 8),
                ExerciseInput(name: 'Dynamic problems', setNumber: 8, repNumber: 3),
                ExerciseInput(name: 'Limit bouldering', time: 1200),
              ],
            ),
            WorkoutSessionInput(
              name: 'Stretching + Antagonist',
              location: 'Ścianka',
              start: '19:30',
              exercises: [
                ExerciseInput(name: 'Push-ups variations', setNumber: 3, repNumber: 12),
                ExerciseInput(name: 'Shoulder work', setNumber: 3, repNumber: 10),
                ExerciseInput(name: 'Full body stretch', time: 900),
              ],
            ),
          ],
        ),
      ],
    );

    // Plan 2: Plan 4-dniowy z podwójnymi sesjami
    await widget.workoutService.addWorkoutPlan(
      name: 'Plan Kompletny 4x',
      isPublic: true,
      days: [
        WorkoutDayInput(
          dayOfWeek: 1, // Poniedziałek
          sessions: [
            WorkoutSessionInput(
              name: 'Siła Maksymalna',
              location: 'Siłownia',
              start: '18:00',
              exercises: [
                ExerciseInput(name: 'Weighted pull-ups', setNumber: 5, repNumber: 5),
                ExerciseInput(name: 'One arm lock-offs', setNumber: 4, repNumber: 6),
                ExerciseInput(name: 'Finger rolls', setNumber: 3, repNumber: 10),
              ],
            ),
            WorkoutSessionInput(
              name: 'Core Stability',
              location: 'Siłownia',
              start: '19:00',
              exercises: [
                ExerciseInput(name: 'Hanging leg raises', setNumber: 4, repNumber: 12),
                ExerciseInput(name: 'Russian twists', setNumber: 3, repNumber: 20),
                ExerciseInput(name: 'Plank variations', time: 180, setNumber: 3),
              ],
            ),
          ],
        ),
        WorkoutDayInput(
          dayOfWeek: 2, // Wtorek
          sessions: [
            WorkoutSessionInput(
              name: 'Boulder Session',
              location: 'Ścianka',
              start: '17:30',
              exercises: [
                ExerciseInput(name: 'Warm-up problems', setNumber: 5, repNumber: 2),
                ExerciseInput(name: 'Project boulders', time: 1800),
                ExerciseInput(name: 'Flash attempts', setNumber: 6, repNumber: 1),
              ],
            ),
            WorkoutSessionInput(
              name: 'Volume Climbing',
              location: 'Ścianka',
              start: '19:00',
              exercises: [
                ExerciseInput(name: 'Easy laps', setNumber: 10, repNumber: 1),
                ExerciseInput(name: 'Down climbing', setNumber: 5, repNumber: 1),
              ],
            ),
          ],
        ),
        WorkoutDayInput(
          dayOfWeek: 4, // Czwartek
          sessions: [
            WorkoutSessionInput(
              name: 'Fingerboard Protocol',
              location: 'Ścianka',
              start: '18:00',
              exercises: [
                ExerciseInput(name: 'Half crimp hangs', time: 10, breakTime: 180, setNumber: 6),
                ExerciseInput(name: 'Open hand hangs', time: 10, breakTime: 180, setNumber: 6),
                ExerciseInput(name: 'Pinch training', time: 12, breakTime: 120, setNumber: 5),
              ],
            ),
            WorkoutSessionInput(
              name: 'Endurance Routes',
              location: 'Ścianka',
              start: '19:15',
              exercises: [
                ExerciseInput(name: 'Long routes 20m+', setNumber: 4, repNumber: 1),
                ExerciseInput(name: 'Continuous climbing', time: 480, setNumber: 2),
              ],
            ),
          ],
        ),
        WorkoutDayInput(
          dayOfWeek: 6, // Sobota
          sessions: [
            WorkoutSessionInput(
              name: 'Fun Climbing',
              location: 'Ścianka skalna',
              start: '10:00',
              exercises: [
                ExerciseInput(name: 'Outdoor routes', setNumber: 8, repNumber: 1),
                ExerciseInput(name: 'Multi-pitch warm-up', setNumber: 2, repNumber: 1),
              ],
            ),
            WorkoutSessionInput(
              name: 'Recovery & Mobility',
              location: 'Ścianka skalna',
              start: '14:00',
              exercises: [
                ExerciseInput(name: 'Yoga for climbers', time: 1800),
                ExerciseInput(name: 'Foam rolling', time: 600),
                ExerciseInput(name: 'Stretching routine', time: 900),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _generateBenchmarks() async {
    final benchmarks = [
      {
        'body_weight': 72.5,
        'ex1_points': 8,
        'ex2_points': 12,
        'ex3_points': 15,
        'ex4_points': 10,
      },
      {
        'body_weight': 71.0,
        'ex1_points': 10,
        'ex2_points': 14,
        'ex3_points': 16,
        'ex4_points': 12,
      },
      {
        'body_weight': 70.5,
        'ex1_points': 12,
        'ex2_points': 15,
        'ex3_points': 18,
        'ex4_points': 13,
      },
      {
        'body_weight': 69.8,
        'ex1_points': 14,
        'ex2_points': 16,
        'ex3_points': 19,
        'ex4_points': 15,
      },
      {
        'body_weight': 69.0,
        'ex1_points': 15,
        'ex2_points': 18,
        'ex3_points': 20,
        'ex4_points': 16,
      },
    ];

    for (final benchmark in benchmarks) {
      await widget.benchmarkService.Addbenchmark(
        body_weight: benchmark['body_weight'] as double,
        ex1_points: benchmark['ex1_points'] as int,
        ex2_points: benchmark['ex2_points'] as int,
        ex3_points: benchmark['ex3_points'] as int,
        ex4_points: benchmark['ex4_points'] as int,
      );
      // Małe opóźnienie między dodawaniem benchmarków dla różnych dat
      await Future.delayed(const Duration(milliseconds: 100));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.science,
              size: 48,
              color: Colors.blue,
            ),
            const SizedBox(height: 16),
            const Text(
              'Generator Danych Testowych',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Wygeneruje 12 dróg, 2 plany treningowe i 5 benchmarków',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: _isLoading ? null : _generateTestData,
              icon: _isLoading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.add),
              label: Text(_isLoading ? 'Generowanie...' : 'Wygeneruj Dane'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
            ),
            if (_message.isNotEmpty) ...[
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: _message.startsWith('Błąd') 
                      ? Colors.red.shade50 
                      : Colors.green.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  _message,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: _message.startsWith('Błąd') 
                        ? Colors.red.shade900 
                        : Colors.green.shade900,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}