import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hap_takip/features/history/model/medicine_status_model.drat.dart';
import 'package:provider/provider.dart';

import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/widgets/gradient_button.dart';

import '../view_model/add_view_model.dart';
import '../widgets/basic_info_card.dart';
import '../widgets/photo_card.dart';
import '../widgets/reminders_card.dart';
import '../widgets/schedule_card.dart';

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

  // İlaç kaydetme işlemini gerçekleştiren fonksiyon
  void _saveMedicine() async {
    final name = _nameCtrl.text.trim();
    final dosage = _dosageCtrl.text.trim();
    final type = _selectedType ?? '';

    // İlaç modelini oluştur
    final MedicineStatus medicine = MedicineStatus(
      name: name,
      dosage: "$dosage mg",
      form: type,
      progressCurrent: 3,
      progressTotal: 7,
      frequency: "Günde 3 kez",
      nextTime: "14:00",
      statusLabel: "Harika!",
      statusType: "excellent",
      streakLabel: "3 gün üst üste alındı",
      adherence: 85,
      iconPath: "assets/images/medicinesCol",
      statusColor: getRandomColor(),
      statusText: "günde 3 defa",
      statusIcon: Icons.calendar_month,
      showActionButton: true,
      actionText: 'İncele',
      iconColor: Colors.grey,
    );

    setState(() {
      //  _isSaving = true; // Kaydetme işlemi başlatıldı (opsiyonel)
    });

    // ViewModel üzerinden kaydetme işlemini çağır
    bool success = await context.read<AddViewModel>().saveMedicine(medicine);

    setState(() {
      //  _isSaving = false; // Kaydetme işlemi bitti (opsiyonel)
    });

    if (success) {
      // Başarılıysa kullanıcıya bilgi ver ve formu temizle
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('İlaç başarıyla kaydedildi!')),
      );

      _nameCtrl.clear();
      _dosageCtrl.clear();
      setState(() => _selectedType = null);
    } else {
      // Hata durumunda kullanıcıya uyarı göster
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Lütfen tüm alanları doldurun.')),
      );
    }
  }

  @override
  void dispose() {
    // Controllerları serbest bırak
    _nameCtrl.dispose();
    _dosageCtrl.dispose();
    super.dispose();
  }

  // Fotoğraf ekleme işlemi için tıklama fonksiyonu (şu an sadece bilgi mesajı gösteriyor)
  void _onTapPhoto() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Tap to add photo (implement picker)')),
    );
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
        onAction: () {
          // Kaydetme işlemi (henüz implement edilmemiş)
        },
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

              // İlaç listesini gösteren küçük bir liste (şu an eklenmemiş)
              const SizedBox(height: 16),

              // Kaydet butonu
              Padding(
                padding: const EdgeInsets.only(top: 24, bottom: 32),
                child: GradientButton(
                  text: "İlacı Kaydet",
                  onPressed: () {
                    print("Buton   tıklandı");
                    _saveMedicine();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
