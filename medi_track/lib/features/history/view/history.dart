import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core/widgets/gradient_button.dart';

import '../model/medicine_status_model.drat.dart';
import '../widgets/pill_history_search.dart';
import '../widgets/medicine_status_card.dart';
import '../widgets/pill_history_top.dart';

class PillHistory extends StatefulWidget {
  const PillHistory({super.key});

  @override
  State<PillHistory> createState() => _PillHistoryState();
}

class _PillHistoryState extends State<PillHistory> {
  double adherence = 0.92;

  final List<MedicineStatus> medicines = [
    MedicineStatus(
      name: "Omega 3",
      dosage: "500mg",
      form: "Capsule",
      progressCurrent: 14,
      progressTotal: 30,
      frequency: "Once Daily",
      nextTime: "09:00 AM",
      statusLabel: "Excellent",
      statusType: "excellent",
      streakLabel: "🔥 7 days",
      adherence: 96,
      iconPath: "assets/icons/pill.png",
      statusColor: Colors.orange,
    ),
    MedicineStatus(
      name: "Magnesium",
      dosage: "250mg",
      form: "Tablet",
      progressCurrent: 22,
      progressTotal: 30,
      frequency: "Twice Daily",
      nextTime: "12:30 PM",
      statusLabel: "Good",
      statusType: "good",
      streakLabel: "⭐ 5 days",
      adherence: 89,
      iconPath: "assets/icons/pill.png",
      statusColor: Colors.pink,
    ),
  ];

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xFF47C26B),
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F8FE),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PillHistoryCard(adherence: adherence),
                  const SizedBox(height: 16),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: PillHistorySerch(),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ];
        },
        body: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          itemCount: medicines.length + 1, // Buton için +1
          itemBuilder: (context, index) {
            if (index < medicines.length) {
              return MedicineStatusCard(medicine: medicines[index]);
            } else {
              return Padding(
                padding: const EdgeInsets.only(top: 24, bottom: 32),
                child: GradientButton(
                  text: "Save Medicine",
                  onPressed: () {
                    print("Buton tıklandı");
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
