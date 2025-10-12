import 'package:climblog_mobile/Riverpod/local_benchamrks_riverpod.dart';
import 'package:climblog_mobile/Services/local_db/workout_service.dart';
import 'package:climblog_mobile/Widgets/Shared/basic_container.dart';
import 'package:climblog_mobile/Widgets/trening/confirm_removal_trening_dialog.dart';
import 'package:climblog_mobile/Widgets/trening/trening_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WorkoutPlansAll extends ConsumerStatefulWidget {
  const WorkoutPlansAll({super.key});
  
  @override
  ConsumerState<WorkoutPlansAll> createState() => _WorkoutPlansAllState();
}

class _WorkoutPlansAllState extends ConsumerState<WorkoutPlansAll> {
  @override
  Widget build(BuildContext context) {
    final plansAsync = ref.watch(workoutPlansProvider);
    
    return BasicContainer(
      child: plansAsync.when(
        data: (plans) {
          if (plans.isEmpty) {
            return const Text('Brak planów treningowych');
          }
          return Wrap(
            spacing: 4,
            runSpacing: 4,
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            children: List.generate(plans.length, (index) {
              final plan = plans[index];
              return GestureDetector(
                onTap: () {
                
                },
                onLongPress: () {
                   showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              backgroundColor: Colors.white,
                              insetPadding: const EdgeInsets.all(30),
                              child:  Padding(
                                padding: EdgeInsets.all(16.0),
                                child: ConfirmRemovalTreningDialog(planId: plan.plan.id),
                              ),
                            );
                          },
                        );
                },
                child: TreningCard(
                  backgroundImage: index % 2 ==1 ? './assets/plan1.jpg' : './assets/plan2.jpg',
                  name: plan.plan.name,
                  createdAt: plan.plan.createdAt,
                  isMain: plan.plan.isMain,
                ),
              );
            }),
          );
        },
        loading: () => const CircularProgressIndicator(),
        error: (error, stack) => Text('Błąd: $error'),
      ),
    );
  }
}