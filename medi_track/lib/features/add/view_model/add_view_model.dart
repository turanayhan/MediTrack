import 'package:flutter/material.dart';
import 'package:hap_takip/features/history/model/medicine_status_model.drat.dart';




class AddViewModel extends ChangeNotifier {
  final List<MedicineStatus> _medicines = [];

  List<MedicineStatus> get medicines => List.unmodifiable(_medicines);

  Future<bool> saveMedicine(MedicineStatus medicine) async {
    // Basit validasyon örneği
    if (medicine.name.isEmpty || medicine.dosage.isEmpty ) {
      return false;
    }

    // Burada gerçek veritabanı işlemi yapılabilir, örn: SQLite, API vs.
    await Future.delayed(const Duration(seconds: 1)); // Simülasyon
    _medicines.add(medicine);
    notifyListeners();
    return true;
  }
}
