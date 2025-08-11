import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hap_takip/features/home/widgets/action_card.dart';
import 'package:hap_takip/features/home/widgets/quick_actions_card.dart';
import 'package:hap_takip/features/home/widgets/top_container.dart';

import '../widgets/blink_info_card.dart';
import '../widgets/header_widget.dart' show HeaderWidget;
import '../widgets/info_card.dart';
import '../../../utils/app_gradient.dart';
import '../widgets/medicine_card.dart';
import '../model/medicine.dart';
import '../widgets/we_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    // Status bar ayarı
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xFF6877E1), // Şeffaf yap
        statusBarIconBrightness: Brightness.light, // Android: Siyah ikonlar
        statusBarBrightness: Brightness.light, // iOS: Beyaz ikonlar
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Dinamik veri listesi
    final List<Medicine> medicines = [
      Medicine(
        title: "Vitamin D",
        dosage: "1000 IU",
        time: "08:00 AM",
        statusText: "Taken",
        statusColor: Colors.green,
        statusIcon: Icons.check_circle,
        iconColor: Colors.orange,
      ),
      Medicine(
        title: "Blood Pressure",
        dosage: "10mg",
        time: "12:00 PM",
        statusText: "Due Now",
        statusColor: Colors.red,
        statusIcon: Icons.access_time,
        iconColor: Colors.pink,
        showActionButton: true,
        actionText: "Take Now",
      ),
      Medicine(
        title: "Calcium",
        dosage: "500mg",
        time: "06:00 PM",
        statusText: "Upcoming",
        statusColor: Colors.blue,
        statusIcon: Icons.event,
        iconColor: Colors.green,
      ),
      Medicine(
        title: "Sleep Aid",
        dosage: "5mg",
        time: "10:00 PM",
        statusText: "Upcoming",
        statusColor: Colors.blue,
        statusIcon: Icons.event,
        iconColor: Colors.purple,
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF3F8FE),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  topContainer(context),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InfoCard(
                        count: '',
                        label: "Günlük Alım",
                        color: Colors.blue,
                        icon: Icons.medication,
                      ),
                      InfoCard(
                        count: '',
                        label: 'Alınan İlaçlar',
                        color: Colors.green,
                        icon: Icons.check_circle,
                      ),
                      BlinkingInfoCard(
                        count: '',
                        label: 'Kaçan İlaçlar',
                        icon: Icons.error_outline,
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  HeaderWidget(),
                ],
              ),
            ),
          ];
        },
        body: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          itemCount: medicines.length + 1, // Quick Actions ek slot
          itemBuilder: (context, index) {
            if (index < medicines.length) {
              return MedicineCard(
                medicine: medicines[index],
                onActionTap: () {
                  debugPrint("${medicines[index].title} tıklandı");
                },
              );
            } else {
              return Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 22,
                          height: 22,
                          child: const Icon(
                            Icons.electric_bolt_rounded,
                            color: Colors.yellow,
                            size: 24,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          " Hızlı İşlemler",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    QuickActions(),
                    const SizedBox(height: 16),
            WeekCard(
            progress: 0.92,
            taken: 28,
            missed: 2,
            upcoming: 5,
            adherence: 92,
            ),


                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
