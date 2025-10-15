import 'package:climblog_mobile/Services/local_db/workout_service.dart';
import 'package:climblog_mobile/Widgets/Shared/basic_container.dart';
import 'package:flutter/material.dart';

class HomeSessionBox extends StatefulWidget {
  final int NumberInLIne;
  final WorkoutSessionFull session;
 
  const HomeSessionBox({
    super.key,
    required this.NumberInLIne,
    required this.session,
  });
  
  @override
  State<HomeSessionBox> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomeSessionBox> {
  @override
  Widget build(BuildContext context) {
    return BasicContainer(
      color: widget.NumberInLIne % 2 == 1
          ? Colors.blue
          : const Color.fromARGB(255, 32, 89, 135),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                widget.session.session.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            const SizedBox(height: 2),
            
            Center(
              child: Text(
                widget.session.session.location,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 13,
                  fontWeight: FontWeight.w500
                ),
              ),
            ),
            const SizedBox(height: 4),
            
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.session.session.start,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  const Text(
                    " - ",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  Text(
                    widget.session.session.start, // Dodaj pole 'end' do bazy
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 8),
            const Divider(color: Colors.white38, thickness: 1, height: 1),
            const SizedBox(height: 8),
            
            if (widget.session.exercises.isEmpty)
              const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    'No exercises',
                    style: TextStyle(
                      color: Colors.white60,
                      fontSize: 13,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              )
            else
              ...widget.session.exercises.map((exercise) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          exercise.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      
                      Expanded(
                        flex: 2,
                        child: Text(
                          '${exercise.setNumber} × ${exercise.repNumber} (${exercise.time.toInt()}s)',
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
          ],
        ),
      ),
    );
  }
}