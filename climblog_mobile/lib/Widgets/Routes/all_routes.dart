import 'package:climblog_mobile/Riverpod/connectivity_riverpod.dart';
import 'package:climblog_mobile/Riverpod/local_routes_riverpod.dart';
import 'package:climblog_mobile/Services/Api_connections/route_api_service.dart';
import 'package:climblog_mobile/Services/Auth/auth_service.dart';
import 'package:climblog_mobile/Services/local_db/route_service.dart';
import 'package:climblog_mobile/Widgets/Routes/route_add_button.dart';
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
  bool isInSelectionMode = false;
  Set<int> selectedRoutes = {};
  @override
  Widget build(BuildContext context) {
    
    final routesAsync = ref.watch(routesProvider);
    return routesAsync.when(
        data: (routes) {
          if (routes.isEmpty) {
            return
            Wrap(children:[ RouteAddButton()]);
          }
          return Column(
            children: [
              if(isInSelectionMode)
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                IconButton(onPressed: () async{
                  final routeServiceLocal = RouteService(AppDatabase());
                           for(int routeId in selectedRoutes){
                            try{
                                
                                final isConnected = await ref.read(connectivityProvider.future);
                                if(isConnected){
                                  if(await routeServiceLocal.isRouteAddedTobackendValidator(routeId)){
                                      final auth = AuthService();
                                      final routeServiceApi = RouteServiceApi(AppDatabase(), auth, routeServiceLocal);
                                     await routeServiceApi.RemoveRoute(routeId);
                                  }
                                  await routeServiceLocal.removeRoute(routeId);
                                }
                                else{
                                 await routeServiceLocal.markRouteAsToDeletion(routeId);
                                }
                                
                             }catch(e){
                              throw Exception(e);
                             }
                           }
                           setState(() {
                                  selectedRoutes.clear();
                                });


                }, icon: Icon(Icons.delete)),
                IconButton(onPressed: () {
                   setState(() {
                              if(!isInSelectionMode){
                              isInSelectionMode = true;
                              }else{
                                isInSelectionMode = false;
                                selectedRoutes = {};
                              }
                            });
                }, icon: Icon(Icons.check)),
               ],),

              Wrap(
                spacing: 4,
                runSpacing: 4,
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.start,
                children: [
                  RouteAddButton(),
                      
                      ...List.generate(routes.length,(index){
                        final route = routes[index];
                        return GestureDetector(
                           onTap: () { 
                            if(isInSelectionMode){
                              setState(() {
                                if(selectedRoutes.contains(route.id)){
                                  selectedRoutes.remove(route.id);
                              }else{
                                  selectedRoutes.add(route.id);
                              }
                              });
                            }
                           },
                           onLongPress: () async {
                            //  final routeServiceLocal = RouteService(AppDatabase());
                            //  try{
                                
                            //     final isConnected = await ref.read(connectivityProvider.future);
                            //     if(isConnected){
                            //       if(route.isAddedToBackend == true && route.backendId != 0){
                            //           final auth = AuthService();
                            //           final routeServiceApi = RouteServiceApi(AppDatabase(), auth, routeServiceLocal);
                            //          await routeServiceApi.RemoveRoute(route.id);
                            //          await routeServiceLocal.removeRoute(route.id);
                                     
                            //       }
                            //       await routeServiceLocal.removeRoute(route.id);
                            //     }
                            //     else{
                                 
                            //      await routeServiceLocal.markRouteAsToDeletion(route.id);
                            //     }
                            //  }catch(e){
                            //   throw Exception(e);
                            //  }
                            setState(() {
                              if(!isInSelectionMode){
                              isInSelectionMode = true;
                              }else{
                                isInSelectionMode = false;
                                selectedRoutes = {};
                              }
                            });
                           },
                          child:Stack(
                            children: [
                              RouteCard(color: route.color, grade: route.grade,timestamp: route.createdAt),
              
                              if(isInSelectionMode)
                                Positioned(top: 0.0, right: 0.0,
                                  child: Container( width: 12, height: 12, decoration: BoxDecoration(
                                color: selectedRoutes.contains(route.id) ? const Color.fromARGB(69, 137, 139, 139) : Colors.transparent,
                                shape: BoxShape.circle,
                                border: Border.all(color: const Color.fromARGB(69, 137, 139, 139) , width: 1.2),
                              ),))
                            ],
                          )
                        );
                      })
                      ]
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text("Error: $err")),
      );
  }
}