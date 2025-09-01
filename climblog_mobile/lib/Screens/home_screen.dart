import 'package:climblog_mobile/Services/AuthService.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await AuthService().logout();
              if (context.mounted) {
                Navigator.pushReplacementNamed(context, "/login");
              }
            },
          ),
        ],
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final token = await AuthService().getToken();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Token: $token")),
            );
          },
          child: const Text("Show Token"),
        ),
      ),
    );
  }
}
