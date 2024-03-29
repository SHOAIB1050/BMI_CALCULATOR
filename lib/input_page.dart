import 'package:bmi_app/calculation.dart';
import 'package:flutter/material.dart';
import 'Repeate_contanier.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'RepeateTextIcon.dart';
import 'constent_variable.dart';
import 'Resultfile.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectGender;
  int slider_height = 100;
  int slider_weight = 20;
  int sliderage = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  /* child: GestureDetector(
                    onTap: () {
                      setState(() {
                        //update_color(Gender.male);
                        selectGender = Gender.male;
                      });
                    },*/
                  child: Repeate_contanier(
                    onpressed: () {
                      setState(
                        () {
                          selectGender = Gender.male;
                        },
                      );
                    },
                    colors: selectGender == Gender.male
                        ? activationcolor
                        : deactivationcolor,
                    cardWidge: RepeateTextIcon(
                      iconData: FontAwesomeIcons.male,
                      Label: 'MALE',
                    ),
                  ),
                  //),
                ),
                Expanded(
                  /*child: GestureDetector(
                    onTap: () {
                      setState(() {
                        //update_color(Gender.female);
                        selectGender = Gender.female;
                      });
                    },*/

                  child: Repeate_contanier(
                    onpressed: () {
                      setState(
                        () {
                          selectGender = Gender.female;
                        },
                      );
                    },
                    colors: selectGender == Gender.female
                        ? activationcolor
                        : deactivationcolor,
                    cardWidge: RepeateTextIcon(
                      iconData: FontAwesomeIcons.female,
                      Label: 'FEMALE',
                    ),
                  ),
                  //),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Repeate_contanier(
                    colors: Color(0xFF1D1E33),
                    cardWidge: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('HEIGHT', style: ConstentTextLabel),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '$slider_height',
                              style: ConstentTextLabe2,
                            ),
                            Text(
                              'cm',
                              style: ConstentTextLabel,
                            ),
                          ],
                        ),
                        Slider(
                          value: slider_height.toDouble(),
                          min: 100.0,
                          max: 220.0,
                          activeColor: Colors.redAccent,
                          inactiveColor: Colors.white,
                          onChanged: (double newvalue) {
                            setState(() {
                              slider_height = newvalue.round();
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Repeate_contanier(
                    cardWidge: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEGHT',
                          style: ConstentTextLabel,
                        ),
                        Text('$slider_weight', style: ConstentTextLabe2),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIcon(
                              icondata: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  slider_weight--;
                                });
                              },
                            ),
                            SizedBox(width: 5),
                            RoundIcon(
                              icondata: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  slider_weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    colors: Color(0xFF1D1E33),
                  ),
                ),
                Expanded(
                  child: Repeate_contanier(
                      cardWidge: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('AGE', style: ConstentTextLabel),
                          Text('$sliderage', style: ConstentTextLabe2),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIcon(
                                icondata: FontAwesomeIcons.minus,
                                onPress: () {
                                  setState(() {
                                    sliderage--;
                                  });
                                },
                              ),
                              SizedBox(width: 5),
                              RoundIcon(
                                icondata: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(() {
                                    sliderage++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                      colors: Color(0xFF1D1E33)),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Calculation cal =
                  Calculation(heigh: slider_height, weight: slider_weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Resultfind(
                    bmiresult: cal.Calculations(),
                    final_result: cal.get_result(),
                    suggestion: cal.get_suggestion(),
                  ),
                ),
              );
            },
            child: Container(
              child: Center(
                child: Text('Calculate', style: ConstentTextLabe3),
              ),
              color: Colors.deepOrange,
              height: 60,
              width: double.infinity,
              margin: EdgeInsets.only(top: 10),
            ),
          ),
        ],
      ),
    );
  }
}

class RoundIcon extends StatelessWidget {
  RoundIcon({@required this.icondata, this.onPress});
  final IconData icondata;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        icondata,
        color: Colors.black,
      ),
      onPressed: onPress,
      elevation: 6,
      constraints: BoxConstraints.tightFor(height: 45.0, width: 45.0),
      shape: CircleBorder(),
      fillColor: Colors.white,
    );
  }
}
