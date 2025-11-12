import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Warna dan ukuran
const activeCardColor = Color(0xFFF6F2FF);
const inactiveCardColor = Color.fromARGB(255, 173, 207, 255);
const bottomContainerHeight = 80.0;
const bottomContainerColor = Color(0xFFE45EAB);

/// Enum untuk jenis kelamin
enum Gender {
  male,
  female,
}

/// Enum untuk tingkat aktivitas harian
enum ActivityLevel {
  sedentary,    // Tidak aktif alias rebahan mulu
  light,        // 1-3x olahraga/minggu
  moderate,     // 3-5x olahraga/minggu
  active,       // 6-7x olahraga/minggu
  veryActive,   // Aktivitas berat setiap hari
}

/// Gaya Teks
/// labelTextStyle: label tiap cards
final labelTextStyle = GoogleFonts.inter(
  fontSize: 18.0,
  color: Color(0xFFA64377),
  fontWeight: FontWeight.bold
);

/// numberTextStyle: untuk angka besar spt berat, tinggi, umur
final numberTextStyle = GoogleFonts.inter(
  fontSize: 45.0,
  color: Colors.blueAccent,
  fontWeight: FontWeight.w900,
);

/// buttonTextStyle: teks button
final buttonTextStyle = GoogleFonts.inter(
  fontSize: 25,
  fontWeight: FontWeight.bold,
);

/// resultTextStyle: angka hasil BMR/TDEE di laman result
final resultTextStyle = GoogleFonts.inter(
  color: Color.fromARGB(255, 169, 11, 98),
  fontSize: 45,
  fontWeight: FontWeight.bold,
);

/// informationTextStyle: teks penjelasan hasil BMR/TDEE di laman result
final informationTextStyle = GoogleFonts.inter(
  color: Colors.black,
  fontSize: 14,
);

/// dropdownTextStyle: teks pada item dropdown tingkat aktivitas
final dropdownTextStyle = GoogleFonts.inter(
  color: Color(0xFFE45EAB),
  fontSize: 14,
  fontWeight: FontWeight.w500
);