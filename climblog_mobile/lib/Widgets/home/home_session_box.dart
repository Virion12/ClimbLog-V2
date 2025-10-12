import 'package:climblog_mobile/Widgets/Shared/basic_container.dart';
import 'package:flutter/material.dart';

class HomeSessionBox extends StatefulWidget {
  final int NumberInLIne;
  const HomeSessionBox({super.key, required this.NumberInLIne,
  
  });

  @override
  State<HomeSessionBox> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomeSessionBox> {
  @override
  Widget build(BuildContext context) {
    return BasicContainer(color: widget.NumberInLIne % 2 == 1 ? Colors.blue : const Color.fromARGB(255, 32, 89, 135),child: Column(
      children: [
        Text("Name",style: TextStyle(color: Colors.white, fontSize: 16,fontWeight: FontWeight.w600),),
        Text("Location",style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500),),
        
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("12:00",style: TextStyle(color: Colors.white),),
             Text("-",style: TextStyle(color: Colors.white),),
            Text("14:00",style: TextStyle(color: Colors.white),),
          ],
        ),
      ],
    ),);
  }
}