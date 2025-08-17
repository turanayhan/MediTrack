import 'package:hap_takip/features/add/domain/entities/medicine.dart';
import 'package:equatable/equatable.dart';

abstract class AddMedicineState extends Equatable {
  const AddMedicineState();

  @override
  List<Object?> get props => [];
}

class MedicineInitial extends AddMedicineState {}

class MedicineLoading extends AddMedicineState {}

class MedicineLoaded extends AddMedicineState {
  final List<Medicine> medicines;

  const MedicineLoaded(this.medicines);

  @override
  List<Object?> get props => [medicines];
}


class MedicineError extends AddMedicineState {
  final String message;

  const MedicineError(this.message);

  @override
  List<Object?> get props => [message];
}

