import 'package:climblog_mobile/Riverpod/connectivity_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:climblog_mobile/Riverpod/auth_riverpod.dart';
import 'package:climblog_mobile/Screens/home_screen.dart';
import 'package:climblog_mobile/Screens/login_screen.dart';

class Widgettree extends ConsumerWidget {
  const Widgettree({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
     ref.listen(connectivityProvider, (previous, current) {
      current.whenData((isConnected) {
        if (isConnected) {
          //Create sync data service and class
        }
      });
    });
    final isLogged = ref.watch(authStateProvider); 

    return isLogged ? const HomeScreen() : const LoginScreen();
  }
}
