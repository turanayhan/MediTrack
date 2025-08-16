import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hap_takip/core/theme/app_theme.dart';
import 'package:hap_takip/features/add/presentation/bloc/add_view_model.dart';
import 'package:hap_takip/features/splash/presentation/screen/splash_screen.dart';
import 'package:hap_takip/config/routes/app_routes.dart';
import 'package:provider/provider.dart';

import 'features/splash/presentation/bloc/splash_view_model.dart';

void main() {

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.blue,
    statusBarIconBrightness: Brightness.light,
  ));
  runApp(
    //provider tanımlama
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashViewModel()),
        ChangeNotifierProvider(create: (_) => AddViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splash,
      onGenerateRoute: AppRoutes.generateRoute,
      theme: AppTheme.lightTheme,


      home: const SplashScreen(),
    );
  }
}


