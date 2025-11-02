import 'package:flutter/material.dart';

class PreselectTreningCard extends StatelessWidget {
  final String name;
  final String? backgroundImage; 

  const PreselectTreningCard({
    super.key,
    required this.name,
    this.backgroundImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      
      height: 60,
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
          const SizedBox(height: 4),
          Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
        ],
      ),
    );
  }
}
