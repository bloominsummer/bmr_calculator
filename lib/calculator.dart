import 'constants.dart';

class Calculator {
  /// Konstruktor data yang dibutuhkan
  Calculator({
    required this.height,
    required this.weight,
    required this.gender,
    required this.age,
    required this.activityLevel,
  });

  /// Data input dari pengguna
  final int height;
  final int weight;
  final Gender gender;
  final int age;
  final ActivityLevel activityLevel;

  double bmr = 0.0;

  /// Hitung BMR (Basal Metabolic Rate) menggunakan rumus Mifflin-St Jeor
  String calculateBMR() {
    if (gender == Gender.male) {
      bmr = (10 * weight) + (6.25 * height) - (5 * age) + 5;
    } else {
      bmr = (10 * weight) + (6.25 * height) - (5 * age) - 161;
    }
    return bmr.toStringAsFixed(0);
  }

  /// Hitung TDEE (Total Daily Energy Expenditure) berdasarkan tingkat aktivitas
  double calculateTDEE(ActivityLevel activitylevel) {
    double factor;
    switch (activitylevel) {
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

  /// Interpretasi hasil
  String getInterpretation(ActivityLevel activityLevel) {
    double tdee = calculateTDEE(activityLevel);
    double lose = caloriesForWeightLoss(tdee);
    double gain = caloriesForGain(tdee);
    double defisit = tdee - lose;
    double surplus = gain - tdee;

    return '''
    Karena aktivitasmu tergolong ${activityLevelLabel(activityLevel)}, tubuhmu butuh sekitar ${tdee.toStringAsFixed(0)} kalori setiap hari supaya punya cukup energi untuk beraktivitas. Dari jumlah itu, ${bmr.toStringAsFixed(0)} kalori dipakai tubuhmu hanya untuk tetap hidup (seperti bernapas dan jantung berdetak).

    Kalau kamu ingin menurunkan berat badan, coba makan sekitar ${lose.toStringAsFixed(0)} kalori per hari. Artinya, kamu perlu mengurangi sekitar ${defisit.toStringAsFixed(0)} kalori dari kebutuhan harianmu supaya berat badan turun secara perlahan dan tetap sehat.

    Sebaliknya, kalau kamu ingin menaikkan berat badan, kamu bisa makan sekitar ${gain.toStringAsFixed(0)} kalori per hari, atau menambah sekitar ${surplus.toStringAsFixed(0)} kalori dari kebutuhan harianmu.
    ''';
  }

  String activityLevelLabel(ActivityLevel level) {
    switch (level) {
      case ActivityLevel.sedentary:
        return 'sangat ringan (banyak duduk/rebahan)';
      case ActivityLevel.light:
        return 'ringan (sedikit olahraga)';
      case ActivityLevel.moderate:
        return 'menengah (olahraga beberapa kali seminggu)';
      case ActivityLevel.active:
        return 'berat (aktif dan sering olahraga)';
      case ActivityLevel.veryActive:
        return 'sangat berat (pekerjaan fisik atau latihan rutin)';
    }
  }
}
