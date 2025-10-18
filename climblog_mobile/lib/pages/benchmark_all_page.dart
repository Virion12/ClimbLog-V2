import 'package:climblog_mobile/Riverpod/auth_riverpod.dart';
import 'package:climblog_mobile/Riverpod/connectivity_riverpod.dart';
import 'package:climblog_mobile/Riverpod/local_benchmark.dart';
import 'package:climblog_mobile/Services/Api_connections/benchmark_api_service.dart';
import 'package:climblog_mobile/Services/local_db/benchmark_service.dart';
import 'package:climblog_mobile/Widgets/Routes/all_routes.dart';
import 'package:climblog_mobile/Widgets/Shared/basic_container.dart';
import 'package:climblog_mobile/Widgets/trening/benchmark/benchmark_add_button.dart';
import 'package:climblog_mobile/Widgets/trening/benchmark/benchmark_card.dart';
import 'package:climblog_mobile/Widgets/trening/benchmark/benchmark_info_dialog.dart';
import 'package:climblog_mobile/database/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BenchmarkAllPage extends ConsumerStatefulWidget {
  const BenchmarkAllPage({super.key});

  @override
  ConsumerState<BenchmarkAllPage> createState() => _StatisticsRoutesPageState();
}

class _StatisticsRoutesPageState extends ConsumerState<BenchmarkAllPage> {
  @override
  Widget build(BuildContext context) {
    final benchmarkAsync = ref.watch(watchAllRoutesWithoutToDeleteStreamProvider);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 245, 245),
      appBar: AppBar(
        title: Text("All Benchmarks"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 246, 245, 245),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BasicContainer(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 30),
                const Text(
                  "Benchmarks",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 98, 98, 97)),
                ),
                IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            backgroundColor: Colors.white,
                            insetPadding: const EdgeInsets.all(30),
                            child: const Padding(
                              padding: EdgeInsets.all(16.0),
                              child: BenchmarkInfoDialog(),
                            ),
                          );
                        },
                      );
                    },
                    icon: const Icon(Icons.info)),
              ],
            )),
            BenchmarkAddButton(),
            BasicContainer(
                child: benchmarkAsync.when(
                    data: (benchmarks) {
                      if (benchmarks.isEmpty) {
                        return const Center(
                          child: Text("No benchmarks for user"),
                        );
                      }
                      return Wrap(
                        spacing: 4,
                        runSpacing: 4,
                        alignment: WrapAlignment.start,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        children: [
                          ...List.generate(benchmarks.length, (index) {
                            final benchamrk = benchmarks[index];
                            return GestureDetector(
                              onTap: () {},
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
                              child: BenchmarkCard(
                                benchmark: benchamrk,
                              ),
                            );
                          }),
                         
                        ],
                      );
                    },
                    error: (error, stack) => Center(
                          child: Text('Error : $error'),
                        ),
                    loading: () =>
                        const Center(child: CircularProgressIndicator()))),

            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
