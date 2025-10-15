import 'package:climblog_mobile/database/database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


final secureStorageProvider = Provider<FlutterSecureStorage>((ref) {
  return const FlutterSecureStorage();
});

final dbProvider = Provider<AppDatabase>((ref) => AppDatabase());

final userIdProvider = FutureProvider<int>((ref) async {
  final storage = ref.watch(secureStorageProvider); 
  final userID = await storage.read(key: "userid");
  if (userID == null) {
    throw Exception("User is not logged in");
  }
  return int.parse(userID);
});
