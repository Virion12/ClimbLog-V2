import 'package:climblog_mobile/Riverpod/image_riverpod.dart';
import 'package:climblog_mobile/Widgets/Routes/route_add_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RouteAddButton extends ConsumerWidget {
  const RouteAddButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        ref.invalidate(imageFileProvider);
        showDialog(
          context: context,
          barrierDismissible: false,
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
        ).then((_) {
          ref.invalidate(imageFileProvider);
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: const Color(0xFF00a896),
        ),
        padding: const EdgeInsets.only(top: 8, bottom: 5),
        height: 55,
        width: 55,
        margin: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
        child: const Icon(
          Icons.add,
          size: 30,
          color: Colors.white,
        ),
      ),
    );
  }
}
