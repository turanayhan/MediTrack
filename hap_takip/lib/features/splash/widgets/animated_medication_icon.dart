import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AnimatedMedicationIcon extends StatefulWidget {
  const AnimatedMedicationIcon({super.key});

  @override
  State<AnimatedMedicationIcon> createState() => _AnimatedMedicationIconState();
}

class _AnimatedMedicationIconState extends State<AnimatedMedicationIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    )..repeat(reverse: true);

    _fadeAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child:SvgPicture.asset(
        'assets/images/pill.svg',
        width: 60,
        height: 60,
        color: Colors.white,
      )

    );
  }
}
