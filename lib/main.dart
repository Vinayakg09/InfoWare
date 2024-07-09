import 'package:flutter/material.dart';
import 'package:infoware_assign/bloc/my_bloc_bloc.dart';
import 'package:infoware_assign/data/data.dart';
import 'package:infoware_assign/view/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyBlocBloc(DataProvider()),
      child: MaterialApp(
        title: 'Infoware',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Home(),
      ),
    );
  }
}
