import 'package:climblog_mobile/Services/local_db/workout_service.dart';
import 'package:climblog_mobile/Widgets/Shared/basic_container.dart';
import 'package:climblog_mobile/Widgets/trening/trening_add_form.dart';
import 'package:flutter/material.dart';

class TreningAddButton extends StatefulWidget {
  const TreningAddButton({super.key});

  @override
  State<TreningAddButton> createState() => _TreningAddButtonState();
}

class _TreningAddButtonState extends State<TreningAddButton> {

  @override
  Widget build(BuildContext context) {
    return BasicContainer(
      child: TextButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) =>  Dialog(
                              backgroundColor: Colors.white,
                              insetPadding: const EdgeInsets.all(20),
                              child: const Padding(
                                padding: EdgeInsets.all(16.0),
                                child: TreningAddForm(),
                              ),
                            )
          );
        },
        style: TextButton.styleFrom(
          backgroundColor: const Color(0xFF00a896),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text('Add new'),
      ),
    );
  }
}