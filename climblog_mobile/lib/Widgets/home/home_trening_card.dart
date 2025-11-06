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
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 12,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      width: MediaQuery.of(context).size.width * 0.9,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Header
          Text(
            day == null ? "No data" : day.toUpperCase(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Color(0xFF2C3E50),
              letterSpacing: 0.5,
            ),
          ),

          const SizedBox(height: 16),

          // Sessions or empty state
          if (sessions.isEmpty)
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 32),
                child: Column(
                  children: [
                    Icon(
                      Icons.fitness_center_outlined,
                      size: 48,
                      color: Colors.grey[400],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "No sessions for this day",
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            )
          else
            Column(
              children: [
                for (int i = 0; i < sessions.length; i++) ...[
                  if (i > 0) const SizedBox(height: 12),
                  HomeSessionBox(session: sessions[i]),
                ],
              ],
            ),
        ],
      ),
    );
  }
}