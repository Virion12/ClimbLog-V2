import 'package:climblog_mobile/Riverpod/local_routes_riverpod.dart';
import 'package:climblog_mobile/Widgets/Shared/basic_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeContaner extends ConsumerStatefulWidget {
  const HomeContaner({super.key});

  @override
  ConsumerState<HomeContaner> createState() => _HomeContanerState();
}

class _HomeContanerState extends ConsumerState<HomeContaner> {
  
  @override
  Widget build(BuildContext context) {
    final routesAsync = ref.watch(routesProvider);
    return BasicContainer(color: const Color(0xFF00a896),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row( 
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Routes total : ", style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18,color: Colors.white
                                  ),),
              routesAsync.when(
                                data: (routes) {
                                  int routesCount = routes.isNotEmpty ? routes.length : 0;
                                  return Text(routesCount.toString(), style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18,color: Colors.white
                                  ),);
                                },
                                loading: () => Text('...'),
                                error: (error, stack) => Text('Error: $error'),
                              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Streak : ", style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18,color: Colors.white
                                  ),),
               Text("0", style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18,color: Colors.white
                                  ),),
            ],
          )
        ],
      ),
    );
  }
}