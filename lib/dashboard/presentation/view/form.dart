import 'package:dms/dashboard/data/model/get_details_hive_model.dart';
import 'package:dms/dashboard/presentation/bloc/form_bloc.dart';
import 'package:dms/dashboard/presentation/bloc/form_event.dart';
import 'package:dms/dashboard/presentation/bloc/form_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
                BlocProvider(
                  create: (context) =>
                      DashboardBloc()..add(DashboardInitEvent()),
                  child: BlocBuilder<DashboardBloc, DashboardState>(
                      builder: (context, state) {
                    if (state is GetDataSuccessState) {
                      print(state.uiData.length);
                      return SingleChildScrollView(
                          child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                        height: 600,
                                        child: ListView.builder(
                                          itemCount: state.uiData.length,
                                          itemBuilder: (context, index) {
                                            var name = state.uiData[index].name;
                                            var id = state.uiData[index].id;
                                            var data = state.uiData[index].data;
                                            print(data?.color ?? "hey");
                                            return ListTile(
                                                title: RichText(
                                              text: TextSpan(children: [
                                                TextSpan(text: "ID : $id \n"),
                                                TextSpan(
                                                    text: "Name : $name \n"),
                                                TextSpan(
                                                    text:
                                                        "Data : {\n Color :  ${data?.color}\n Price :   ${data?.price ?? "-"} \n CPU MOdel :   ${data?.cpuModel ?? "-"}  \n Generation :   ${data?.generation ?? "-"}  \n Capacity :   ${data?.capacity ?? "-"} \n CapacityGB :   ${data?.capacityGb ?? 0} \n Screen Size : ${data?.screenSize ?? 0} \n }"),
                                              ]),
                                            ));
                                          },
                                        )),
                                  ])));
                    }
                    return const Scaffold(
                      body: Text("data"),
                    );
                  }),
                ),
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
