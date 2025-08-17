
import '../entities/medicine.dart';

abstract class AddMedicineRepository {
  Future<void> addMedicine(Medicine medicine);
  Future<void> updateMedicine(int key, Medicine medicine);
  Future<void> deleteMedicine(int key);
  List<Medicine> getAllMedicines();
  Medicine? getMedicine(int key);
}

