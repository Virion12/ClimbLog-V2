import 'package:climblog_mobile/Riverpod/connectivity_riverpod.dart';
import 'package:climblog_mobile/Riverpod/local_routes_riverpod.dart';
import 'package:climblog_mobile/Services/Api_connections/route_api_service.dart';
import 'package:climblog_mobile/Services/Auth/auth_service.dart';
import 'package:climblog_mobile/Services/local_db/route_service.dart';
import 'package:climblog_mobile/Widgets/Routes/route_add_button.dart';
import 'package:climblog_mobile/Widgets/Routes/route_add_form.dart';
import 'package:climblog_mobile/Widgets/Routes/route_card.dart';
import 'package:climblog_mobile/database/database.dart';
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
            return
            Wrap(children:[ RouteAddButton()]);
          }
          return Wrap(
            spacing: 4,
            runSpacing: 4,
            children: [
              RouteAddButton(),
                  
                  ...List.generate(routes.length,(index){
                    final route = routes[index];
                    return GestureDetector(
                       onTap: () { 
                        //add in future route redirection
                       },
                       onLongPress: () async {
                         final routeServiceLocal = RouteService(AppDatabase());
                         try{
                            
                            final isConnected = await ref.read(connectivityProvider.future);
                            if(isConnected){
                              if(route.isAddedToBackend == true && route.backendId != 0){
                                  final routeServiceApi = RouteServiceApi(AppDatabase(), AuthService(), routeServiceLocal);
                                 await routeServiceApi.RemoveRoute(route.id);
                                 await routeServiceLocal.removeRoute(route.id);
                              }
                              await routeServiceLocal.removeRoute(route.id);
                            }
                            else{
                             
                             await routeServiceLocal.markRouteAsToDeletion(route.id);
                            }
                         }catch(e){
                          throw Exception(e);
                         }
                       },
                      child:RouteCard(color: route.color, grade: route.grade,timestamp: route.createdAt)
                    );
                  })
                  ]
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text("Error: $err")),
      );
  }
}