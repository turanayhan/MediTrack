// lib/core/theme/app_gradient.dart

import 'package:flutter/material.dart';

class AppGradient {
  /// İki renk alır, LinearGradient döner.
  static LinearGradient linear({
    required Color startColor,
    required Color endColor,
    Alignment begin = Alignment.topLeft,
    Alignment end = Alignment.bottomRight,
  }) {
    return LinearGradient(
      colors: [startColor, endColor],
      begin: begin,
      end: end,
    );
  }

  /// Opsiyonel radius ile RadialGradient
  static RadialGradient radial({
    required Color centerColor,
    required Color edgeColor,
    Alignment center = Alignment.center,
    double radius = 0.8,
  }) {
    return RadialGradient(
      colors: [centerColor, edgeColor],
      center: center,
      radius: radius,
    );
  }

  /// Sweep gradient istersen (isteğe bağlı)
  static SweepGradient sweep({
    required List<Color> colors,
    Alignment center = Alignment.center,
  }) {
    return SweepGradient(
      colors: colors,
      center: center,
    );
  }
}
