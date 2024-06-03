import 'package:dms/modules/practice/riverpod.dart';
import 'package:dms/modules/todo_app/data/model/todo_hive_model.dart';
import 'package:dms/modules/todo_app/presentation/view/todo_page.dart';
import 'package:dms/services/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  // Hive.registerAdapter(GetDetailsModelAdapter());
  // Hive.registerAdapter(DataHiveAdapter());
  Hive.registerAdapter(ToDoHiveModelAdapter());
  Hive.registerAdapter(HiveItemAdapter());
  Hive.registerAdapter(HiveMetaAdapter());
  // await Hive.openBox<GetDetailsModel>('datas');
  await Hive.openBox<ToDoHiveModel>('datas');
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
      home: ProviderScope(
        // create: (context) => DashboardBloc(),
        child: TodoPage(),
      ),
    );
  }
}
