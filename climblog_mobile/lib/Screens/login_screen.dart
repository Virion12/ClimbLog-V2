import 'package:climblog_mobile/Riverpod/auth_riverpod.dart';
import 'package:climblog_mobile/Riverpod/helpers_riverpod.dart';
import 'package:climblog_mobile/Riverpod/local_benchmark.dart';
import 'package:climblog_mobile/Riverpod/local_routes_riverpod.dart';
import 'package:climblog_mobile/Services/Api_connections/benchmark_api_service.dart';
import 'package:climblog_mobile/Services/Api_connections/route_api_service.dart';
import 'package:climblog_mobile/Widgets/LoginScreen/register_message.dart';
import 'package:climblog_mobile/Widgets/Shared/Login&Register/logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _loading = false;
  String? _errorMessage;

  void _login() async {
    setState(() {
      _loading = true;
      _errorMessage = null;
    });

    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();

    final success = await ref.read(authStateProvider.notifier).login(username, password);
    debugPrint(success.toString());
    setState(() => _loading = false);

    if(success){
      //After login get all routes from backend
      final auth = ref.watch(authServiceProvider);
      final localService = ref.watch(routeServiceProvider);
      final db = ref.watch(dbProvider);
      final routeApiService = RouteServiceApi(db, auth, localService);
      await routeApiService.getMyAll();

      
      final benchmarkLocal = ref.watch(benchmarkServiceProvider);
      final benchmarkApiService = BenchmarkApiService(auth, benchmarkLocal);
      await benchmarkApiService.GetAll();

      if (mounted) {
       Navigator.of(context).pushNamed('/home');
     }
    }

    if (!success) {
      setState(() {
        _errorMessage = "Invalid username or password";
      });
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const LogoWidget(),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextField(
                    controller: _usernameController,
                    decoration: const InputDecoration(labelText: "Username"),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _passwordController,
                    decoration: const InputDecoration(labelText: "Password"),
                    obscureText: true,
                  ),
                  const SizedBox(height: 24),
                  if (_loading)
                    const CircularProgressIndicator()
                  else
                    ElevatedButton(
                      onPressed: _login,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF00a896),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                        minimumSize: const Size(340, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: const Text("Login"),
                    ),
                  if (_errorMessage != null) ...[
                    const SizedBox(height: 16),
                    Text(
                      _errorMessage!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
      bottomSheet: const RegisterMessage(),
    );
  }
}
