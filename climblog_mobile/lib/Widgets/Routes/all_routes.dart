import 'package:climblog_mobile/Riverpod/connectivity_riverpod.dart';
import 'package:climblog_mobile/Riverpod/local_routes_riverpod.dart';
import 'package:climblog_mobile/Services/Api_connections/route_api_service.dart';
import 'package:climblog_mobile/Services/Auth/auth_service.dart';
import 'package:climblog_mobile/Services/local_db/route_service.dart';
import 'package:climblog_mobile/Widgets/Routes/route_add_button.dart';
import 'package:climblog_mobile/Widgets/Routes/route_card.dart';
import 'package:climblog_mobile/Widgets/Routes/route_single.dart';
import 'package:climblog_mobile/Widgets/Shared/basic_container.dart';
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
    final routesAsync = ref.watch(filteredRoutesProvider);
    final routeServiceLocal = RouteService(AppDatabase());
    
    return routesAsync.when(
        data: (routes) {
          if (routes.isEmpty) {
            return Wrap(children: [RouteAddButton()]);
          }
          return Column(
            children: [
              if(isInSelectionMode)
               BasicContainer(
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  IconButton(onPressed: () async{
                    
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
                  IconButton(onPressed: (){
                    for(int routeId in selectedRoutes){
                      routeServiceLocal.toggleFavorite(routeId);
                    }
                  }, icon: Icon(Icons.star))
                 ],),
               ),
              

              BasicContainer(
                child: Wrap(
                  spacing: 4,
                  runSpacing: 4,
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: [
                    RouteAddButton(),
                        
                        ...List.generate(routes.length,(index){
                          final route = routes[index];
                          return GestureDetector(
                            onDoubleTap: (){
                              routeServiceLocal.toggleFavorite(route.id);
                            },
                             onTap: () { 
                              if(isInSelectionMode){
                                setState(() {
                                  if(selectedRoutes.contains(route.id)){
                                    selectedRoutes.remove(route.id);
                                }else{
                                    selectedRoutes.add(route.id);
                                }
                                });
                              }else{
                                ref.read(selectedRouteProvider.notifier).state = route;
                                showDialog(
                                    context: context,
                                    builder: (context) => const RouteSingle(),
                                  );
                              }
                             },
                             onLongPress: () async {
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
                                ),)),
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
                            )
                          );
                        })
                        ]
                ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text("Error: $err")),
      );
  }
}