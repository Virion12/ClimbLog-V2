import 'package:climblog_mobile/Widgets/Routes/all_routes.dart';
import 'package:flutter/material.dart';

class AllRoutesPage extends StatefulWidget {
  const AllRoutesPage({super.key});

  @override
  State<AllRoutesPage> createState() => _StatisticsRoutesPageState();
}

class _StatisticsRoutesPageState extends State<AllRoutesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Routes"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 246, 245, 245),
      ),
      backgroundColor: const Color.fromARGB(255, 246, 245, 245),
      body: SingleChildScrollView(
        child: Column(
          children: [
           AllRoutes(),
          ],
        ),
      ),
    );
  }
}