import 'package:flutter/material.dart';
import 'package:clima/screens/loading_screen.dart';
void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.white,
    ),
        darkTheme: ThemeData(            /*For Automatic brightness/Theme of App */
          brightness: Brightness.dark,
          primaryColor: Color.fromRGBO(1, 1, 1,1),
        ),home: LoadingScreen(),);
  }
}
