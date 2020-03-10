import 'package:flutter/material.dart';
import 'HomePage.dart';

void main() => runApp(EmployeeApp());

class EmployeeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      title: "My Employee App",
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
    );
  }
}
