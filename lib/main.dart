import 'package:dms/dashboard/data/model/get_details_hive_model.dart';
import 'package:dms/dashboard/presentation/bloc/form_bloc.dart';
import 'package:dms/dashboard/presentation/view/form.dart';
import 'package:dms/dashboard/presentation/view/forms.dart';
import 'package:dms/services/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(GetDetailsModelAdapter());
  Hive.registerAdapter(DataHiveAdapter());
  await Hive.openBox<GetDetailsModel>('datas');
  initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => DashboardBloc(),
        child: FormScreen(),
      ),
    );
  }
}
