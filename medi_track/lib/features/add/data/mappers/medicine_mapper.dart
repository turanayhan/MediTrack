// lib/features/medicines/data/models/medicine_mapper.dart

import 'package:flutter/material.dart';
import '../../domain/entities/medicine.dart';
import '../model/medicine_dto.dart';

extension MedicineMapper on MedicineDTO {
  Medicine toEntity() {
    return Medicine(
      name: name,
      dosage: dosage,
      form: form,
      progressCurrent: progressCurrent,
      progressTotal: progressTotal,
      frequency: frequency,
      nextTime: nextTime,
      statusLabel: statusLabel,
      statusType: statusType,
      streakLabel: streakLabel,
      adherence: adherence,
      iconPath: iconPath,
      statusIcon: IconData(statusIconCodePoint, fontFamily: statusIconFontFamily),
      statusText: statusText,
      statusColor: Color(statusColorValue),
      showActionButton: showActionButton,
      actionText: actionText,
      iconColor: Color(iconColorValue),
    );
  }
}

extension MedicineEntityMapper on Medicine {
  MedicineDTO toDTO() {
    return MedicineDTO(
      name: name,
      dosage: dosage,
      form: form,
      progressCurrent: progressCurrent,
      progressTotal: progressTotal,
      frequency: frequency,
      nextTime: nextTime,
      statusLabel: statusLabel,
      statusType: statusType,
      streakLabel: streakLabel,
      adherence: adherence,
      iconPath: iconPath,
      statusIconCodePoint: statusIcon.codePoint,
      statusIconFontFamily: statusIcon.fontFamily,
      statusText: statusText,
      statusColorValue: statusColor.value,
      showActionButton: showActionButton,
      actionText: actionText,
      iconColorValue: iconColor.value,
    );
  }
}
