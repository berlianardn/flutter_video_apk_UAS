import 'package:flutter/material.dart';
import 'package:todo_apk/pages/home.dart'; // Halaman Beranda

class MainPage extends StatelessWidget {
  final String role;
  final String name;

  const MainPage({super.key, required this.role, required this.name});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi YouTube Clone',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: BerandaPage(role: role, name: name),
    );
  }
}
