import 'package:bmr_calculator/pages/input_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// Bersifat stateless karena tidak memiliki data yang berubah-ubah.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /// Tema aplikasi
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color.fromARGB(255, 173, 207, 255),
        scaffoldBackgroundColor: const Color.fromARGB(255, 173, 207, 255),
        appBarTheme: const AppBarTheme(
          backgroundColor:  Color.fromARGB(255, 173, 207, 255),
          centerTitle: true,
          elevation: 0.0,
        ),
      ),
      debugShowCheckedModeBanner: false, 
      home: InputPage(),    /// Halaman utama yg ditampilkan
    );
  }
}