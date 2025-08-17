import 'package:hap_takip/features/add/data/mappers/medicine_mapper.dart';
import 'package:hap_takip/features/add/data/model/medicine_dto.dart';
import 'package:hive/hive.dart';
import '../../domain/entities/medicine.dart';
 // Entity <-> DTO dönüşüm uzantıları burada

class MedicineRepository {
  final Box<MedicineDTO> _box;

  MedicineRepository(this._box);

  Future<void> addMedicine(Medicine medicine) async {
    final dto = medicine.toDTO();
    await _box.add(dto);
  }

  Future<void> updateMedicine(int key, Medicine medicine) async {
    final dto = medicine.toDTO();
    await _box.put(key, dto);
  }

  Future<void> deleteMedicine(int key) async {
    await _box.delete(key);
  }

  List<Medicine> getAllMedicines() {
    return _box.values.map((dto) => dto.toEntity()).toList();
  }

  Medicine? getMedicine(int key) {
    final dto = _box.get(key);
    return dto?.toEntity();
  }
}
