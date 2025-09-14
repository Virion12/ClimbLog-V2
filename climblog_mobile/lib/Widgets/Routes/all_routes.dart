import 'package:climblog_mobile/Riverpod/local_routes_riverpod.dart';
import 'package:climblog_mobile/Widgets/Routes/route_add_button.dart';
import 'package:climblog_mobile/Widgets/Routes/route_card.dart';
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
            RouteAddButton();
          }
          return Wrap(
            spacing: 4,
            runSpacing: 4,
            children: [GestureDetector(
                    onTap: () { Navigator.pushNamed(context, '/addRoute2');},
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: const Color(0xFF00a896),
                      ),
                      padding: EdgeInsets.only(top: 8,bottom: 5),
                      height: 55,
                      width: 55,
                      margin: EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
                      child: Icon(Icons.add, size: 30, color: Colors.white,),
                    ),
                  ),
                  
                  ...List.generate(routes.length,(index){
                    final route = routes[index];
                    return GestureDetector(
                       onTap: () { 
                        //add in future route redirection
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