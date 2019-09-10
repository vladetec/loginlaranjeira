import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:loginlaranjeira/src/app-bloc.dart';

import 'login/login-widget.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppBloc>(
      bloc: AppBloc(),
      child: MaterialApp(
        title: "Laragjeira login",
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginWidget()
      ),
      
    );
  }
}



