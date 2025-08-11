import 'package:flutter/material.dart';

class Medicine {
  final String title;
  final String dosage;
  final String time;
  final String statusText;
  final Color statusColor;
  final IconData statusIcon;
  final Color iconColor;
  final bool showActionButton;
  final String? actionText;

  Medicine({
    required this.title,
    required this.dosage,
    required this.time,
    required this.statusText,
    required this.statusColor,
    required this.statusIcon,
    required this.iconColor,
    this.showActionButton = false,
    this.actionText,
  });
}
