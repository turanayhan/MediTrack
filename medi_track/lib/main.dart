import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hap_takip/core/theme/app_theme.dart';
import 'package:hap_takip/features/add/data/model/medicine_dto.dart';
import 'package:hap_takip/features/add/data/repositories/add_medicine_repository_imp.dart';
import 'package:hap_takip/features/add/presentation/bloc/add_medicine_bloc.dart';
import 'package:hap_takip/features/add/presentation/bloc/add_medicine_event.dart';
import 'package:hap_takip/features/splash/presentation/screen/splash_screen.dart';
import 'package:hap_takip/config/routes/app_routes.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Bloc package

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Hive başlat
  final dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);

  await Hive.initFlutter();
  Hive.registerAdapter(MedicineDTOAdapter());
  final medicineBox = await Hive.openBox<MedicineDTO>('medicines');


  final repository = MedicineRepositoryImpl(medicineBox);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.blue,
      statusBarIconBrightness: Brightness.light,
    ),
  );

  runApp(
    BlocProvider(
      create: (_) =>
          AddMedicineBloc(repository)..add(LoadMedicines()), // Bloc'u başlat
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
