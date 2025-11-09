import 'dart:io';
import 'package:climblog_mobile/Riverpod/auth_riverpod.dart';
import 'package:climblog_mobile/Riverpod/connectivity_riverpod.dart';
import 'package:climblog_mobile/Riverpod/helpers_riverpod.dart';
import 'package:climblog_mobile/Riverpod/image_riverpod.dart';
import 'package:climblog_mobile/Riverpod/local_routes_riverpod.dart';
import 'package:climblog_mobile/Services/Api_connections/route_api_service.dart';
import 'package:climblog_mobile/Utils.dart';
import 'package:climblog_mobile/Widgets/Routes/RouteSingle/stats_box.dart';
import 'package:climblog_mobile/Widgets/Routes/route_update_form.dart';
import 'package:climblog_mobile/Widgets/Shared/action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';

class RouteSingle extends ConsumerStatefulWidget {
  const RouteSingle({super.key});

  @override
  ConsumerState<RouteSingle> createState() => _RouteSingleState();
}

class _RouteSingleState extends ConsumerState<RouteSingle> {
  @override
  Widget build(BuildContext context) {
    final selectedRoute = ref.watch(selectedRouteProvider);

    if (selectedRoute == null) {
      return Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Padding(
          padding: EdgeInsets.all(24.0),
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
        final fullPath = "${appDir.path}/${selectedRoute.userId}/${selectedRoute.imagePathLocal}";

        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.all(20),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Image Header
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                  child: Container(
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: File(fullPath).existsSync()
                            ? FileImage(File(fullPath))
                            : const AssetImage("assets/default_route.jpg")
                                as ImageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                // Content
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Name and Grade
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  selectedRoute.name,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF2C3E50),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF00a896),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    selectedRoute.grade,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: getColorFromString(selectedRoute.color),
                              borderRadius: BorderRadius.circular(8),
                              border: getColorFromString(selectedRoute.color) == Colors.white
                                  ? Border.all(color: Colors.black, width: 2)
                                  : null,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // Stats Grid
                      Row(
                        children: [
                          Expanded(
                            child: StatBox(
                              label: "Tries",
                              value: selectedRoute.numberOfTried.toString(),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: StatBox(
                              label: "Height",
                              value: "${selectedRoute.height.toStringAsFixed(0)}m",
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),

                      // Date
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF8F9FA),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Created",
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey[600],
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "${selectedRoute.createdAt.day}.${selectedRoute.createdAt.month}.${selectedRoute.createdAt.year}",
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF2C3E50),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Action Buttons
                      Row(
                        children: [
                          Expanded(
                            child: ActionButton(
                              icon: Icons.edit_outlined,
                              label: "Edit",
                              onPressed: () {
                                Navigator.of(context).pop();
                                WidgetsBinding.instance.addPostFrameCallback((_) {
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (context) {
                                      return Dialog(
                                        backgroundColor: Colors.white,
                                        insetPadding: const EdgeInsets.all(10),
                                        child: const Padding(
                                          padding: EdgeInsets.all(16.0),
                                          child: RouteUpdateForm(),
                                        ),
                                      );
                                    },
                                  ).then((_) {
                                  ref.invalidate(imageFileProvider);
                                });
                                });
                              },
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: ActionButton(
                              icon: Icons.delete_outline,
                              label: "Delete",
                              isDestructive: true,
                              onPressed: () async {
                                final isConnected = await ref.read(connectivityProvider.future);
                                final auth = ref.read(authServiceProvider);
                                final serviceLocal = ref.read(routeServiceProvider);

                                final routeServiceApi = RouteServiceApi(
                                  ref.read(dbProvider),
                                  auth,
                                  serviceLocal,
                                );
                                await routeServiceApi.RemoveRoute(
                                  selectedRoute.id,
                                  isConnected,
                                );
                                if (context.mounted) {
                                  Navigator.pop(context);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Route removed successfully"),
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}


