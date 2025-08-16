import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'action_card.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ActionCard(
            icon: Icons.add,
            iconColor: Colors.white,
            gradientColors: [
              Color(0xFF42A5F5), // Açık mavi
              Color(0xFFAB47BC), // Mor
            ],


            title: "İlaç Ekle",
            subtitle: "Yeni ilaç ekle",
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: ActionCard(
            icon: Icons.notifications_none,
            iconColor: Colors.white,
            gradientColors: [
              Color(0xFF66F9D5), // Açık yeşil (sol üst)
              Color(0xFF00C853), // Koyu yeşil (sağ alt)
            ],
            title: "Hatırlatıcı Ayarla",
            subtitle: "Bildirimleri yapılandır",
          ),
        ),
      ],
    );
  }
}

