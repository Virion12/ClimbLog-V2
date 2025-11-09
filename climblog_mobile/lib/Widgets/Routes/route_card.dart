import 'package:climblog_mobile/Utils.dart';
import 'package:flutter/material.dart';

class RouteCard extends StatelessWidget {
    final String color;
    final String grade;
   
    final DateTime timestamp;
  const RouteCard({super.key, required this.color, required this.grade,required this.timestamp});

  @override
  Widget build(BuildContext context) {
    return  Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 241, 240, 240),
            borderRadius: BorderRadius.circular(8.0),
          ),
          
          padding: EdgeInsets.only(top: 8,bottom: 5),
          height: 55,
          width: 55,
          margin: EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(grade,style: TextStyle(fontWeight: FontWeight.bold),),
              Container(
                decoration: BoxDecoration(
                  color: getColorFromString(color),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                
                width: 35,
                height: 5,
              ),
              Text("${timestamp.day}.${timestamp.month}.${timestamp.year - 2000}",
              style: TextStyle(
                fontSize: 10
              ),),
              
            ],
          )
        );
  }
}