import 'package:flutter/material.dart';
import 'package:hap_takip/features/history/data/model/medicine_status_model.drat.dart';

class MedicineCard extends StatelessWidget {
  final MedicineStatus medicine;
  final VoidCallback? onActionTap;

  const MedicineCard({super.key, required this.medicine, this.onActionTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.30),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          // İlaç ikonu
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: medicine.statusColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: Container(
                  width: 24, // Beyaz daire çapı
                  height: 24,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.medication, // İstediğin ikon
                    color: Color(0xFF165DFB), // İkon rengi
                    size: 16, // Küçük ikon boyutu
                  ),
                ),
              ),
              Positioned(
                right: -4,
                top: -4,
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.white,
                  child: Icon(
                    medicine.statusIcon,
                    color: medicine.statusColor,
                    size: 14,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(width: 12),

          // Orta kısım
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  medicine.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "${medicine.dosage} • ${medicine.nextTime}",
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 14,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 6),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: medicine.statusColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        medicine.statusIcon,
                        color: medicine.statusColor,
                        size: 14,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        medicine.statusText,
                        style: TextStyle(
                          color: medicine.statusColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Sağ buton
          if (medicine.showActionButton)
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: onActionTap,
              child: Text(
                medicine.actionText ?? "",
                style: const TextStyle(color: Colors.white),
              ),
            )
          else
            TextButton(
              onPressed: () {},
              child: const Text(
                "Görüntüle",
                style: TextStyle(color: Colors.blue, fontFamily: 'Poppins'),
              ),
            ),
        ],
      ),
    );
  }
}
