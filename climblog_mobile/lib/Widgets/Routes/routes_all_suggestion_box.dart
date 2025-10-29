import 'package:climblog_mobile/Riverpod/local_routes_riverpod.dart';
import 'package:climblog_mobile/Widgets/Shared/basic_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RoutesAllSuggestionBox extends ConsumerStatefulWidget {
  const RoutesAllSuggestionBox({super.key});

  @override
  ConsumerState<RoutesAllSuggestionBox> createState() => _RoutesAllSuggestionBoxState();
}

class _RoutesAllSuggestionBoxState extends ConsumerState<RoutesAllSuggestionBox> {
  bool _isExpanded = false;
  
  static const Color _primaryColor = Color(0xFF00a896);

  @override
  Widget build(BuildContext context) {
    final characteristicsCount = ref.watch(routeCharacteristicsCountProvider);
    
    var routesMapToSort = {
      "Powery": characteristicsCount.powery,
      "Crimpy": characteristicsCount.crimpy,
      "Dynamic": characteristicsCount.dynamic,
      "Sloppy": characteristicsCount.sloppy,
    };
    
    final helper = routesMapToSort.keys.toList(growable: false)
      ..sort((k1, k2) => (routesMapToSort[k2] as int).compareTo(routesMapToSort[k1] as int));
    
    final mostFocused = helper[0];
    final leastFocused = helper[helper.length - 1];
    
    return BasicContainer(
      child: Column(
        children: [
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              borderRadius: BorderRadius.circular(12),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(9),
                      decoration: BoxDecoration(
                        color: _primaryColor.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.analytics_outlined,
                        color: _primaryColor,
                        size: 22,
                      ),
                    ),
                    const SizedBox(width: 14),
                    const Expanded(
                      child: Text(
                        "Training Insights",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.2,
                          color: Color(0xFF1a1a1a),
                        ),
                      ),
                    ),
                    Icon(
                      _isExpanded 
                        ? Icons.keyboard_arrow_up_rounded 
                        : Icons.keyboard_arrow_down_rounded,
                      color: Colors.grey.shade500,
                      size: 24,
                    ),
                  ],
                ),
              ),
            ),
          ),
          
          AnimatedSize(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            child: _isExpanded
                ? Column(
                    children: [
                      Divider(
                        height: 1,
                        thickness: 1,
                        color: Colors.grey.shade200,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18),
                        child: Column(
                          children: [
                            _InsightCard(
                              icon: Icons.trending_up_rounded,
                              iconColor: _primaryColor,
                              backgroundColor: _primaryColor.withOpacity(0.1),
                              borderColor: _primaryColor.withOpacity(0.3),
                              label: "High Focus",
                              value: mostFocused,
                              count: routesMapToSort[mostFocused] as int,
                            ),
                            
                            const SizedBox(height: 14),
                            
                            _InsightCard(
                              icon: Icons.lightbulb_outline_rounded,
                              iconColor: Colors.grey.shade700,
                              backgroundColor: Colors.grey.shade50,
                              borderColor: Colors.grey.shade300,
                              label: "Consider Training",
                              value: leastFocused,
                              count: routesMapToSort[leastFocused] as int,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}

class _InsightCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;
  final Color borderColor;
  final String label;
  final String value;
  final int count;

  const _InsightCard({
    required this.icon,
    required this.iconColor,
    required this.backgroundColor,
    required this.borderColor,
    required this.label,
    required this.value,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: borderColor,
          width: 1.5,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(11),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(11),
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Text(
                      value,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.1,
                        color: Color(0xFF1a1a1a),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.grey.shade300,
                          width: 1,
                        ),
                      ),
                      child: Text(
                        "$count routes",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}