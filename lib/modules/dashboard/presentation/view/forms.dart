import 'package:dms/modules/dashboard/data/model/get_details_hive_model.dart';
import 'package:dms/modules/dashboard/presentation/bloc/form_bloc.dart';
import 'package:dms/modules/dashboard/presentation/bloc/form_event.dart';
import 'package:dms/modules/dashboard/presentation/bloc/form_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 70,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<DashboardBloc>(context)
                          .add(DashboardInitEvent());
                    },
                    child: const Text("Submit")),
                ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<DashboardBloc>(context)
                          .add(DashBoardBackEvent());
                    },
                    child: const Text("Back")),
                ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<DashboardBloc>(context)
                          .add(DashBoardHiveEvent());
                    },
                    child: const Text("Hive")),
              ],
            ),
            const SizedBox(
              height: 70,
            ),
            Container(
              height: 500,
              width: 500,
              color: Colors.amber,
              child: BlocBuilder<DashboardBloc, DashboardState>(
                builder: (context, state) {
                  print(state);
                  if (state is GetDataSuccessState) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.uiData.length,
                      itemBuilder: (context, index) {
                        var name = state.uiData[index].name;
                        var id = state.uiData[index].id;
                        var data = state.uiData[index].data;
                        // print(data?.color ?? "hey");
                        return ListTile(
                            title: RichText(
                          text: TextSpan(children: [
                            TextSpan(text: "ID : $id \n"),
                            TextSpan(text: "Name : $name \n"),
                            TextSpan(
                                text:
                                    "Data : {\n Color :  ${data?.color}\n Price :   ${data?.price ?? "-"} \n CPU MOdel :   ${data?.cpuModel ?? "-"}  \n Generation :   ${data?.generation ?? "-"}  \n Capacity :   ${data?.capacity ?? "-"} \n CapacityGB :   ${data?.capacityGb ?? 0} \n Screen Size : ${data?.screenSize ?? 0} \n }"),
                          ]),
                        ));
                      },
                    );
                  } else {
                    return Container(
                      height: 500,
                      width: 500,
                      color: Colors.red,
                      child: const Center(
                          child: Text(
                        "error",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w800),
                      )),
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
