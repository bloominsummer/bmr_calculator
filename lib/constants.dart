import 'package:flutter/material.dart';

const activeCardColor = Color(0xFFF6F2FF);
const inactiveCardColor = Color(0xFFC4B2E2);
const bottomContainerHeight = 80.0;
const bottomContainerColor = Color(0xFFE45EAB);

enum Gender {
  male,
  female,
}

enum ActivityLevel {
  sedentary,    // Tidak aktif alias rebahan mulu
  light,        // 1-3x olahraga/minggu
  moderate,     // 3-5x olahraga/minggu
  active,       // 6-7x olahraga/minggu
  veryActive,   // Aktivitas berat setiap hari
}

const labelTextStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFFA64377),
);

const numberTextStyle = TextStyle(
  fontSize: 45.0,
  color: Color.fromARGB(255, 44, 131, 174),
  fontWeight: FontWeight.w900,
);

const buttonTextStyle = TextStyle(
  fontSize: 25,
  fontWeight: FontWeight.bold,
);

const resultTextStyle = TextStyle(
  color: Color(0xFF169D53),
  fontSize: 22,
  fontWeight: FontWeight.bold,
);

const bmrTextStyle = TextStyle(
  fontSize: 100,
  fontWeight: FontWeight.bold,
);