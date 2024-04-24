import 'package:dms/dashboard/data/model/get_details_hive_model.dart';
import 'package:dms/dashboard/presentation/bloc/form_bloc.dart';
import 'package:dms/dashboard/presentation/bloc/form_event.dart';
import 'package:dms/dashboard/presentation/bloc/form_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future<List<GetDetailsModel>> myList = getTask();

    return Scaffold(
      body: BlocProvider(
          create: (context) => DashboardBloc(),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<DashboardBloc, DashboardState>(
                  builder: (context, state) {
                    return ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<DashboardBloc>(context, listen: false)
                              .add(DashboardInitEvent());
                        },
                        child: const Text("data"));
                  },
                ),
                // BlocBuilder<DashboardBloc, DashboardState>(
                //   builder: (context, state) {
                //     if (state is GetDataSuccessState) {}
                //   },
                // )
              ],
            ),
          )),
    );
  }

  Future<List<GetDetailsModel>> getTask() async {
    final dataBox = await Hive.openBox<GetDetailsModel>('datas');
    return dataBox.values.toList();
  }
}
