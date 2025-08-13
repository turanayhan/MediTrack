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


class AddMedicine extends StatefulWidget {
  const AddMedicine({super.key});

  @override
  State<AddMedicine> createState() => _AddMedicineState();
}

class _AddMedicineState extends State<AddMedicine> {
  final TextEditingController _nameCtrl = TextEditingController();
  final TextEditingController _dosageCtrl = TextEditingController();
  String? _selectedType;
  final List<String> _types = ['Tablet', 'Kapsül', 'Şurup', 'Damla'];




  void _saveMedicine() async {
    final name = _nameCtrl.text.trim();
    final dosage = _dosageCtrl.text.trim();
    final type = _selectedType ?? '';



    final MedicineStatus medicine = MedicineStatus(
      name: "name",
      dosage: "dosage",
      form: "type",
      progressCurrent: 3,
      progressTotal: 7,
      frequency: "Günde 3 kez",
      nextTime: "14:00",
      statusLabel: "Harika!",
      statusType: "excellent",
      streakLabel: "3 gün üst üste alındı",
      adherence: 85,
      iconPath: "assets/icons/paracetamol.png",
      statusColor: Colors.green,
    );

    setState(() {
    //  _isSaving = true;
    });

    bool success = await context.read<AddViewModel>().saveMedicine(medicine);

    setState(() {
    //  _isSaving = false;
    });

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('İlaç başarıyla kaydedildi!')),
      );

      // Formu temizle
      _nameCtrl.clear();
      _dosageCtrl.clear();
      setState(() => _selectedType = null);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Lütfen tüm alanları doldurun.')),
      );
    }
  }



  @override
  void dispose() {
    _nameCtrl.dispose();
    _dosageCtrl.dispose();
    super.dispose();
  }

  void _onTapPhoto() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Tap to add photo (implement picker)')),
    );
  }

  @override
  Widget build(BuildContext context) {

    final medicines = Provider.of<AddViewModel>(context).medicines;

    return Scaffold(

      appBar: CustomAppBar(
        title: "Yeni İlaç Ekle",
        emoji: "💊",
        actionText: "Kaydet",
        onBack: () {
          // geri gitme işlemi
        },
        onAction: () {
          // save işlemi
        },
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(

            mainAxisAlignment:MainAxisAlignment.spaceEvenly,
            children: [
              // Üst kart: Medicine Photo
              PhotoCard(
                onTapPhoto: _onTapPhoto,
              )

              ,
              const SizedBox(height: 16),

              BasicInfoCard(
                nameCtrl: _nameCtrl,
                dosageCtrl: _dosageCtrl,
                selectedType: _selectedType,
                types: _types,
                onTypeChanged: (v) => setState(() => _selectedType = v),
              ),

              SizedBox(height: 16),
              ScheduleCard(),
              SizedBox(height: 16),
              RemindersCard(),


              // medicines listesini gösteren küçük bir liste
              const SizedBox(height: 16),
              Text(
                "Kaydedilen İlaçlar:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: medicines.length,
                itemBuilder: (context, index) {
                  final med = medicines[index];
                  return ListTile(
                    leading: const Icon(Icons.local_pharmacy_outlined),
                    title: Text(med.name),
                    subtitle: Text('${med.dosage} '),
                  );
                },
              ),

              Padding(
            padding: const EdgeInsets.only(top: 24, bottom: 32),
            child: GradientButton(
              text: "İlacı Kaydet",
              onPressed: () {
                print("Buton tıklandı");
               _saveMedicine();
              },
            ),
          )



            ],
          ),
        ),
      ),
    );
  }
}
