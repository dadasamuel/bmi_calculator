import 'package:bmi_calculator/all_class.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
  int heigth = 180;
  int weight = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('HEIGHT', style: labelTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(heigth.toString(), style: NumberTextStyle),
                            Text('cm', style: labelTextStyle)
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            inactiveTrackColor: Color(0xFF8D8E98),
                            activeTrackColor: Colors.white,
                            thumbColor: Color(0xFFEB1555),
                            overlayColor: Color(0x29EB1555),
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 30.0),
                          ),
                          child: Slider(
                              value: heigth.toDouble(),
                              min: 100.0,
                              max: 250.0,
                              onChanged: (double newValue) {
                                setState(() {
                                  heigth = newValue.round();
                                });
                              }),
                        )
                      ],
                    ))),
            Expanded(
                child: Row(children: [
              Expanded(
                  child: ReusableCard(
                onPress: () {},
                color: activeCardColor,
                cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('WEIGHT', style: labelTextStyle),
                      Text(weight.toString(), style: NumberTextStyle),
                    ]),
              )),
              Expanded(
                  child: ReusableCard(
                color: activeCardColor,
                onPress: () {},
                cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('WEIGHT', style: labelTextStyle),
                      Text(weight.toString(), style: NumberTextStyle),
                    ]),
              ))
            ])),
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
