import 'package:flutter/material.dart';

class HomeDayBox extends StatefulWidget {
  final DateTime day; 
  final double height;
  final double width; 
  final bool ismain;

  const HomeDayBox({
    super.key,
    required this.day,
    required this.height,
    required this.width,
    required this.ismain,
  });

  static const List<String> weekDayNames = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  static const daysOfWeek = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];

  @override
  State<HomeDayBox> createState() => _HomeDayBoxState();
}

class _HomeDayBoxState extends State<HomeDayBox> {
  @override
  Widget build(BuildContext context) {
    final String weekDayStr = HomeDayBox.weekDayNames[widget.day.weekday - 1];

    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: widget.ismain ? const Color(0xff34A694) : Colors.transparent,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            weekDayStr,
            style: TextStyle(
              color: widget.ismain ? Colors.white70 : Colors.black54,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
          Text(
            "${widget.day.day}",
            style: TextStyle(
              color: widget.ismain ? Colors.white : Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}