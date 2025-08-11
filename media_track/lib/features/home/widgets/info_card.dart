
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String count;
  final String label;
  final Color color;
  final IconData icon;

  InfoCard({
    required this.count,
    required this.label,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.30; // ekran genişliğinin %40'ı

    return Container(
      width: width,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.30),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: color,
            radius: 20,
            child: count.isNotEmpty
                ? Text(
              count,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            )
                : Icon(icon, color: Colors.white),
          ),
          SizedBox(height: 8),
          Text(

            label,
            textAlign: TextAlign.center,

              style: const TextStyle(fontSize: 12, color: Color(0x99000031))
            ),

        ],
      ),
    );
  }
}