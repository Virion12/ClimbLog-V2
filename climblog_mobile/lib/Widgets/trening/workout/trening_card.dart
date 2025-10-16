import 'package:flutter/material.dart';

class TreningCard extends StatelessWidget {
  final String name;
  final DateTime createdAt;
  final bool isMain;
  final String? backgroundImage; 

  const TreningCard({
    super.key,
    required this.name,
    required this.createdAt,
    required this.isMain,
    this.backgroundImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 160,
      margin: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
      padding: const EdgeInsets.only(top: 8, bottom: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: const Color.fromARGB(255, 241, 240, 240),
        image: backgroundImage != null
            ? DecorationImage(
                image: AssetImage(backgroundImage!),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withValues(alpha: 0.7),
                  BlendMode.darken,
                ),
              )
            : null,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Visibility(
            visible: isMain,
            child: const Icon(Icons.star_rate, color: Colors.amber),
          ),
          const SizedBox(height: 4),
          Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            "${createdAt.day}.${createdAt.month}.${createdAt.year}",
            style: const TextStyle(fontSize: 10,color: Colors.white),
          ),
        ],
      ),
    );
  }
}
