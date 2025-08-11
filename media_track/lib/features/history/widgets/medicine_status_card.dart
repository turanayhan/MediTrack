import 'package:flutter/material.dart';

import '../model/medicine_status_model.drat.dart';

class MedicineStatusCard extends StatelessWidget {
  final MedicineStatus medicine;

  const MedicineStatusCard({super.key, required this.medicine});

  Color _statusColor() {
    switch (medicine.statusType) {
      case "excellent":
        return Colors.green;
      case "good":
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  void _onMenuSelected(BuildContext context, String value) {
    switch (value) {
      case 'edit':
      // Edit işlemi
        break;
      case 'duplicate':
      // Duplicate işlemi
        break;
      case 'pause':
      // Pause işlemi
        break;
      case 'delete':
      // Delete işlemi
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 10,
            spreadRadius: 1,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Üst Satır
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // İkon
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: medicine.statusColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.medication,
                    color: Color(0xFF165DFB),
                    size: 16,
                  ),
                ),
              ),
              const SizedBox(width: 12),

              // İlaç bilgileri
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      medicine.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "${medicine.dosage} • ${medicine.form}",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),

              // View + Menü
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      // View butonu tıklandı
                    },
                    child: Text(
                      "View",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.blue.shade700,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  PopupMenuButton<String>(
                    onSelected: (value) => _onMenuSelected(context, value),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        value: 'edit',
                        child: Text("Edit"),
                      ),
                      const PopupMenuItem(
                        value: 'duplicate',
                        child: Text("Duplicate"),
                      ),
                      const PopupMenuItem(
                        value: 'pause',
                        child: Text("Pause"),
                      ),
                      const PopupMenuDivider(),
                      const PopupMenuItem(
                        value: 'delete',
                        child: Text(
                          "Delete",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                    icon: const Icon(Icons.more_vert),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Progress Bar
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Progress",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              Text(
                "${medicine.progressCurrent}/${medicine.progressTotal}",
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 4),
          LinearProgressIndicator(
            value: medicine.progressCurrent / medicine.progressTotal,
            color: Colors.blue,
            backgroundColor: Colors.grey.shade200,
            minHeight: 6,
            borderRadius: BorderRadius.circular(8),
          ),

          const SizedBox(height: 12),

          // Zaman ve etiketler
          Row(
            children: [
              const Icon(Icons.calendar_today, size: 14, color: Colors.grey),
              const SizedBox(width: 4),
              Text(
                medicine.frequency,
                style: const TextStyle(fontSize: 12),
              ),
              const SizedBox(width: 12),
              const Icon(Icons.access_time, size: 14, color: Colors.grey),
              const SizedBox(width: 4),
              Text(
                "Next: ${medicine.nextTime}",
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // Status ve Streak
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: _statusColor().withOpacity(0.15),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  medicine.statusLabel,
                  style: TextStyle(
                    color: _statusColor(),
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.purple.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  medicine.streakLabel,
                  style: const TextStyle(
                    color: Colors.purple,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Adherence
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.yellow.withOpacity(0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const Text(
                  "Adherence",
                  style: TextStyle(fontSize: 12),
                ),
                const Spacer(),
                Text(
                  "${medicine.adherence}%",
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          LinearProgressIndicator(
            value: medicine.adherence / 100,
            color: Colors.blue,
            backgroundColor: Colors.grey.shade200,
            minHeight: 4,
          ),
        ],
      ),
    );
  }
}
