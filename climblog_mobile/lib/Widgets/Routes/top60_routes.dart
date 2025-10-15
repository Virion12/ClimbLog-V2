import 'package:climblog_mobile/Riverpod/auth_riverpod.dart';
import 'package:climblog_mobile/Riverpod/connectivity_riverpod.dart';
import 'package:climblog_mobile/Riverpod/helpers_riverpod.dart';
import 'package:climblog_mobile/Riverpod/local_routes_riverpod.dart';
import 'package:climblog_mobile/Services/Api_connections/route_api_service.dart';
import 'package:climblog_mobile/Widgets/Routes/more_routes_button.dart';
import 'package:climblog_mobile/Widgets/Routes/route_add_button.dart';
import 'package:climblog_mobile/Widgets/Routes/route_card.dart';
import 'package:climblog_mobile/Widgets/Routes/route_single.dart';
import 'package:climblog_mobile/Widgets/Shared/basic_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Top60Routes extends ConsumerStatefulWidget {
  const Top60Routes({super.key});

  @override
  ConsumerState<Top60Routes> createState() => _AllRoutesState();
}

class _AllRoutesState extends ConsumerState<Top60Routes> {
  bool isInSelectionMode = false;
  Set<int> selectedRoutes = {};
  
  @override
  Widget build(BuildContext context) {
    final routes = ref.watch(sortedRoutesProviderTop60);

    final serviceLocal = ref.read(routeServiceProvider);

    if (routes.isEmpty) {
      return BasicContainer(child: Wrap(children: [RouteAddButton()]));
    }

    return Column(
      children: [
        if (isInSelectionMode)
          BasicContainer(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () async {
                    for (int routeId in selectedRoutes) {
                      try {
                        final isConnected = await ref.read(connectivityProvider.future);
                        final auth = ref.read(authServiceProvider);
                        final routeServiceApi = RouteServiceApi(ref.read(dbProvider), auth, serviceLocal);
                        await routeServiceApi.RemoveRoute(routeId, isConnected);
                      } catch (e) {
                        throw Exception(e);
                      }
                    }

                    setState(() {
                      selectedRoutes.clear();
                    });
                  },
                  icon: const Icon(Icons.delete),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (!isInSelectionMode) {
                        isInSelectionMode = true;
                      } else {
                        isInSelectionMode = false;
                        selectedRoutes = {};
                      }
                    });
                  },
                  icon: const Icon(Icons.check),
                ),
                IconButton(
                  onPressed: () {
                    for (int routeId in selectedRoutes) {
                      serviceLocal.toggleFavorite(routeId);
                    }
                  },
                  icon: const Icon(Icons.star),
                )
              ],
            ),
          ),
        BasicContainer(
          child: Wrap(
            spacing: 4,
            runSpacing: 4,
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            children: [
              RouteAddButton(),
              ...List.generate(routes.length, (index) {
                final route = routes[index];
                return GestureDetector(
                  onDoubleTap: () {
                    serviceLocal.toggleFavorite(route.id);
                  },
                  onTap: () {
                    if (isInSelectionMode) {
                      setState(() {
                        if (selectedRoutes.contains(route.id)) {
                          selectedRoutes.remove(route.id);
                        } else {
                          selectedRoutes.add(route.id);
                        }
                      });
                    } else {
                      ref.read(selectedRouteProvider.notifier).state = route;
                      showDialog(
                        context: context,
                        builder: (context) => const RouteSingle(),
                      );
                    }
                  },
                  onLongPress: () {
                    setState(() {
                      if (!isInSelectionMode) {
                        isInSelectionMode = true;
                      } else {
                        isInSelectionMode = false;
                        selectedRoutes = {};
                      }
                    });
                  },
                  child: Stack(
                    children: [
                      RouteCard(
                        color: route.color,
                        grade: route.grade,
                        timestamp: route.createdAt,
                      ),
                      if (isInSelectionMode)
                        Positioned(
                          top: 0.0,
                          right: 0.0,
                          child: Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              color: selectedRoutes.contains(route.id)
                                  ? const Color.fromARGB(69, 137, 139, 139)
                                  : Colors.transparent,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: const Color.fromARGB(69, 137, 139, 139),
                                width: 1.2,
                              ),
                            ),
                          ),
                        ),
                      if (route.isFavorite)
                        Positioned(
                          top: 4,
                          left: 4,
                          child: Icon(
                            Icons.star,
                            size: MediaQuery.of(context).size.width * 0.045,
                            color: const Color(0xFF00a896),
                          ),
                        ),
                    ],
                  ),
                );
              }),
              MoreRoutesButton(),
            ],
          ),
        ),
      ],
    );
  }
}
