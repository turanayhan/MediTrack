import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hap_takip/features/add/domain/entities/medicine.dart';
import 'package:hap_takip/features/add/presentation/bloc/add_medicine_event.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/gradient_button.dart';
import '../widget/basic_info_card.dart';
import '../widget/photo_card.dart';
import '../widget/reminders_card.dart';
import '../widget/schedule_card.dart';
import '../bloc/add_medicine_bloc.dart';

// Yeni ilaç ekleme ekranı için StatefulWidget
class AddMedicine extends StatefulWidget {
  const AddMedicine({super.key});

  @override
  State<AddMedicine> createState() => _AddMedicineState();
}

class _AddMedicineState extends State<AddMedicine> {
  // İlaç adı ve dozajı için controllerlar
  final TextEditingController _nameCtrl = TextEditingController();
  final TextEditingController _dosageCtrl = TextEditingController();

  // Seçilen ilaç tipi ve mevcut tipler listesi
  String? _selectedType;
  final List<String> _types = ['Tablet', 'Kapsül', 'Şurup', 'Damla'];

  // Rastgele renk üreten fonksiyon (ilaç durumu için)
  Color getRandomColor() {
    final Random random = Random();
    return Color.fromARGB(
      255, // Opaklık
      random.nextInt(256), // Kırmızı 0-255
      random.nextInt(256), // Yeşil 0-255
      random.nextInt(256), // Mavi 0-255
    );
  }

  // Fotoğraf ekleme işlemi için tıklama fonksiyonu (şu an sadece bilgi mesajı gösteriyor)
  void _onTapPhoto() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Tap to add photo (implement picker)')),
    );
  }

  // İlaç kaydetme işlemini gerçekleştiren fonksiyon
  void _onSaveMedicine() {
    final medicine = Medicine(
      name: _nameCtrl.text,
      dosage: _dosageCtrl.text,
      form: _selectedType ?? 'Tablet', // Default 'Tablet'
      progressCurrent: 0,
      progressTotal: 100, // Örneğin 100 birimlik ilaç
      frequency: 'Günlük', // Örneğin günlük
      nextTime: '2025-08-18 08:00:00',
      statusLabel: 'Başarıyla alındı',
      statusType: 'success',
      adherence: 80,
      iconPath: 'assets/icons/medicine_icon.png',
      statusColor: Colors.green,
      statusText: 'İlacı alın',
      statusIcon: Icons.check_circle,
      showActionButton: true,
      actionText: 'Tamamlandı',
      iconColor: Colors.blue,
       streakLabel: '',
    );

    // BLoC'a yeni ilacı ekleme işlemi
    context.read<AddMedicineBloc>().add(AddMedicines(medicine));
  }

  @override
  void dispose() {
    // Controllerları serbest bırak
    _nameCtrl.dispose();
    _dosageCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Yeni İlaç Ekle",
        emoji: "💊",
        actionText: "Kaydet",
        onBack: () {
          // Geri gitme işlemi (henüz implement edilmemiş)
        },
        onAction: _onSaveMedicine,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Fotoğraf kartı (ilaç fotoğrafı eklemek için)
              PhotoCard(onTapPhoto: _onTapPhoto),
              const SizedBox(height: 16),

              // Temel bilgi kartı (ilaç adı, dozajı, tipi)
              BasicInfoCard(
                nameCtrl: _nameCtrl,
                dosageCtrl: _dosageCtrl,
                selectedType: _selectedType,
                types: _types,
                onTypeChanged: (v) => setState(() => _selectedType = v),
              ),

              SizedBox(height: 16),
              // İlaç zamanlama kartı
              ScheduleCard(),
              SizedBox(height: 16),
              // Hatırlatıcılar kartı
              RemindersCard(),

              // Kaydet butonu
              Padding(
                padding: const EdgeInsets.only(top: 24, bottom: 32),
                child: GradientButton(
                  text: "İlacı Kaydet",
                  onPressed: _onSaveMedicine,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
