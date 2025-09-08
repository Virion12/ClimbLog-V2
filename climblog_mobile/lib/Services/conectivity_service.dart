import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';


class ConnectivityService {
  final _connectivity = Connectivity();
  final _controller = StreamController<bool>.broadcast();

  ConnectivityService() {
    _connectivity.onConnectivityChanged.listen((_) async {
      final result = await _checkRealConnection();
      _controller.add(result);
    });

    _checkRealConnection().then((result) {
      _controller.add(result);
    });
  }

  Future<bool> _checkRealConnection() async {
    try {
      final result = await InternetAddress.lookup('www.google.com')
          .timeout(const Duration(seconds: 5));
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } catch (_) {
      return false;
    }
  }

  Stream<bool> get connectivityStream => _controller.stream;

  void dispose() {
    _controller.close();
  }
}