import 'package:flutter/material.dart';

class PillHistoryCard extends StatelessWidget {
  final double adherence; // 0.0 - 1.0 arası
  const PillHistoryCard({super.key, required this.adherence});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF28C76F), Color(0xFF66BB6A)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),

      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Başlık
          Row(
            children: const [
              Text(
                "Pill History ",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Poppins',
                ),
              ),
              Text(
                "📊",
                style: TextStyle(fontSize: 18),
              )
            ],
          ),
          const SizedBox(height: 4),
          const Text(
            "Track your medication journey",
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontFamily: 'Poppins',
            ),
          ),
          const SizedBox(height: 20),

          // Adherence Box
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Üst satır
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Overall Adherence",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    Icon(Icons.trending_up, color: Colors.white, size: 18),
                  ],
                ),
                const SizedBox(height: 10),

                // Progress bar + Yüzde
                Row(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: LinearProgressIndicator(
                          value: adherence,
                          backgroundColor: Colors.white.withOpacity(0.3),
                          valueColor: const AlwaysStoppedAnimation<Color>(
                              Colors.blueAccent),
                          minHeight: 8,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "${(adherence * 100).toStringAsFixed(0)}%",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  "Keep up the great work! 💪",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
