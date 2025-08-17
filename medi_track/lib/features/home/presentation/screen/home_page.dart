import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hap_takip/features/add/presentation/bloc/add_medicine_bloc.dart';
import 'package:hap_takip/features/add/presentation/bloc/add_medicine_state.dart';
import 'package:hap_takip/features/home/presentation/widget/quick_actions_card.dart';
import 'package:hap_takip/features/home/presentation/widget/top_container.dart';
import '../widget/blink_info_card.dart';
import '../widget/header_widget.dart' show HeaderWidget;
import '../widget/info_card.dart';
import '../widget/medicine_card.dart';
import '../widget/we_card.dart';


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
                  buildInfoCards(),
                  const SizedBox(height: 6),
                  HeaderWidget(),
                ],
              ),
            ),
          ];
        },
        body: BlocBuilder<AddMedicineBloc, AddMedicineState>(
          builder: (context, state) {
            if (state is MedicineInitial) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is MedicineLoaded) {
              return buildMedicineList(state);
            } else if (state is MedicineError) {
              return Center(child: Text('Error: ${state.message}'));
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }

  // Info kartlarını birleştiren widget
  Widget buildInfoCards() {
    return Row(
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
    );
  }

  // İlaçları listeleyen widget
  Widget buildMedicineList(MedicineLoaded state) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: state.medicines.length + 1, // Quick Actions slot
      itemBuilder: (context, index) {
        if (index < state.medicines.length) {
          return MedicineCard(
            medicine: state.medicines[index],
            onActionTap: () {
              debugPrint("${state.medicines[index].name} tıklandı");
            },
          );
        } else {
          return buildQuickActions();
        }
      },
    );
  }

  // Hızlı işlemler ve WeekCard'ı birleştiren widget
  Widget buildQuickActions() {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.electric_bolt_rounded,
                color: Colors.yellow,
                size: 24,
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
          const QuickActions(),
          const SizedBox(height: 16),
          const WeekCard(
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
}
