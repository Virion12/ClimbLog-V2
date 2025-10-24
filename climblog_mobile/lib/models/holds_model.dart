import 'dart:ffi';

import 'package:climblog_mobile/models/cords.dart';

class HoldsModel {
  final int classId;
  final List<Cords> array;

  HoldsModel({this.classId =0, required this.array});
}