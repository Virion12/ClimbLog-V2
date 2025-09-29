import 'package:flutter/material.dart';

class BasicHalfContainer extends StatelessWidget {
  final Widget child;
  final Color? color; 

  const BasicHalfContainer({
    super.key,
    required this.child,
    this.color, 
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color ?? Colors.white, 
        borderRadius: BorderRadius.circular(16.0),
      ),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
      width: MediaQuery.of(context).size.width * 0.4,
      child: child,
    );
  }
}
