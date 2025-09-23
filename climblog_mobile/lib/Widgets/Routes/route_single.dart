import 'package:climblog_mobile/Riverpod/local_routes_riverpod.dart';
import 'package:climblog_mobile/Widgets/Shared/basic_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
      return const Dialog(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text("No route selected"),
        ),
      );
    }

    return Dialog(
      backgroundColor: Colors.white,
      insetPadding:  EdgeInsets.all(10),
      child:  Padding(
        padding: EdgeInsets.all(16.0),
        child: BasicContainer(child: 
        Column(
          children: [
            Text("Name : ${selectedRoute.name}"),
            Text("Color : ${selectedRoute.color}"),
            Text("Grade : ${selectedRoute.grade}"),
            Text("Created at : ${selectedRoute.createdAt}")
          ],
        )
        )
      ),
    );
  }
}
