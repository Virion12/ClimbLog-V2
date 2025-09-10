import 'package:climblog_mobile/Services/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService();
});

class AuthStateNotifier extends StateNotifier<bool> {
  final AuthService _authService;

  AuthStateNotifier(this._authService) : super(false) {
    _init();
  }

  Future<void> _init() async {
    final loggedIn = await _authService.logincheck();
    state = loggedIn;
  }

  Future<bool> login(String username, String password) async {
    final result = await _authService.login(username, password);
    debugPrint(result.toString());
    state = result;
    return result;
  }
  Future<bool> register(String username, String password)  async{
    final result = await _authService.register(username, password);
    debugPrint(result.toString());
    return result;
  }

  Future<void> logout() async {
    await _authService.logout();
    state = false;
  }

  Future<bool> isAccessTokenValid() async {
    return await _authService.isAccessTokenValid();
  }

  Future<String?> getToken() async {
    return await _authService.getToken();
  }
}

final authStateProvider =
    StateNotifierProvider<AuthStateNotifier, bool>((ref) {
  final authService = ref.read(authServiceProvider);
  return AuthStateNotifier(authService);
});
