import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../../../core/widgets/gradient_button.dart';

import '../../../add/presentation/bloc/add_view_model.dart';
import '../../data/model/medicine_status_model.drat.dart';
import '../widget/pill_history_search.dart';
import '../widget/medicine_status_card.dart';
import '../widget/pill_history_top.dart';

class PillHistory extends StatefulWidget {
  const PillHistory({super.key});

  @override
  State<PillHistory> createState() => _PillHistoryState();
}

class _PillHistoryState extends State<PillHistory> {
  double adherence = 0.92;



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

    final medicines = Provider.of<AddViewModel>(context).medicines;

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
                    child: PillHistorySearch(),
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
                  text: "İlacı Kaydet",
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
