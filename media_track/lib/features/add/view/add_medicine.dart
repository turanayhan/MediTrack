import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

import '../../../core/widgets/custom_app_bar.dart';
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
  final List<String> _types = ['Tablet', 'Capsule', 'Syrup', 'Drops'];


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
    return Scaffold(

      appBar: CustomAppBar(
        title: "Add New Medicine",
        emoji: "💊",
        actionText: "Save",
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

              // Alt kart: Basic Information
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

            ],
          ),
        ),
      ),
    );
  }
}
