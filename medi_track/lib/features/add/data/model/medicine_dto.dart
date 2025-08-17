import 'package:hive/hive.dart';

part 'medicine_dto.g.dart';

@HiveType(typeId: 0)
class MedicineDTO extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String dosage;

  @HiveField(2)
  final String form;

  @HiveField(3)
  final int progressCurrent;

  @HiveField(4)
  final int progressTotal;

  @HiveField(5)
  final String frequency;

  @HiveField(6)
  final String nextTime;

  @HiveField(7)
  final String statusLabel;

  @HiveField(8)
  final String statusType;

  @HiveField(9)
  final String streakLabel;

  @HiveField(10)
  final int adherence;

  @HiveField(11)
  final String iconPath;

  @HiveField(12)
  final int statusIconCodePoint;

  @HiveField(13)
  final String? statusIconFontFamily;

  @HiveField(14)
  final String statusText;

  @HiveField(15)
  final int statusColorValue;

  @HiveField(16)
  final bool showActionButton;

  @HiveField(17)
  final String? actionText;

  @HiveField(18)
  final int iconColorValue;

  MedicineDTO({
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
    required this.statusIconCodePoint,
    required this.statusIconFontFamily,
    required this.statusText,
    required this.statusColorValue,
    required this.showActionButton,
    required this.actionText,
    required this.iconColorValue,
  });
}
