import 'package:climblog_mobile/Riverpod/local_routes_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AllRoutes extends ConsumerStatefulWidget {
  const AllRoutes({super.key});

  @override
  ConsumerState<AllRoutes> createState() => _AllRoutesState();
}

class _AllRoutesState extends ConsumerState<AllRoutes> {
  @override
  Widget build(BuildContext context) {
    final routesAsync = ref.watch(routesProvider);
    return routesAsync.when(
        data: (routes) {
          if (routes.isEmpty) {
            return const Center(child: Text("Brak dróg w bazie"));
          }
          return ListView.builder(
            itemCount: routes.length,
            itemBuilder: (context, index) {
              final route = routes[index];
              return ListTile(
                title: Text(route.name),
                subtitle: Text("Color: ${route.color}, Height: ${route.height}"),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () async {
                    final service = ref.read(routeServiceProvider);
                    await service.removeRoute(route.id);
                  },
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text("Error: $err")),
      );
  }
}