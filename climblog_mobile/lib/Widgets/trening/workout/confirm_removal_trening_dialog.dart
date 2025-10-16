import 'package:climblog_mobile/Services/local_db/workout_service.dart';
import 'package:flutter/material.dart';

class ConfirmRemovalTreningDialog extends StatefulWidget {
  final  int planId;
  const ConfirmRemovalTreningDialog({super.key, required this.planId});

  @override
  State<ConfirmRemovalTreningDialog> createState() => _ConfirmRemovalTreningDialogState();
}

class _ConfirmRemovalTreningDialogState extends State<ConfirmRemovalTreningDialog> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("Are you sure you want to remove this plan",style: TextStyle(
          fontSize: 25
        ),textAlign: TextAlign.center,),
        SizedBox(height: 50,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              style: TextButton.styleFrom(
              backgroundColor: const Color(0xFF00a896),
              foregroundColor: Colors.white, 
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8), 
              ),
            ),
              onPressed: () async {
                      final serviceWorkout = WorkoutService();
                      await serviceWorkout.removeWorkoutPlan(widget.planId);
                      if(mounted){Navigator.of(context).pop();}
                      
            }, child: Text("Yes")),
                      TextButton(
                        style: TextButton.styleFrom(
                        backgroundColor: Colors.red, 
                        foregroundColor: Colors.white, 
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8), 
                        ),
                      ),
                        onPressed: () {
                        Navigator.of(context).pop();
                      }, child: Text("No")),
          ],
        ),
      ],
    );
  }
}