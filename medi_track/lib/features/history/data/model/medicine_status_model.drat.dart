import 'dart:ui';

import 'package:flutter/cupertino.dart';

class MedicineStatus {
  final String name;
  final String dosage;
  final String form;
  final int progressCurrent;
  final int progressTotal;
  final String frequency;
  final String nextTime;
  final String statusLabel;
  final String statusType; // "excellent", "good", etc.
  final String streakLabel;
  final int adherence; // %
  final String iconPath;
  final IconData statusIcon;
  final String statusText;
  final Color statusColor;
  final bool showActionButton;
  final String? actionText;
  final Color iconColor;




  MedicineStatus({
    required this.name,
    required this.dosage,
    required this.form,
    required this.progressCurrent,
    required this.progressTotal,
    required this.frequency,
    required this.nextTime,
    required this.statusLabel,
    required this.statusType,
    required this.streakLabel,
    required this.adherence,
    required this.iconPath,
    required this.statusColor,
    required this.statusText,
    required this.statusIcon,
    required this.showActionButton,
    required this.actionText,
    required this.iconColor,

  });
}
