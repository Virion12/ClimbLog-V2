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
    final highestGrade = ref.watch(highestGradeProvider);

    return BasicContainer(
      color: const Color(0xFF00a896),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 60,right: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Routes total : ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                routesAsync.when(
                  data: (routes) {
                    final routesCount = routes.length;
                    return Text(
                      routesCount.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    );
                  },
                  loading: () => const Text('...'),
                  error: (error, stack) => Text('Error: $error'),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 60,right: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Streak : ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "0",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 60,right: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Max grade done : ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                Text(
                  highestGrade ?? "-",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
