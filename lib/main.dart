import 'package:dms/dashboard/data/model/get_details_hive_model.dart';
import 'package:dms/dashboard/presentation/view/form.dart';
import 'package:dms/services/locator.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(GetDetailsModelAdapter());
  await Hive.openBox<GetDetailsModel>('datas');
  initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
