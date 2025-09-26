import 'package:climblog_mobile/Riverpod/local_routes_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DateFilterButtons extends ConsumerWidget {
  const DateFilterButtons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentFilter = ref.watch(dataProvider);
    
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            _buildFilterButton(
              context, 
              'All', 
              DateFilterOption.all, 
              currentFilter, 
              ref
            ),
            _buildFilterButton(
              context, 
              '24h', 
              DateFilterOption.lastDay, 
              currentFilter, 
              ref
            ),
            _buildFilterButton(
              context, 
              '1 Week', 
              DateFilterOption.lastWeek, 
              currentFilter, 
              ref
            ),
            _buildFilterButton(
              context, 
              '1 Month', 
              DateFilterOption.lastMonth, 
              currentFilter, 
              ref
            ),
            _buildFilterButton(
              context, 
              '3 Months', 
              DateFilterOption.last3Months, 
              currentFilter, 
              ref
            ),
            _buildFilterButton(
              context, 
              '6 Months', 
              DateFilterOption.last6Months, 
              currentFilter, 
              ref
            ),
            _buildFilterButton(
              context, 
              '1 Year', 
              DateFilterOption.lastYear, 
              currentFilter, 
              ref
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterButton(
    BuildContext context,
    String label,
    DateFilterOption option,
    DateFilterOption currentOption,
    WidgetRef ref,
  ) {
    final isSelected = option == currentOption;
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ElevatedButton(
        onPressed: () {
          ref.read(dataProvider.notifier).state = option;
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected 
              ? const Color(0xFF00a896) 
              : Colors.white,
          foregroundColor: isSelected 
              ? Theme.of(context).colorScheme.onPrimary 
              : const Color(0xFF00a896) ,
          elevation: isSelected ? 2 : 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        ),
        child: Text(label),
      ),
    );
  }
}