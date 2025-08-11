import 'package:flutter/material.dart';

class BasicInfoCard extends StatelessWidget {
  final TextEditingController nameCtrl;
  final TextEditingController dosageCtrl;
  final String? selectedType;
  final List<String> types;
  final ValueChanged<String?> onTypeChanged;

  const BasicInfoCard({
    Key? key,
    required this.nameCtrl,
    required this.dosageCtrl,
    required this.selectedType,
    required this.types,
    required this.onTypeChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double cardRadius = 16;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(cardRadius),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.30),
              blurRadius: 10,
              offset: Offset(0, 5),
            ),]
      ),
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Başlık
          Row(
            children: [
              Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  color: const Color(0xFFEAF0FF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.local_pharmacy_outlined, color: Color(0xFF6B8BFF)),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Text(
                  'Temel Bilgiler',
                  style: TextStyle(
                    fontSize: 16.5,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Medicine Name
          const Text(
            'İlaç Adı *',
            style: TextStyle(
              fontSize: 13.5,
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins',
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: nameCtrl,
            decoration: _inputDecoration('İlaç adını girin'),
          ),
          const SizedBox(height: 18),

          // Dosage & Type
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Doz *',
                      style: TextStyle(
                        fontSize: 13.5,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: dosageCtrl,
                      decoration: _inputDecoration('örn: 500mg'),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Tür',
                      style: TextStyle(
                        fontSize: 13.5,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                      value: selectedType,
                      items: types.map((t) => DropdownMenuItem(value: t, child: Text(t))).toList(),
                      onChanged: onTypeChanged,
                      decoration: _inputDecoration('Tür seçin'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade200),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade200),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide(color: Color(0xFFB7C4FF)),
      ),
    );
  }
}
