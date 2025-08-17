

import 'package:bloc/bloc.dart';
import 'package:hap_takip/features/add/domain/repositories/add_medicine_repository.dart';
import 'package:hap_takip/features/add/presentation/bloc/add_medicine_event.dart';
import 'package:hap_takip/features/add/presentation/bloc/add_medicine_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddMedicineBloc extends Bloc<AddMedicineEvent, AddMedicineState> {
  final AddMedicineRepository repository;

  AddMedicineBloc(this.repository) : super(MedicineInitial()) {
    // İlaçları yükleme
    on<LoadMedicines>((event, emit) async {
      emit(MedicineLoading());
      try {
        final medicines = await repository.getAllMedicines(); // Asenkron işlemi await ile çağırıyoruz
        emit(MedicineLoaded(medicines));
      } catch (e) {
        emit(MedicineError("İlaçlar yüklenemedi: ${e.toString()}"));
      }
    });

    // Yeni ilaç ekleme
    on<AddMedicines>((event, emit) async {
      try {
        await repository.addMedicine(event.medicine); // İlaç ekleme işlemi
        final medicines = await repository.getAllMedicines(); // Yeni ilaç listesi
        emit(MedicineLoaded(medicines));
      } catch (e) {
        emit(MedicineError("İlaç eklenemedi: ${e.toString()}"));
      }
    });

    // İlaç silme
    on<DeleteMedicine>((event, emit) async {
      try {
        final int id = int.parse(event.key); // key'i int'e çeviriyoruz
        await repository.deleteMedicine(id); // İlaç silme işlemi
        final medicines = await repository.getAllMedicines(); // Güncellenmiş ilaç listesi
        emit(MedicineLoaded(medicines));
      } catch (e) {
        emit(MedicineError("İlaç silinemedi: ${e.toString()}"));
      }
    });
  }
}


