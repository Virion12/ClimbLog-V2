import 'package:flutter/material.dart';

class BasicContainer extends StatelessWidget {
  final Widget child;
  const BasicContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
              ),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(top: 20,left: 25,right: 25),
              width: MediaQuery.of(context).size.width * 0.9,
      child: child,
    );
  }
}