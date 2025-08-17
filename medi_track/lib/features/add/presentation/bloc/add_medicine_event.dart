import '../../domain/entities/medicine.dart';
import 'package:equatable/equatable.dart';

abstract class AddMedicineEvent extends Equatable {
  const AddMedicineEvent();

  @override
  List<Object?> get props => [];
}

class LoadMedicines extends AddMedicineEvent {}

class AddMedicine extends AddMedicineEvent {
  final Medicine medicine;

  const AddMedicine(this.medicine);

  @override
  List<Object?> get props => [medicine];
}

class DeleteMedicine extends AddMedicineEvent {
  final int key;

  const DeleteMedicine(this.key);

  @override
  List<Object?> get props => [key];
}
