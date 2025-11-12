import 'package:bmr_calculator/calculator.dart';
import 'package:bmr_calculator/components/bottom_button.dart';
import 'package:bmr_calculator/components/custom_card.dart';
import 'package:bmr_calculator/components/icon_card.dart';
import 'package:bmr_calculator/components/round_icon_button.dart';
import 'package:bmr_calculator/constants.dart';
import 'package:bmr_calculator/pages/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
      appBar: AppBar(title: const Text('BMR CALCULATOR')),
      body: SingleChildScrollView( // supaya tidak overflow
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            /// GENDER
            Row(
              children: [
                Expanded(
                  child: CustomCard(
                    color: selectedGender == Gender.male
                        ? activeCardColor
                        : inactiveCardColor,
                    cardChild: const IconCard(
                      cardIcon: FontAwesomeIcons.mars,
                      caption: 'MALE',
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
                      caption: 'FEMALE',
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

            /// AGE
            CustomCard(
              color: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('AGE', style: labelTextStyle),
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

            /// HEIGHT
            CustomCard(
              color: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('HEIGHT', style: labelTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: numberTextStyle),
                      const Text('cm', style: labelTextStyle),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.black,
                      inactiveTrackColor: const Color(0xFF80798C),
                      thumbColor: const Color(0xFFE45EAB),
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

            /// WEIGHT
            CustomCard(
              color: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('WEIGHT', style: labelTextStyle),
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

            /// ACTIVITY LEVEL DROPDOWN
            CustomCard(
              color: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('ACTIVITY LEVEL', style: labelTextStyle),
                  const SizedBox(height: 10),
                  DropdownButton<ActivityLevel>(
                    value: activityLevel,
                    dropdownColor: activeCardColor,
                    items: const [
                      DropdownMenuItem(
                        value: ActivityLevel.sedentary,
                        child: Text('Aktivitas minimal'),
                      ),
                      DropdownMenuItem(
                        value: ActivityLevel.light,
                        child: Text('Aktivitas ringan'),
                      ),
                      DropdownMenuItem(
                        value: ActivityLevel.moderate,
                        child: Text('Aktivitas menengah'),
                      ),
                      DropdownMenuItem(
                        value: ActivityLevel.active,
                        child: Text('Aktivitas berat'),
                      ),
                      DropdownMenuItem(
                        value: ActivityLevel.veryActive,
                        child: Text('Pekerja fisik'),
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

            /// CALCULATE BUTTON
            BottomButton(
              buttonTitle: 'CALCULATE',
              onTap: () {
                Calculator cal = Calculator(
                  height: height,
                  weight: weight,
                  gender: selectedGender,
                  age: age,
                  activityLevel: activityLevel,
                );
                String result = cal.calculateBMR();
                String information = cal.getInterpretation(activityLevel);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      result: result,
                      information: information,
                      bmr: '',
                    ),
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
