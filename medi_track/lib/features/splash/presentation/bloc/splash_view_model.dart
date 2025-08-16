import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hap_takip/config/routes/app_routes.dart';

class SplashViewModel extends ChangeNotifier {
  void startTimer(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, AppRoutes.dashboard);
    });
  }
}

class PlaceholderScreen extends StatelessWidget {
  const PlaceholderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Ana Sayfa')),
    );
  }
}
