import 'package:hap_takip/features/add/domain/entities/medicine.dart';
import 'package:hap_takip/features/add/domain/repositories/add_medicine_repository.dart';

class AddMedicineUseCase {
  final AddMedicineRepository repository;

  AddMedicineUseCase(this.repository);

  Future<void> execute(Medicine medicine) {
    return repository.addMedicine(medicine);
  }
}
