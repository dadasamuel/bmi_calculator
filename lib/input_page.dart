import 'package:bmi_calculator/all_class.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const activeCardColour = Color(0xFF1D1E33);
const inactiveCardColour = Color(0xFF111328);

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // Color maleCardColor = inactiveCardColour;
  // Color femaleCardColor = inactiveCardColour;

  // void updateColor(Gender gender) {
  //   if (gender == Gender.male) {
  //     if (maleCardColor == inactiveCardColour) {
  //       maleCardColor = activeCardColour;
  //       femaleCardColor = inactiveCardColour;
  //     } else {
  //       maleCardColor = inactiveCardColour;
  //     }
  //   } else {
  //     if (gender == Gender.female) {
  //       if (femaleCardColor == inactiveCardColour) {
  //         femaleCardColor = activeCardColour;
  //         maleCardColor = inactiveCardColour;
  //       } else {
  //         femaleCardColor = inactiveCardColour;
  //       }
  //     }
  //   }
  // }
  Gender? gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: [
            Expanded(
                child: Row(children: [
              Expanded(
                  child: ReusableCard(
                      onPress: () {
                        setState(() {
                          gender = Gender.male;
                        });
                      },
                      //ternary operation
                      colour: gender == Gender.male
                          ? activeCardColour
                          : inactiveCardColour,
                      cardChild: IconContent(
                          icon: FontAwesomeIcons.mars, label: 'MALE'))),
              Expanded(
                  child: ReusableCard(
                onPress: () {
                    setState(() {
                      gender = Gender.female;
                  });
                },
                //ternary operation
                colour: gender == Gender.female
                    ? activeCardColour
                    : inactiveCardColour,
                cardChild:
                    IconContent(icon: FontAwesomeIcons.venus, label: 'FEMALE'),
              ))
            ])),
            Expanded(
                child: ReusableCard(
                  onPress: (){},
                    colour: activeCardColour,
                    cardChild: Column(
                      children: [Text('HEIGHT')],
                    ))),
            // Expanded(
            //     child: Row(children: [
            //   Expanded(child: ReusableCard(colour: activeCardColour)),
            //   Expanded(child: ReusableCard(colour: activeCardColour))
            // ])),
            Container(
              color: Color(0xFFEB1555),
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: 80.0,
            )
          ],
        ));
  }
}
