import 'package:climblog_mobile/database/database.dart';
import 'package:flutter/material.dart';

class BenchmarkCard extends StatefulWidget {
  final Benchmark benchmark;
  const BenchmarkCard({super.key,required this.benchmark});

  @override
  State<BenchmarkCard> createState() => _BenchmarkCardState();
}

class _BenchmarkCardState extends State<BenchmarkCard> {
  @override
  Widget build(BuildContext context) {
     return  Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 241, 240, 240),
            borderRadius: BorderRadius.circular(8.0),
          ),
          
          padding: EdgeInsets.only(top: 8,bottom: 5),
          height: 100,
          width: 100,
          margin: EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("${widget.benchmark.createdAt.hour}:${widget.benchmark.createdAt.minute}  ${widget.benchmark.createdAt.day}.${widget.benchmark.createdAt.month}.${widget.benchmark.createdAt.year - 2000}",
              style: TextStyle(
                fontSize: 10
              ),),
              Text(widget.benchmark.createdAt.toString(),style: TextStyle(fontWeight: FontWeight.bold),),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 80, 79, 79),
                  border: Border.all(
                    color: Colors.black,
                    width: 1.0,
                    
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                
                width: 85,
                height: 5,
              ),
              
              
            ],
          )
        );
  }
}