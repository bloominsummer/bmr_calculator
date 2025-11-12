import 'package:bmr_calculator/calculator.dart';
import 'package:bmr_calculator/components/bottom_button.dart';
import 'package:bmr_calculator/components/custom_card.dart';
import 'package:bmr_calculator/components/icon_card.dart';
import 'package:bmr_calculator/components/round_icon_button.dart';
import 'package:bmr_calculator/constants.dart';
import 'package:bmr_calculator/pages/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.male;
  int height = 160;
  int weight = 60;
  int age = 20;
  ActivityLevel activityLevel = ActivityLevel.sedentary;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'KALKULATOR BMR',
          style: GoogleFonts.inter(
            color: Color(0xFFA64377),
            fontWeight: FontWeight.w700,
          ),
        ),
        elevation: 2,
        shadowColor: Colors.black,
      ),

      body: SingleChildScrollView(  // supaya tidak overflow dan bisa scroll
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            /// =====GENDER=====
            Row(
              children: [
                Expanded(
                  child: CustomCard(
                    color: selectedGender == Gender.male
                        ? activeCardColor
                        : inactiveCardColor,
                    cardChild: const IconCard(
                      cardIcon: FontAwesomeIcons.mars,
                      caption: 'LAKI-LAKI',
                    ),
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: CustomCard(
                    color: selectedGender == Gender.female
                        ? activeCardColor
                        : inactiveCardColor,
                    cardChild: const IconCard(
                      cardIcon: FontAwesomeIcons.venus,
                      caption: 'PEREMPUAN',
                    ),
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                  ),
                ),
              ],
            ),

            /// =====UMUR=====
            CustomCard(
              color: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('UMUR', style: labelTextStyle),
                  Text(age.toString(), style: numberTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RoundIconButton(
                        icon: FontAwesomeIcons.minus,
                        onPressed: () {
                          setState(() {
                            if (age > 1) age--;
                          });
                        },
                      ),
                      const SizedBox(width: 10.0),
                      RoundIconButton(
                        icon: FontAwesomeIcons.plus,
                        onPressed: () {
                          setState(() {
                            age++;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),

            /// =====TINGGI BADAN=====
            CustomCard(
              color: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('TINGGI BADAN', style: labelTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: numberTextStyle),
                      Text('cm', style: labelTextStyle),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Color(0xFFE45EAB),
                      inactiveTrackColor: const Color(0xFF80798C),
                      thumbColor: const Color(0xFFA64377),
                      thumbShape: const RoundSliderThumbShape(
                        enabledThumbRadius: 15.0,
                      ),
                      overlayShape: const RoundSliderOverlayShape(
                        overlayRadius: 30.0,
                      ),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double value) {
                        setState(() {
                          height = value.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),

            /// =====BERAT BADAN=====
            CustomCard(
              color: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('BERAT BADAN', style: labelTextStyle),
                  Text(weight.toString(), style: numberTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RoundIconButton(
                        icon: FontAwesomeIcons.minus,
                        onPressed: () {
                          setState(() {
                            if (weight > 30) weight--;
                          });
                        },
                      ),
                      const SizedBox(width: 10.0),
                      RoundIconButton(
                        icon: FontAwesomeIcons.plus,
                        onPressed: () {
                          setState(() {
                            weight++;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),

            /// =====DROPDOWN TINGKAT AKTIVITAS=====
            CustomCard(
              color: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('TINGKAT AKTIVITAS', style: labelTextStyle),
                  const SizedBox(height: 10),
                  DropdownButton<ActivityLevel>(
                    value: activityLevel,
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Color(0xFFE45EAB),
                    ),
                    dropdownColor: const Color.fromARGB(255, 173, 207, 255),
                    items: [
                      DropdownMenuItem(
                        value: ActivityLevel.sedentary,
                        child: Text(
                          'Aktivitas minimal, Suka rebahan',
                          style: dropdownTextStyle,
                        ),
                      ),
                      DropdownMenuItem(
                        value: ActivityLevel.light,
                        child: Text(
                          'Aktivitas ringan, Olahraga 1-3 kali/minggu',
                          style: dropdownTextStyle,
                        ),
                      ),
                      DropdownMenuItem(
                        value: ActivityLevel.moderate,
                        child: Text(
                          'Aktivitas menengah, Olahraga 3-5 kali/minggu',
                          style: dropdownTextStyle,
                        ),
                      ),
                      DropdownMenuItem(
                        value: ActivityLevel.active,
                        child: Text(
                          'Aktivitas berat, Olahraga 6-7 kali/minggu',
                          style: dropdownTextStyle,
                        ),
                      ),
                      DropdownMenuItem(
                        value: ActivityLevel.veryActive,
                        child: Text(
                          'Pekerja fisik, Olahraga 2',
                          style: dropdownTextStyle,
                        ),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        activityLevel = value!;
                      });
                    },
                  ),
                ],
              ),
            ),

            /// =====BUTTON HITUNG=====
            BottomButton(
              buttonTitle: 'HITUNG',
              onTap: () {
                Calculator cal = Calculator(
                  height: height,
                  weight: weight,
                  gender: selectedGender,
                  age: age,
                  activityLevel: activityLevel,
                );
                cal.calculateBMR();
                double result = cal.calculateTDEE(activityLevel);
                String information = cal.getInterpretation(activityLevel);

                // Navigasi ke halaman result
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ResultPage(result: result.toStringAsFixed(0), information: information),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
