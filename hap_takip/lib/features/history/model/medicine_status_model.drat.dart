import 'dart:ui';

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
  final Color statusColor;


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

  });
}
