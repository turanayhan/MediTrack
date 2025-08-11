import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActionCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final List<Color> gradientColors;
  final String title;
  final String subtitle;

  const ActionCard({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.gradientColors,
    required this.title,
    required this.subtitle,
  });


  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight * 0.25, // Ekranın %30'u
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Boşlukları eşitle


        children: [

          LayoutBuilder(
            builder: (context, constraints) {
              final boxSize = constraints.maxWidth * 0.40; // genişliğin %25’i

              return Container(
                width: boxSize,
                height: boxSize,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: gradientColors,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: iconColor, size: boxSize * 0.45),
              );
            },
          )
,

          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            textAlign: TextAlign.center,
          ),

          Text(
            subtitle,
            style: TextStyle(color: Colors.grey[600], fontSize: 12),
            textAlign: TextAlign.center,
          ),


        ],
      ),
    );
  }

}