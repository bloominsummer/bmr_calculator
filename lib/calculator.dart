//import 'dart:math';
import 'constants.dart';

class Calculator {
  Calculator(
    {required this.height,
     required this.weight,
     required this.gender,
     required this.age,
     required this.activityLevel,
    }
  );

  final int height;
  final int weight;
  final Gender gender;
  final int age;
  final ActivityLevel activityLevel;

  double bmr = 0.0;

  /// Hitung BMR menggunakan rumus Mifflin-St Jeor
  String calculateBMR(){
    if (gender == Gender.male){
      bmr = (10 * weight) + (6.25 * height) - (5 * age) + 5;
    } else {
      bmr = (10 * weight) + (6.25 * height) - (5 * age) - 161;
    }
    return bmr.toStringAsFixed(0);
  }

  /// Hitung TDEE berdasarkan tingkat aktivitas
  double calculateTDEE(ActivityLevel activitylevel){
    double factor;
    switch (activitylevel){
      case ActivityLevel.sedentary:
        factor = 1.2;
        break;
      case ActivityLevel.light:
        factor = 1.375;
        break;
      case ActivityLevel.moderate:
        factor = 1.55;
        break;
      case ActivityLevel.active:
        factor = 1.725;
        break;
      case ActivityLevel.veryActive:
        factor = 1.9;
        break;
    }
    return bmr * factor;
  }

  /// Rekomendasi kalori harian untuk menurunkan berat badan
  double caloriesForWeightLoss(double tdee) {
    return tdee * 0.85; // kurangi 15% dari kebutuhan kalori harian
  }

  /// Rekomendasi kalori harian untuk menaikkan berat badan
  double caloriesForGain(double tdee) {
    return tdee * 1.15; // tambah 15% dari kebutuhan kalori harian
  }

  /// Interpretasi hasil seperti contoh
  String getInterpretation(ActivityLevel activityLevel) {
    double tdee = calculateTDEE(activityLevel);
    double lose = caloriesForWeightLoss(tdee);
    double defisit = tdee - lose;

    return '''
    Kebutuhan kalori harian kamu adalah ${tdee.toStringAsFixed(0)} kkal/hari. Jika kamu ingin menurunkan berat badan, kamu membutuhkan ${lose.toStringAsFixed(0)} kkal/hari.
    Tubuh kamu membakar ${bmr.toStringAsFixed(0)} kkal/hari untuk tetap hidup. Jadi, setiap hari kamu perlu membakar ${defisit.toStringAsFixed(0)} kkal/hari untuk menurunkan berat badan secara sehat.
    ''';
  }
}