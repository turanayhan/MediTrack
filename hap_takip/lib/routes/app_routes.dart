import 'package:flutter/material.dart';
import 'package:hap_takip/features/dashboard/view/dashboard.dart';
import '../../features/splash/view/splash_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String dashboard = '/dashboard';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case dashboard:
        return MaterialPageRoute(builder: (_) => const Dashboard());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Sayfa bulunamadı')),
          ),
        );
    }
  }
}
