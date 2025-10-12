import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedDay = StateProvider<String?>((ref) {
  final now = DateTime.now();
  const daysOfWeek = [
    'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday',
  ];
  return daysOfWeek[now.weekday - 1]; 
});