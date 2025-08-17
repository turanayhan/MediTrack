// domain/repositories/medicine_repository.dart

import 'package:hap_takip/features/add/data/mappers/medicine_mapper.dart';
import 'package:hap_takip/features/add/domain/repositories/add_medicine_repository.dart';
import 'package:hap_takip/features/add/domain/entities/medicine.dart';
// data/repositories/medicine_repository_impl.dart
import 'package:hive/hive.dart';
import 'package:hap_takip/features/add/data/model/medicine_dto.dart';

class MedicineRepositoryImpl implements AddMedicineRepository {
  final Box<MedicineDTO> _box;

  // Repository constructor'ı
  MedicineRepositoryImpl(this._box);

  @override
  Future<void> addMedicine(Medicine medicine) async {
    final dto = medicine.toDTO(); // Entity -> DTO dönüşümü
    await _box.add(dto); // Hive'a ekle
  }

  @override
  Future<void> updateMedicine(int key, Medicine medicine) async {
    final dto = medicine.toDTO(); // Entity -> DTO dönüşümü
    await _box.put(key, dto); // Hive'da güncelle
  }

  @override
  Future<void> deleteMedicine(int key) async {
    await _box.delete(key); // Hive'dan sil
  }

  @override
  List<Medicine> getAllMedicines() {
    // Hive'dan veriyi alıp Entity'ye dönüştürerek listeyi döndür
    return _box.values.map((dto) => dto.toEntity()).toList();
  }

  @override
  Medicine? getMedicine(int key) {
    final dto = _box.get(key); // Hive'dan belirli bir veriyi al
    return dto?.toEntity(); // DTO -> Entity dönüşümü
  }
}

