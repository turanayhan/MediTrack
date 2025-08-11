import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LegendDot extends StatelessWidget {
  final Color color;
  final int number;
  final String label;

  const LegendDot({
    Key? key,
    required this.color,
    required this.number,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // small colored dot
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        SizedBox(width: 8),
        // number bold + label muted
        RichText(
          text: TextSpan(
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[800],
              fontFamily: 'Poppins',
            ),
            children: [
              TextSpan(
                text: '$number',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'Poppins',
                ),
              ),
              TextSpan(
                text: ' $label',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.grey[600],
                  fontFamily: 'Poppins',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}