// Özellik kutuları
import 'package:flutter/cupertino.dart';

class FeatureBox extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final Color iconColor;

  const FeatureBox({
    required this.icon,
    required this.label,
    required this.color,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Icon(icon, color: iconColor, size: 32),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Color(0x99000031)),
        ),
      ],
    );
  }
}