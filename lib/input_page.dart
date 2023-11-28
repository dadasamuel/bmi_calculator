import 'package:bmi_calculator/all_class.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // Color maleCardColor = inactiveCardColor;
  // Color femaleCardColor = inactiveCardColor;

  // void updateColor(Gender gender) {
  //   if (gender == Gender.male) {
  //     if (maleCardColor == inactiveCardColor) {
  //       maleCardColor = activeCardColor;
  //       femaleCardColor = inactiveCardColor;
  //     } else {
  //       maleCardColor = inactiveCardColor;
  //     }
  //   } else {
  //     if (gender == Gender.female) {
  //       if (femaleCardColor == inactiveCardColor) {
  //         femaleCardColor = activeCardColor;
  //         maleCardColor = inactiveCardColor;
  //       } else {
  //         femaleCardColor = inactiveCardColor;
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
                      color: gender == Gender.male
                          ? activeCardColor
                          : inactiveCardColor,
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
                color: gender == Gender.female
                    ? activeCardColor
                    : inactiveCardColor,
                cardChild:
                    IconContent(icon: FontAwesomeIcons.venus, label: 'FEMALE'),
              ))
            ])),
            Expanded(
                child: ReusableCard(
                    onPress: () {},
                    color: activeCardColor,
                    cardChild: Column(
                      children: [Text('HEIGHT')],
                    ))),
            // Expanded(
            //     child: Row(children: [
            //   Expanded(child: ReusableCard(colour: activeCardColor)),
            //   Expanded(child: ReusableCard(colour: activeCardColor))
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
