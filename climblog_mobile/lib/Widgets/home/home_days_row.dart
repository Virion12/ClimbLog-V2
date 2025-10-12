import 'package:climblog_mobile/Riverpod/trening.riverpod.dart';
import 'package:climblog_mobile/Widgets/home/home_day_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeDaysRow extends ConsumerStatefulWidget {
  const HomeDaysRow({super.key});

  @override
  ConsumerState<HomeDaysRow> createState() => _HomeDaysRowState();
}

class _HomeDaysRowState extends ConsumerState<HomeDaysRow> {
  
  int selectedIndex = 2; 
  final  List daysOfWeek = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];

  @override
  Widget build(BuildContext context) {
    final List<DateTime> days = [
      DateTime.now().subtract(const Duration(days: 2)),
      DateTime.now().subtract(const Duration(days: 1)),
      DateTime.now(),
      DateTime.now().add(const Duration(days: 1)),
      DateTime.now().add(const Duration(days: 2)),
    ];
    

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(days.length, (index) {
        final day = days[index];
        final bool isMain = index == selectedIndex;

        return GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
              ref.read(selectedDay.notifier).state = daysOfWeek[days[index].weekday -1];

            });
          },
          child: HomeDayBox(
            day: day,
            height: 60,
            width: 60,
            ismain: isMain,
          ),
        );
      }),
    );
  }
}
