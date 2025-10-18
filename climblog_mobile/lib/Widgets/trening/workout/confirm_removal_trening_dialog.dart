import 'package:climblog_mobile/Riverpod/auth_riverpod.dart';
import 'package:climblog_mobile/Riverpod/connectivity_riverpod.dart';
import 'package:climblog_mobile/Services/Api_connections/workout_api_service.dart';
import 'package:climblog_mobile/Services/local_db/workout_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConfirmRemovalTreningDialog extends ConsumerStatefulWidget {
  final int planId;
  final int? backendId;
  const ConfirmRemovalTreningDialog({super.key, required this.planId, this.backendId});

  @override
  ConsumerState<ConfirmRemovalTreningDialog> createState() => _ConfirmRemovalTreningDialogState();
}

class _ConfirmRemovalTreningDialogState extends ConsumerState<ConfirmRemovalTreningDialog> {
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
                      final isConnected = await ref.watch(connectivityProvider.future);
                      final auth = ref.read(authServiceProvider);
                      
                      if(isConnected){
                        final workoutServiceApi = WorkoutApiService(auth, serviceWorkout);
                        await workoutServiceApi.RemoveWorkoutPlan(widget.planId);
                      } else {
                        if(widget.backendId != null && widget.backendId != 0){
                          await serviceWorkout.toogleIstoDelete(widget.planId, widget.backendId!);
                        } else {
                          await serviceWorkout.removeWorkoutPlan(widget.planId);
                        }
                       }
                      
                      
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