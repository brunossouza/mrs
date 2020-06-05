import 'package:flutter/material.dart';
import 'package:mrs/app/screens/funcionario_details.dart';
import './screens/home_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MRS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (cxt) => HomePage(),
        FuncionarioDetails.routeName: (cxt) => FuncionarioDetails(),
      },
    );
  }
}
