import 'package:flutter/material.dart';

class ScheduleCard extends StatefulWidget {
  const ScheduleCard({super.key});

  @override
  State<ScheduleCard> createState() => _ScheduleCardState();
}

class _ScheduleCardState extends State<ScheduleCard> {
  String? selectedFrequency;
  String? selectedDuration;

  final List<String> frequencyOptions = [
    "Her gün",
    "8 saatte bir",
    "12 saatte bir",
    "Haftada bir",
  ];

  final List<String> durationOptions = [
    "1 hafta",
    "2 hafta",
    "1 ay",
    "3 ay",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: const [
              Icon(Icons.schedule, color: Colors.green),
              SizedBox(width: 8),
              Text(
                "Program",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Two dropdowns with labels
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Sıklık",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.black87,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const SizedBox(height: 6),
                    _buildDropdown(
                      hint: "Ne sıklıkta?",
                      value: selectedFrequency,
                      items: frequencyOptions,
                      onChanged: (value) {
                        setState(() => selectedFrequency = value);
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Süre",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.black87,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const SizedBox(height: 6),
                    _buildDropdown(
                      hint: "Ne kadar süre?",
                      value: selectedDuration,
                      items: durationOptions,
                      onChanged: (value) {
                        setState(() => selectedDuration = value);
                      },
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

  Widget _buildDropdown({
    required String hint,
    required String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButton<String>(
        value: value,
        hint: Text(
          hint,
          style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
        ),
        underline: const SizedBox(),
        isExpanded: true,
        icon: Icon(Icons.keyboard_arrow_down, color: Colors.grey.shade600),
        items: items
            .map((item) => DropdownMenuItem(
          value: item,
          child: Text(item),
        ))
            .toList(),
        onChanged: onChanged,
      ),
    );
  }

  static BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.30),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),]
    );
  }
}
