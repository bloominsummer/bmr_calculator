import 'package:bmr_calculator/components/bottom_button.dart';
import 'package:bmr_calculator/components/custom_card.dart';
import 'package:bmr_calculator/constants.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key, 
    required this.result,
    required this.information,
});

  final String result;
  final String information;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KALKULATOR BMR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Container(
            padding: const EdgeInsets.all(15.0),
            alignment: Alignment.bottomCenter,
            child: const Text(
              'HASIL',
              style: TextStyle(
                fontSize: 30.0,
                
                fontWeight: FontWeight.bold,
              ),),
            ),
          ),
          Expanded(
            flex: 5,
            child: CustomCard(
              color: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '$result kkal',
                    style: resultTextStyle,
                  ),
                  
                  Text(
                    information,
                    style: informationTextStyle,
                    textAlign: TextAlign.center,
                  
                    ),
                  
                ],
              ),
            ),
          ),
          BottomButton(
            buttonTitle: 'HITUNG ULANG',
            onTap: (){
              Navigator.pop(context);
            }),
        ],
      ),
    );
  }
}