import 'package:climblog_mobile/database/database.dart';
import 'package:flutter/material.dart';

class BenchmarkCard extends StatelessWidget {
  final Benchmark benchmark;
  
  const BenchmarkCard({
    super.key,
    required this.benchmark,
  });

  @override
  Widget build(BuildContext context) {
    final sum = benchmark.ex1Points + 
                benchmark.ex2Points + 
                benchmark.ex3Points + 
                benchmark.ex4Points;
    
    final date = benchmark.createdAt;
    final dateStr = "${date.day}.${date.month}.${date.year - 2000}";

    return Container(
      width: 100,
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 231, 229, 229),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            dateStr,
            style: TextStyle(
              fontSize: 11,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            sum.toString(),
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: Color(0xFF2C3E50),
              height: 1,
            ),
          ),
          Text(
            'points',
            style: TextStyle(
              fontSize: 10,
              color: Colors.grey[500],
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}