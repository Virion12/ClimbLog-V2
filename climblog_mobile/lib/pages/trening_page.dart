import 'package:climblog_mobile/Widgets/Shared/basic_container.dart';
import 'package:climblog_mobile/Widgets/trening/workout_add_button.dart';
import 'package:climblog_mobile/Widgets/trening/workout_plans_all.dart';
import 'package:flutter/material.dart';

class TreningPage extends StatefulWidget {
  const TreningPage({super.key});

  @override
  State<TreningPage> createState() => _TreningPageState();
}

class _TreningPageState extends State<TreningPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          BasicContainer(child: Text("Trening Plans", textAlign: TextAlign.center,style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: const Color.fromARGB(255, 98, 98, 97)),)),
          WorkoutPlansAll(),
          SizedBox(height: 40,),
          WorkoutAddButton(),
        ],
      ),
    );
  }
}