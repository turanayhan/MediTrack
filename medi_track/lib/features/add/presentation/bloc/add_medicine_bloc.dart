
import 'package:bloc/bloc.dart';
import 'package:hap_takip/features/add/data/repositories/add_medicine_repository.dart';
import 'package:hap_takip/features/add/presentation/bloc/add_medicine_event.dart';
import 'package:hap_takip/features/add/presentation/bloc/add_medicine_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AddMedicineBloc extends Bloc<AddMedicineEvent, AddMedicineState> {
  final MedicineRepository repository;

  AddMedicineBloc(this.repository) : super(MedicineInitial()) {
    on<LoadMedicines>((event, emit) async {
      emit(MedicineLoading());
      try {
        final medicines = repository.getAllMedicines();
        emit(MedicineLoaded(medicines));
      } catch (e) {
        emit(MedicineError("İlaçlar yüklenemedi: ${e.toString()}"));
      }
    });

    on<AddMedicine>((event, emit) async {
      try {
        await repository.addMedicine(event.medicine);
        final medicines = repository.getAllMedicines();
        emit(MedicineLoaded(medicines));
      } catch (e) {
        emit(MedicineError("İlaç eklenemedi: ${e.toString()}"));
      }
    });

    on<DeleteMedicine>((event, emit) async {
      try {
        await repository.deleteMedicine(event.key);
        final medicines = repository.getAllMedicines();
        emit(MedicineLoaded(medicines));
      } catch (e) {
        emit(MedicineError("İlaç silinemedi: ${e.toString()}"));
      }
    });
  }
}

