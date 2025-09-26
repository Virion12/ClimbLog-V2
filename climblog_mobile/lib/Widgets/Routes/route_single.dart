import 'dart:io';
import 'package:climblog_mobile/Riverpod/local_routes_riverpod.dart';
import 'package:climblog_mobile/Widgets/Shared/basic_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';

class RouteSingle extends ConsumerWidget {
  const RouteSingle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedRoute = ref.watch(selectedRouteProvider);

    if (selectedRoute == null) {
      return const Dialog(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text("No route selected"),
        ),
      );
    }

    return FutureBuilder(
      future: getApplicationDocumentsDirectory(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final appDir = snapshot.data!;
        final fullPath = "${appDir.path}/${selectedRoute.imagePath}";

        return Dialog(
          backgroundColor: Colors.white,
          insetPadding: const EdgeInsets.all(10),
          child: BasicContainer(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 25),
                Container(
                  height: 350,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: File(fullPath).existsSync()
                          ? FileImage(File(fullPath))
                          : const AssetImage("assets/default_route.jpg")
                              as ImageProvider,
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 16),
                Text("Name : ${selectedRoute.name}"),
                Text("Color : ${selectedRoute.color}"),
                Text("Grade : ${selectedRoute.grade}"),
                Text("Created at : ${selectedRoute.createdAt}"),
                Text("Tries : ${selectedRoute.numberOfTried}"),
              ],
            ),
          ),
        );
      },
    );
  }
}
