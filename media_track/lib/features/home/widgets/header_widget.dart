import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),


      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Sol kısım
          Row(
            children: [
              // Mor Gradient ikon
              Container(
                width: 20,
                height: 20,

                child: const Icon(
                  Icons.calendar_month,
                  color: Color(0xFF165DFB),
                  size: 22,
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                "  Günlük İlaç Listesi",
                 style: TextStyle(
                   fontSize: 14,
                fontFamily: 'Poppins', // << Override etti
                fontWeight: FontWeight.normal,
              ),
              ),
            ],
          ),

          // Sağ kısım
          Row(
            children: [
              const Icon(Icons.add,  color: Color(0xFF165DFB), size: 18),
              const SizedBox(width: 4),
              Text(
                "Ekle",
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF165DFB),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
