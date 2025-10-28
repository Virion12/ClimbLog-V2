import 'package:climblog_mobile/Riverpod/local_routes_riverpod.dart';
import 'package:climblog_mobile/Widgets/Shared/basic_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RoutesHomeStats extends ConsumerStatefulWidget {
  const RoutesHomeStats({super.key});

  @override
  ConsumerState<RoutesHomeStats> createState() => _RoutesHomeStatsState();
}

class _RoutesHomeStatsState extends ConsumerState<RoutesHomeStats> {
  @override
  Widget build(BuildContext context) {
    final characteristicsCount = ref.watch(routeCharacteristicsCountProvider);

    return BasicContainer(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _StatCard(
                  value: characteristicsCount.powery.toString(),
                  label: "Powery",
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _StatCard(
                  value: characteristicsCount.crimpy.toString(),
                  label: "Crimpy",
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _StatCard(
                  value: characteristicsCount.dynamic.toString(),
                  label: "Dynamic",
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: _StatCard(
                  value: characteristicsCount.sloppy.toString(),
                  label: "Sloppy",
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _StatCard(
                  value: characteristicsCount.reachy.toString(),
                  label: "Reachy",
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _StatCard(
                  value: characteristicsCount.onsighted.toString(),
                  label: "Onsighted",
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: _StatCard(
                  value: characteristicsCount.flashed.toString(),
                  label: "Flashed",
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _StatCard(
                  value: characteristicsCount.redPointed.toString(),
                  label: "Red Pointed",
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _StatCard(
                  value: characteristicsCount.favorite.toString(),
                  label: "Favorite",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String value;
  final String label;

  const _StatCard({
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Color(0xFF2C3E50),
              height: 1,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}