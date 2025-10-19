import 'package:climblog_mobile/Riverpod/connectivity_riverpod.dart';
import 'package:climblog_mobile/Services/Api_connections/benchmark_api_service.dart';
import 'package:climblog_mobile/Services/local_db/benchmark_service.dart';
import 'package:climblog_mobile/database/database.dart';
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
      current.whenData((isConnected) async {
        if (isConnected) {
          debugPrint("there is netowrk");

          final userId = await ref.watch(authServiceProvider).getUserId();
          if(userId != null && userId != ""){
              final parsedId = int.parse(userId);
              //auth declaration
              final auth = ref.read(authServiceProvider);
              final benchmarksLocal = BenchmarkService(AppDatabase());
              final benchmarkApi = BenchmarkApiService(auth, benchmarksLocal);
              //firstly removing all benchmarks to delete
              final benchmarksToDelete = await benchmarksLocal.getOnlytoDelete(parsedId);
               for(var benchamrk in benchmarksToDelete){
                
                await benchmarkApi.RemoveBenchmark(benchamrk.id);
              }
              //now adding all pending benchmarks to Api
              debugPrint("getting all to update");
              final benchmarksToAdd = await benchmarksLocal.getOnlyNotAddedToBackend(parsedId);
              for(var benchamrk in benchmarksToAdd){
                debugPrint("trying to add benchmark ${benchamrk.id} to backend");
                await benchmarkApi.AddBenchmark(benchamrk.id, isConnected);
              }

          }
          //getting all routes , benchmarks, workoutplans that are not added to backend
          
        }
        else
          {
            debugPrint("there is no network");
          }
      });
    });
    final isLogged = ref.watch(authStateProvider); 

    return isLogged ? const HomeScreen() : const LoginScreen();
  }
}
