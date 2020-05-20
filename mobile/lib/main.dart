import 'package:flutter/material.dart';
import 'package:mrs/controller/funcionario_provider.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: FuncionarioProvider(),
        ),
      ],
      child: Consumer<FuncionarioProvider>(
        builder: (cxt, funconarios, _) => MaterialApp(
          title: 'MRS',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: HomePage(),
        ),
      ),
    );
  }
}
