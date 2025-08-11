import 'package:flutter/material.dart';

class BlinkingInfoCard extends StatefulWidget {
  final String count;
  final String label;
  final IconData icon;

  const BlinkingInfoCard({
    super.key,
    required this.count,
    required this.label,
    required this.icon,
  });

  @override
  _BlinkingIconInfoCardState createState() => _BlinkingIconInfoCardState();
}

class _BlinkingIconInfoCardState extends State<BlinkingInfoCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    )..repeat(reverse: true);

    _colorAnimation = ColorTween(
      begin: Colors.red,
      end: Colors.red.withOpacity(0.2),
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.30;

    return Container(
      width: width,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.30),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          AnimatedBuilder(
            animation: _colorAnimation,
            builder: (context, child) {
              return CircleAvatar(
                backgroundColor: _colorAnimation.value,
                radius: 20,
                child: widget.count.isNotEmpty
                    ? Text(
                  widget.count,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                )
                    : Icon(widget.icon, color: Colors.white),
              );
            },
          ),
          const SizedBox(height: 8),
          Text(
            widget.label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0x99000031),
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    );
  }
}
