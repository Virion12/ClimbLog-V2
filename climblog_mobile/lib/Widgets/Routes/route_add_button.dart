import 'package:climblog_mobile/Widgets/Routes/route_add_form.dart';
import 'package:climblog_mobile/Widgets/Shared/basic_container.dart';
import 'package:flutter/material.dart';

class RouteAddButton extends StatelessWidget {
  const RouteAddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              backgroundColor: Colors.white,
              insetPadding: const EdgeInsets.all(10),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: RouteAddForm(),
              ),
            );
          },
        );
      },
      icon: const Icon(Icons.add),
    );
  }
}
