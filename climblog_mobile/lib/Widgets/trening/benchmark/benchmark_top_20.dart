import 'package:climblog_mobile/Riverpod/local_benchmark.dart';
import 'package:climblog_mobile/Widgets/Shared/basic_container.dart';
import 'package:climblog_mobile/Widgets/trening/benchmark/benchmark_card.dart';
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
    final benchmarkAsync = ref.watch(watchAllRoutesWithoutToDeleteStreamProvider);
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
            onDoubleTap: () {},
            onLongPress: (){},
            child: BenchmarkCard(benchmark: benchamrk,),
          );
        }),], );

      },
      

      error: (error,stack) => Center( child: Text('Error : $error'),),
      loading: () => Center(child: CircularProgressIndicator(),)) 
    
    );
  }
}