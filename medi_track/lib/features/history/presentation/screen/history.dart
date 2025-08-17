import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/widgets/gradient_button.dart';
import '../widget/pill_history_search.dart';
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
          itemCount:  1, // Buton için +1
          itemBuilder: (context, index) {
            if (index < 3) {
              
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
