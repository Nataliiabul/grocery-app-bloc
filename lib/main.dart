import 'package:flutter/material.dart';
import 'package:grocery_app_bloc/features/home/ui/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.teal,
      accentColor: Colors.teal),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}