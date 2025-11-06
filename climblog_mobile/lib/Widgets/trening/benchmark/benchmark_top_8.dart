import 'package:climblog_mobile/Riverpod/auth_riverpod.dart';
import 'package:climblog_mobile/Riverpod/connectivity_riverpod.dart';
import 'package:climblog_mobile/Riverpod/local_benchmark.dart';
import 'package:climblog_mobile/Services/Api_connections/benchmark_api_service.dart';
import 'package:climblog_mobile/Services/local_db/benchmark_service.dart';
import 'package:climblog_mobile/Widgets/Shared/basic_container.dart';
import 'package:climblog_mobile/Widgets/trening/benchmark/benchmark_card.dart';
import 'package:climblog_mobile/database/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BenchmarkTop20 extends ConsumerStatefulWidget {
  const BenchmarkTop20({super.key});

  @override
  ConsumerState<BenchmarkTop20> createState() => _BenchmarkTop20State();
}

class _BenchmarkTop20State extends ConsumerState<BenchmarkTop20> {
  @override
  Widget build(BuildContext context) {
    final benchmarkAsync = ref.watch(watchAllRoutesWithoutToDeleteStreamProviderTop9);
    return BasicContainer(child: benchmarkAsync.when(
      data: (benchmarks){
        if(benchmarks.isEmpty){
          return const Center(child: Text("No benchmarks for user"),);
        }
        return Wrap(
          spacing: 4,
          runSpacing: 4,
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.start,
          children: [
       
        ...List.generate(benchmarks.length, (index){
          final benchamrk = benchmarks[index];
          return GestureDetector(
            onTap: () {
              
            },
            onLongPress: () async{
              final benchmarkService = BenchmarkService(AppDatabase());
              try{
              final isConnected = await ref.read(connectivityProvider.future);

              if(isConnected){
                final auth = ref.read(authServiceProvider);
                final benchmarkApiService = BenchmarkApiService(auth, benchmarkService);
                await benchmarkApiService.RemoveBenchmark(benchamrk.id);
              }else{

              if(!benchamrk.isAddedToBackend){
              await benchmarkService.RemoveBenchmark(benchamrk.id);
              }else{
              await benchmarkService.ToogleToDelete(benchamrk.id);
              }
              }
              if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                 SnackBar(
                                  content: Text('Benchmark removed successfuly'),
                                  backgroundColor: Color.fromARGB(255, 119, 193, 186),
                                  behavior: SnackBarBehavior.floating,
                                ),
                              );
               }
              }catch(e){
                 if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                 SnackBar(
                                  content: Text('Benchmark removal was unsuccessfuly due to $e'),
                                  backgroundColor: Color(0xFF00a896),
                                  behavior: SnackBarBehavior.floating,
                                ),
                              );
               }
              }
            },
            child: BenchmarkCard(benchmark: benchamrk,),
          );
        }),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed("/BenchmarkAllPage");
          },
          child: Container(
            width: 100,
            height: 100,
            margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 231, 229, 229),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
              child: Icon(Icons.more_horiz_outlined,size: 40,)
            ),
        ),

        ], 
        
        
        );

      },
      

      error: (error,stack) => Center( child: Text('Error : $error'),),
      loading: () => Center(child: CircularProgressIndicator(),)) 
    
    );
  }
}