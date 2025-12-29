import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'screens/home_screen.dart';

// Импорт моделей для адаптеров
import 'models/client.dart';
import 'models/pet.dart';
import 'models/pet_photo.dart';
import 'models/appointment.dart';
import 'models/groomer.dart';
import 'models/service.dart';
import 'models/salon.dart';
import 'models/animal_type.dart';
import 'models/animal_type_adapter.dart';

// Импорт сервисов
import 'services/groomer_service.dart';
import 'services/salon_service.dart';
import 'services/service_service.dart';
import 'services/client_service.dart';
import 'services/pet_service.dart';
import 'services/appointment_service.dart';

void main() async {
  // Инициализация виджетов Flutter
  WidgetsFlutterBinding.ensureInitialized();
  
  try {
    // Инициализация Hive
    final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    
    // Регистрация адаптеров
    Hive.registerAdapter(GroomerAdapter());
    Hive.registerAdapter(SalonAdapter());
    Hive.registerAdapter(ServiceAdapter());
    Hive.registerAdapter(PetAdapter());
    Hive.registerAdapter(PetPhotoAdapter());
    Hive.registerAdapter(ClientAdapter());
    Hive.registerAdapter(AnimalTypeAdapter());
    Hive.registerAdapter(AppointmentAdapter());
    
    // Инициализация сервисов
    await GroomerService.init();
    await SalonService.init();
    await ServiceService.init();
    await ClientService.init();
    await PetService.init();
    await AppointmentService.init();
    
    print('Hive and services initialized successfully');
  } catch (e) {
    print('Error initializing Hive: $e');
    // Можно добавить fallback на моковые данные
  }
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Мастер-грумер',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 2,
        ),
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
