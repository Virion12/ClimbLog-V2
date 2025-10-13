import 'package:climblog_mobile/Riverpod/local_trening_riverpod.dart';
import 'package:climblog_mobile/Riverpod/trening.riverpod.dart';
import 'package:climblog_mobile/Widgets/home/home_session_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeTreningCard extends ConsumerStatefulWidget {
  const HomeTreningCard({super.key});

  @override
  ConsumerState<HomeTreningCard> createState() => _HomeTreningCardState();
}

class _HomeTreningCardState extends ConsumerState<HomeTreningCard> {
  @override
  Widget build(BuildContext context) {
    final day = ref.watch(selectedDay);
    final sessions = ref.watch(sessionsForSelectedDayProvider);
    
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(top: 20, left: 25, right: 25, bottom: 20),
      width: MediaQuery.of(context).size.width * 0.9,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            day == null ? "No data" : day.toUpperCase(),
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(255, 101, 101, 101)
            ),
            textAlign: TextAlign.center,
          ),
       
          if (sessions.isEmpty)
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "No sessions for this day",
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              ),
            )
          else
            for(int i = 0; i < sessions.length; i++)
              HomeSessionBox(
                NumberInLIne: i + 1,
                session: sessions[i],
              ),
          
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}