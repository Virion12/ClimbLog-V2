import 'package:climblog_mobile/Riverpod/auth_riverpod.dart';
import 'package:climblog_mobile/Riverpod/connectivity_riverpod.dart';
import 'package:climblog_mobile/Services/Api_connections/benchmark_api_service.dart';
import 'package:climblog_mobile/Services/Auth/auth_service.dart';
import 'package:climblog_mobile/Services/local_db/benchmark_service.dart';
import 'package:climblog_mobile/database/database.dart';
import 'package:climblog_mobile/Widgets/Shared/basic_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BenchmarkFormAdd extends ConsumerStatefulWidget {
  const BenchmarkFormAdd({super.key});

  @override
  ConsumerState<BenchmarkFormAdd> createState() => _BenchmarkFormAddState();
}

class _BenchmarkFormAddState extends ConsumerState<BenchmarkFormAdd> {
  final _formKey = GlobalKey<FormState>();
  final _bodyWeightController = TextEditingController();

  final List<String> exercises = [
    "Exercise 1/4: Max finger strength (20 mm crimp, 5 sec)",
    "Exercise 2/4: Max pull-up (one rep)",
    "Exercise 3/4: Core strength",
    "Exercise 4/4: Hang from bar",
  ];

  final List<TextEditingController> _exerciseControllers =
      List.generate(4, (_) => TextEditingController());

  @override
  void dispose() {
    _bodyWeightController.dispose();
    for (var controller in _exerciseControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  InputDecoration _inputDecoration(String label, {String? suffix}) {
    return InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: Colors.grey[600]),
      suffixText: suffix,
      suffixStyle: TextStyle(
        color: Colors.grey[600],
        fontWeight: FontWeight.w500,
      ),
      filled: true,
      fillColor: const Color(0xFFF8F9FA),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey[300]!),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFF00a896), width: 2),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    );
  }

  void _showInfoDialog(BuildContext context, int index) {
    final infoTexts = [
      // Exercise 1
      '''
**Max finger strength (20 mm crimp, 5 sec)**

1 Point = 100% (body-weight)
2 Points = 110%
3 Points = 120%
4 Points = 130%
5 Points = 140%
6 Points = 150%
7 Points = 160%
8 Points = 180%
9 Points = 200%
10 Points = 220%
''',
      // Exercise 2
      '''
**Max pull-up (one rep)**

1 Point = 100% (body-weight)
2 Points = 110%
3 Points = 120%
4 Points = 130%
5 Points = 140%
6 Points = 150%
7 Points = 160%
8 Points = 180%
9 Points = 200%
10 Points = 220%
''',
      // Exercise 3
      '''
**Core strength**

1 Point = 10 sec L-sit (bend knees)
2 Points = 20 sec L-sit (bend knees)
3 Points = 30 sec L-sit (bend knees)
4 Points = 10 sec L-sit
5 Points = 15 sec L-sit
6 Points = 20 sec L-sit
7 Points = 5 sec front lever
8 Points = 10 sec front lever
9 Points = 20 sec front lever
10 Points = 30 sec front lever
''',
      // Exercise 4
      '''
**Hang from bar**

1 Point = 30 sec
2 Points = 1 min
3 Points = 1.5 min
4 Points = 2 min
5 Points = 2.5 min
6 Points = 3 min
7 Points = 3.5 min
8 Points = 4 min
9 Points = 5 min
10 Points = 6 min
'''
    ];

    showDialog(
      context: context,
      builder: (_) => Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        insetPadding: const EdgeInsets.all(20),
        child: BasicContainer(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Exercise ${index + 1} Info",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2C3E50),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  infoTexts[index],
                  style: const TextStyle(fontSize: 15, color: Colors.black87),
                ),
                const SizedBox(height: 20),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFF00a896),
                    foregroundColor: Colors.white,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text("Close"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Add Benchmark",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF2C3E50),
                ),
              ),
              const SizedBox(height: 24),

              _SectionLabel(label: "Body Weight"),
              const SizedBox(height: 12),

              TextFormField(
                controller: _bodyWeightController,
                decoration: _inputDecoration("Body Weight", suffix: "kg"),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your body weight";
                  }
                  final weight = double.tryParse(value);
                  if (weight == null || weight <= 0) {
                    return "Please enter a valid weight";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 24),

              _SectionLabel(label: "Exercise Points (1-10)"),
              const SizedBox(height: 12),

              for (int i = 0; i < exercises.length; i++) ...[
                _buildExerciseCard(exercises[i], _exerciseControllers[i], i),
                const SizedBox(height: 16),
              ],

              const SizedBox(height: 24),

              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        side: BorderSide(color: Colors.grey[300]!),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          final benchmarkService = BenchmarkService(AppDatabase());
                          try {

                            final isConnected = await ref.read(connectivityProvider.future);

                           int benchmarkLocalId = await benchmarkService.Addbenchmark(
                              body_weight:
                                  double.parse(_bodyWeightController.text),
                              ex1_points: int.parse(_exerciseControllers[0].text),
                              ex2_points: int.parse(_exerciseControllers[1].text),
                              ex3_points: int.parse(_exerciseControllers[2].text),
                              ex4_points: int.parse(_exerciseControllers[3].text),
                            );

                            if(isConnected){
                              final auth = ref.read(authServiceProvider);
                              final benchmarkServiceApi = BenchmarkApiService( auth,benchmarkService);
                              await benchmarkServiceApi.AddBenchmark(benchmarkLocalId, isConnected);
                            }

                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Benchmark saved successfully!'),
                                  backgroundColor: Color(0xFF00a896),
                                  behavior: SnackBarBehavior.floating,
                                ),
                              );
                              Navigator.of(context).pop();
                            }
                          } catch (e) {
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Error saving benchmark: $e'),
                                  backgroundColor: Colors.red,
                                  behavior: SnackBarBehavior.floating,
                                ),
                              );
                            }
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF00a896),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        "Save Benchmark",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExerciseCard(
      String exercise, TextEditingController controller, int index) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[300]!, width: 1.5),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  exercise,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2C3E50),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.info_outline, color: Color(0xFF00a896)),
                onPressed: () => _showInfoDialog(context, index),
              ),
            ],
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: controller,
            decoration: _inputDecoration("Enter points (1–10)"),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter points";
              }
              final points = int.tryParse(value);
              if (points == null || points < 1 || points > 10) {
                return "Points must be between 1 and 10";
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  final String label;

  const _SectionLabel({required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Color(0xFF2C3E50),
      ),
    );
  }
}
