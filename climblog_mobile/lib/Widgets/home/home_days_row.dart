import 'package:climblog_mobile/Widgets/home/home_day_box.dart';
import 'package:flutter/material.dart';

class HomeDaysRow extends StatefulWidget {
  const HomeDaysRow({super.key});

  @override
  State<HomeDaysRow> createState() => _HomeDaysRowState();
}

class _HomeDaysRowState extends State<HomeDaysRow> {
  
  int selectedIndex = 2; 

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
