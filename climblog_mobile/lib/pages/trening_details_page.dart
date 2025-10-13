import 'package:climblog_mobile/Riverpod/local_trening_riverpod.dart';
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
  final pageController = PageController(viewportFraction: 0.88);

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

    // Tworzymy mapę dni z bazy danych
    final daysMap = <int, WorkoutDayFull>{};
    for (var day in selected.days) {
      daysMap[day.day.workoutDayOfWeek] = day;
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 245, 245),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 246, 245, 245),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          BasicContainer(
            child: Column(
              children: [
                Text(
                  selected.plan.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 78, 78, 78),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  "${selected.plan.createdAt.day}.${selected.plan.createdAt.month}.${selected.plan.createdAt.year} "
                  "${selected.plan.createdAt.hour}:${selected.plan.createdAt.minute.toString().padLeft(2, '0')}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 78, 78, 78),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemCount: 7, // Zawsze 7 dni tygodnia
              itemBuilder: (context, index) {
                final dayWorkout = daysMap[index]; // Może być null

                return AnimatedBuilder(
                  animation: pageController,
                  builder: (context, child) {
                    double value = 1.0;
                    if (pageController.position.haveDimensions) {
                      value = pageController.page! - index;
                      value = (1 - (value.abs() * 0.2)).clamp(0.85, 1.0);
                    }

                    return Align(
                      alignment: Alignment.topCenter,
                      child: SizedBox(
                        height: Curves.easeOut.transform(value) * 420,
                        width: Curves.easeOut.transform(value) * 360,
                        child: _buildDayCard(context, index, dayWorkout),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  String _getDayName(int dayOfWeek) {
    const days = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];

    if (dayOfWeek < 0 || dayOfWeek >= days.length) return 'Unknown';
    return days[dayOfWeek];
  }

  Widget _buildDayCard(BuildContext context, int dayIndex, WorkoutDayFull? dayWorkout) {
    final dayName = _getDayName(dayIndex);

    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              dayName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Color.fromARGB(255, 34, 34, 34),
              ),
            ),
            const SizedBox(height: 20), 

            if (dayWorkout == null || dayWorkout.sessions.isEmpty)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 30),
                child: Center(
                  child: Text(
                    'No sessions planned',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                ),
              )
            else
              Flexible(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: dayWorkout.sessions.map((session) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              session.session.name,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF00a896),
                              ),
                            ),
                            const SizedBox(height: 4),
                            ...session.exercises.map((e) => Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 2),
                                  child: Text(
                                    '${e.name} - ${e.setNumber} sets × ${e.time?.toInt() ?? 0}s',
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.black87,
                                    ),
                                  ),
                                )),
                            const Divider(),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    //Navigator.pushNamed(context, '/addTrening');
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFF00a896),
                    foregroundColor: Colors.white,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text('New'),
                ),
                TextButton(
                  onPressed: () {
                    //Navigator.pushNamed(context, '/addTrening');
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: const Color(0xFF00a896),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: const BorderSide(
                        color: Color(0xFF00a896),
                        width: 2,
                      ),
                    ),
                  ),
                  child: const Text('Edit'),
                ),
              ]
            ),
          ],
        ),
      ),
    );
  }
}