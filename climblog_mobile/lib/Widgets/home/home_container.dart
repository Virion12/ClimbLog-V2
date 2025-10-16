import 'package:climblog_mobile/Riverpod/local_routes_riverpod.dart';
import 'package:climblog_mobile/Widgets/Shared/basic_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeContaner extends ConsumerStatefulWidget {
  const HomeContaner({super.key});

  @override
  ConsumerState<HomeContaner> createState() => _HomeContanerState();
}

class _HomeContanerState extends ConsumerState<HomeContaner> {
  @override
  Widget build(BuildContext context) {
    final routesAsync = ref.watch(routesProvider);
    final highestGrade = ref.watch(highestGradeProvider);
    final totalheigth = ref.watch(totalHeightProvider);

    return BasicContainer(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _StatCard(
                  value: routesAsync.when(
                    data: (routes) => routes.length.toString(),
                    loading: () => '...',
                    error: (_, __) => '-',
                  ),
                  label: "Routes",
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _StatCard(
                  value: "0",
                  label: "Streak",
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _StatCard(
                  value: highestGrade ?? "-",
                  label: "Max Grade",
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _StatCard(
                  value: "${totalheigth.toStringAsFixed(0)}m",
                  label: "Height",
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
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: Color(0xFF2C3E50),
              height: 1,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}