// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicine_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MedicineDTOAdapter extends TypeAdapter<MedicineDTO> {
  @override
  final int typeId = 0;

  @override
  MedicineDTO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MedicineDTO(
      name: fields[0] as String,
      dosage: fields[1] as String,
      form: fields[2] as String,
      progressCurrent: fields[3] as int,
      progressTotal: fields[4] as int,
      frequency: fields[5] as String,
      nextTime: fields[6] as String,
      statusLabel: fields[7] as String,
      statusType: fields[8] as String,
      streakLabel: fields[9] as String,
      adherence: fields[10] as int,
      iconPath: fields[11] as String,
      statusIconCodePoint: fields[12] as int,
      statusIconFontFamily: fields[13] as String?,
      statusText: fields[14] as String,
      statusColorValue: fields[15] as int,
      showActionButton: fields[16] as bool,
      actionText: fields[17] as String?,
      iconColorValue: fields[18] as int,
    );
  }

  @override
  void write(BinaryWriter writer, MedicineDTO obj) {
    writer
      ..writeByte(19)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.dosage)
      ..writeByte(2)
      ..write(obj.form)
      ..writeByte(3)
      ..write(obj.progressCurrent)
      ..writeByte(4)
      ..write(obj.progressTotal)
      ..writeByte(5)
      ..write(obj.frequency)
      ..writeByte(6)
      ..write(obj.nextTime)
      ..writeByte(7)
      ..write(obj.statusLabel)
      ..writeByte(8)
      ..write(obj.statusType)
      ..writeByte(9)
      ..write(obj.streakLabel)
      ..writeByte(10)
      ..write(obj.adherence)
      ..writeByte(11)
      ..write(obj.iconPath)
      ..writeByte(12)
      ..write(obj.statusIconCodePoint)
      ..writeByte(13)
      ..write(obj.statusIconFontFamily)
      ..writeByte(14)
      ..write(obj.statusText)
      ..writeByte(15)
      ..write(obj.statusColorValue)
      ..writeByte(16)
      ..write(obj.showActionButton)
      ..writeByte(17)
      ..write(obj.actionText)
      ..writeByte(18)
      ..write(obj.iconColorValue);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MedicineDTOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
