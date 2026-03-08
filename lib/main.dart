import 'package:flutter/material.dart';
import 'package:latihan_kuis_123230110/pages/login_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Latihan Kuis 123230110',
      home: const LoginPage(),
    );
  }
}
