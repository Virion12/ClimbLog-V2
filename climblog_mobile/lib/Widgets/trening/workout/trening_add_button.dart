import 'package:climblog_mobile/Widgets/Shared/basic_container.dart';
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
          Navigator.of(context).pushNamed("/treningAddNew");
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