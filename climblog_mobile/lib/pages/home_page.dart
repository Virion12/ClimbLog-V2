import 'package:climblog_mobile/Widgets/Shared/basic_container.dart';
import 'package:climblog_mobile/Widgets/home/home_contaner.dart';
import 'package:climblog_mobile/Widgets/home/home_days_row.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeContaner(),
        BasicContainer(child: Column(
          children: [
              HomeDaysRow(),
          ],
        ))
        
      ],
    );
  }
}