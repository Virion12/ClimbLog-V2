import 'package:climblog_mobile/Riverpod/helpers_riverpod.dart';
import 'package:climblog_mobile/Services/local_db/benchmark_service.dart';
import 'package:climblog_mobile/database/database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final benchmarkServiceProvider = Provider<BenchmarkService>((ref) {
  final db = ref.watch(dbProvider);
  return BenchmarkService(db);
});

final watchAllRoutesWithoutToDeleteStreamProvider = StreamProvider<List<Benchmark>>((ref) async* {
  final benchmarkService = ref.watch(benchmarkServiceProvider);
  final userId = await ref.watch(userIdProvider.future);
  yield*  benchmarkService.getAllWithoutToDelete(userId);
});
  
 