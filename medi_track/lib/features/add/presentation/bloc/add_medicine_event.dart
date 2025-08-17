import '../../domain/entities/medicine.dart';


// Genel Base Event
abstract class AddMedicineEvent {}

class LoadMedicines extends AddMedicineEvent {}

class AddMedicines extends AddMedicineEvent {
  final Medicine medicine;

  AddMedicines(this.medicine);
}

class DeleteMedicine extends AddMedicineEvent {
  final String key;

  DeleteMedicine(this.key);
}
