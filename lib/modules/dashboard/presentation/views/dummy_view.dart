import 'package:dms/modules/dashboard/presentation/bloc/dummy_bloc/dummy_bloc.dart';
import 'package:dms/modules/dashboard/presentation/bloc/dummy_bloc/dummy_event.dart';
import 'package:dms/modules/dashboard/presentation/bloc/dummy_bloc/dummy_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Data List'),
        ),
        body: BlocProvider(
          create: (context) => DummyBloc()..add(FetchDataEvent()),
          child: BlocConsumer<DummyBloc, DummyState>(
            listener: (context, state) {},
            builder: (context, state) {
              return ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ListTile(
                    tileColor: Colors.red.shade100,
                    title: const Text("Data"),
                    subtitle: const Text("saurabh"),
                    onTap: () {},
                  );
                },
              );
            },
          ),
        ));
  }
}
