import 'package:climblog_mobile/Widgets/Shared/basic_container.dart';
import 'package:climblog_mobile/Widgets/trening/benchmark/benchmark_info_dialog.dart';
import 'package:climblog_mobile/Widgets/trening/trening_add_button.dart';
import 'package:climblog_mobile/Widgets/trening/trening_info_dialog.dart';
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
          BasicContainer(child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 30,),
              Text("Trening Plans", textAlign: TextAlign.center,style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: const Color.fromARGB(255, 98, 98, 97)),),
              IconButton(onPressed: () {
                 showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              backgroundColor: Colors.white,
                              insetPadding: const EdgeInsets.all(30),
                              child:  Padding(
                                padding: EdgeInsets.all(16.0),
                                child: TreningInfoDialog(),
                              ),
                            );
                          },
                        );

              }, icon: Icon(Icons.info)),
            ],
          )),
          WorkoutPlansAll(),
          TreningAddButton(),
          SizedBox(height: 50,),
           BasicContainer(child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 30,),
              Text("Benchmarks", textAlign: TextAlign.center,style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: const Color.fromARGB(255, 98, 98, 97)),),
              IconButton(onPressed: () {
                 showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              backgroundColor: Colors.white,
                              insetPadding: const EdgeInsets.all(30),
                              child:  Padding(
                                padding: EdgeInsets.all(16.0),
                                child: BenchmarkInfoDialog(),
                              ),
                            );
                          },
                        );

              }, icon: Icon(Icons.info)),
            ],
          )),
        ],
      ),
    );
  }
}