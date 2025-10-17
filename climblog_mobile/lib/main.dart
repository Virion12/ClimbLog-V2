import 'package:climblog_mobile/Screens/home_screen.dart';
import 'package:climblog_mobile/Screens/login_screen.dart';
import 'package:climblog_mobile/Screens/register_screen.dart';
import 'package:climblog_mobile/Widgets/trening/benchmark/benchmark_form_add.dart';
import 'package:climblog_mobile/pages/all_routes_page.dart';
import 'package:climblog_mobile/pages/compare_route_page.dart';
import 'package:climblog_mobile/pages/statistics_routes_page.dart';
import 'package:climblog_mobile/pages/trening_add_form.dart';
import 'package:climblog_mobile/pages/trening_details_page.dart';
import 'package:climblog_mobile/widget_tree.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; 

void main() {
  runApp(
    const ProviderScope( 
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  Widgettree(),
      routes: {
        "/login": (context) => const LoginScreen(),
        "/register": (context) => const RegisterScreen(),
        "/home": (context) => const HomeScreen(),
        "/routeStatistic": (context) => const StatisticsRoutesPage(),
        "/routesAll": (context) => const AllRoutesPage(),
        "/routesCompare": (context) => const CompareroutesPage(),
        "/treningPlanDetails": (context) => const TreningDetailsPage(),
        "/treningAddNew": (context) => const TreningAddForm(),
        
      },
    );
  }
}
