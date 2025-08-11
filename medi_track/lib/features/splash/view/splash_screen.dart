import 'package:flutter/material.dart' hide AppBar;
import 'package:flutter/services.dart';
import 'package:hap_takip/features/splash/widgets/animated_dot.dart';
import 'package:provider/provider.dart';
import '../widgets/animated_medication_icon.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../widgets/floating_icon.dart';
import '../view_model/splash_view_model.dart';
import '../widgets/feature_box.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();


    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color(0xFFEBEFF5),
      statusBarIconBrightness: Brightness.dark,
    ));

    Future.microtask(() {
      context.read<SplashViewModel>().startTimer(context);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFFEBEFF5),
      body: SafeArea(
        child: Stack(
          children: [
            // Etraflardaki küçük ikonlar
            Positioned(
              top: 80,
              left: 40,
              child: FloatingIcon(
                icon: Icons.shield,
                bgColor: Colors.blue.shade400,
              ),
            ),
            Positioned(
              top: 80,
              right: 40,
              child: FloatingIcon(
                icon: Icons.favorite_border,
                bgColor: Colors.green.shade500,
              ),
            ),
            Positioned(
              top: 160,
              right: 20,
              child: FloatingIcon(
                icon: Icons.access_time,
                bgColor: Colors.purple.shade300,
              ),
            ),

            // Ana içerik
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Büyük ortadaki ikon
                  Container(
                    padding: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      color: const Color(0xFF7A5AF8),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const AnimatedMedicationIcon(),
                  ),

                  const SizedBox(height: 20),

                  // Uygulama başlığı
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Arial',
                      ),
                      children: [
                        TextSpan(text: 'Medi', style: TextStyle(color: Color(0xFF1062FE))),
                        TextSpan(text: 'Track', style: TextStyle(color: Color(0xFF1BC58D))),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    "Düzenli ilaç, sağlıklı yaşam",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF000031),
                    ),
                  ),

                  const SizedBox(height: 40),

                  // 3 özellik kutusu
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FeatureBox(
                        icon: Icons.medication_outlined,
                        label: 'İlaçlarını Yönet',
                        color: const Color(0xFFD8E6FF),
                        iconColor: const Color(0xFF1062FE),
                      ),
                      FeatureBox(
                        icon: Icons.access_time,
                        label: 'Hatırlatma Ayarla',
                        color: const Color(0xFFD4FDE1),
                        iconColor: const Color(0xFF1BC58D),
                      ),
                      FeatureBox(
                        icon: Icons.favorite_border,
                        label: 'Sağlığını Koru',
                        color: const Color(0xFFEEDBFF),
                        iconColor: const Color(0xFFB93AF4),
                      ),
                    ],
                  ),

                  const SizedBox(height: 40),

                  // Alt noktalar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      AnimatedDot(color: Color(0xFF1062FE), delayMilliseconds: 0),
                      AnimatedDot(color: Color(0xFF1BC58D), delayMilliseconds: 300),
                      AnimatedDot(color: Color(0xFFB93AF4), delayMilliseconds: 600),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Küçük etraf ikonlar




