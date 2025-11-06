import 'package:climblog_mobile/Riverpod/local_routes_riverpod.dart';
import 'package:climblog_mobile/Widgets/Routes/charts/compare_radar_chart.dart';
import 'package:climblog_mobile/Widgets/Routes/charts/compare_routes_by2date_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CompareroutesPage extends ConsumerWidget {
  const CompareroutesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate1 = ref.watch(selectedDate1Provider);
    final selectedDate2 = ref.watch(selectedDate2Provider);
    final selectedDate3 = ref.watch(selectedDate3Provider);
    final selectedDate4 = ref.watch(selectedDate4Provider);

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Compare",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Color(0xFF2C3E50),
          ),
        ),
        iconTheme: const IconThemeData(color: Color(0xFF2C3E50)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Date Range Cards
            Row(
              children: [
                Expanded(
                  child: _DateRangeCard(
                    title: "Period 1",
                    fromDate: selectedDate1,
                    toDate: selectedDate2,
                    onFromTap: () async {
                      final DateTime? dateTime = await showDatePicker(
                        context: context,
                        initialDate: selectedDate1,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );
                      if (dateTime != null) {
                        ref.read(selectedDate1Provider.notifier).state = dateTime;
                      }
                    },
                    onToTap: () async {
                      final DateTime? dateTime = await showDatePicker(
                        context: context,
                        initialDate: selectedDate2,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );
                      if (dateTime != null) {
                        ref.read(selectedDate2Provider.notifier).state = dateTime;
                      }
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _DateRangeCard(
                    title: "Period 2",
                    fromDate: selectedDate3,
                    toDate: selectedDate4,
                    onFromTap: () async {
                      final DateTime? dateTime = await showDatePicker(
                        context: context,
                        initialDate: selectedDate3,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );
                      if (dateTime != null) {
                        ref.read(selectedDate3Provider.notifier).state = dateTime;
                      }
                    },
                    onToTap: () async {
                      final DateTime? dateTime = await showDatePicker(
                        context: context,
                        initialDate: selectedDate4,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );
                      if (dateTime != null) {
                        ref.read(selectedDate4Provider.notifier).state = dateTime;
                      }
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // By Grade Chart
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "By Grade",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF2C3E50),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ChartRoutesCompare(
                    height: 200,
                    width: double.infinity,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // By Characteristic Chart
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "By Characteristic",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF2C3E50),
                    ),
                  ),
                  const SizedBox(height: 16),
                  RadarChartRoutesCompare(),
                ],
              ),
            ),
            SizedBox(height: 30,)
          ],
        ),
      ),
    );
  }
}

class _DateRangeCard extends StatelessWidget {
  final String title;
  final DateTime fromDate;
  final DateTime toDate;
  final VoidCallback onFromTap;
  final VoidCallback onToTap;

  const _DateRangeCard({
    required this.title,
    required this.fromDate,
    required this.toDate,
    required this.onFromTap,
    required this.onToTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Color(0xFF2C3E50),
            ),
          ),
          const SizedBox(height: 12),
          _DateField(
            label: "From",
            date: fromDate,
            onTap: onFromTap,
          ),
          const SizedBox(height: 10),
          _DateField(
            label: "To",
            date: toDate,
            onTap: onToTap,
          ),
        ],
      ),
    );
  }
}

class _DateField extends StatelessWidget {
  final String label;
  final DateTime date;
  final VoidCallback onTap;

  const _DateField({
    required this.label,
    required this.date,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: const Color(0xFFF8F9FA),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey[200]!),
        ),
        child: Row(
          children: [
            Icon(
              Icons.calendar_today,
              size: 16,
              color: Colors.grey[600],
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    "${date.day}.${date.month}.${date.year}",
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2C3E50),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}