import 'package:bmr_calculator/components/bottom_button.dart';
import 'package:bmr_calculator/components/custom_card.dart';
import 'package:bmr_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({
    super.key,
    required this.result,
    required this.information,
  });

  final String result;
  final String information;

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
        iconTheme: const IconThemeData(color: Color(0xFFA64377)),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          /// ====='HASIL'=====
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 5.0),
              padding: const EdgeInsets.all(5.0),
              alignment: Alignment.bottomCenter,
              child: Text(
                'HASIL',
                style: GoogleFonts.inter(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFFE45EAB),
                ),
              ),
            ),
          ),

          /// =====CARD HASIL=====
          Expanded(
            flex: 5,
            child: SingleChildScrollView(
              child: CustomCard(
                color: activeCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('$result kkal', style: resultTextStyle),
                    SizedBox(height: 20.0),
                    Text(
                      information,
                      style: informationTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),

          /// =====BUTTON HITUNG ULANG=====
          BottomButton(
            buttonTitle: 'HITUNG ULANG',
            onTap: () {
              Navigator.pop(context); // Kembali ke halaman input
            },
          ),
        ],
      ),
    );
  }
}
