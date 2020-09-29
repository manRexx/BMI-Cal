import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_container.dart';
import 'reusable_card.dart';
import 'constants.dart';

enum Gender{
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender;
  int height=180;
  int weight=60;
  int age=15;


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
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      onPress: (){
                        setState(() {
                          selectedGender=Gender.male;
                        });
                      },
                      colour:selectedGender==Gender.male?kActiveCardColor:kInactiveCardColor,
                      cardChild: IconContent(icon: FontAwesomeIcons.mars,label: 'MALE',),
                    ),
                  ),
                  Expanded(
                      child:ReusableCard(
                        onPress: (){
                          setState(() {
                            selectedGender=Gender.female;
                          });
                        },
                        colour: selectedGender==Gender.female?kActiveCardColor:kInactiveCardColor,
                        cardChild: IconContent(icon: FontAwesomeIcons.venus,label: 'FEMALE',),
                      )
                  ),
                ],
              ),
            ),
            Expanded(
                child: ReusableCard(
                    colour:kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('HEIGHT',style: kLabelTextStyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            height.toString(),
                            style:kNumberTextStyle,
                          ),
                          SizedBox(
                            width: 4.0,
                          ),
                          Text(
                            'cm',
                            style: kLabelTextStyle,
                          ),
                        ],
                      ),
                      SliderTheme(
                        data: SliderThemeData(
                           thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),

                        ),
                        child: Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 220.0,
                          activeColor: kBottomContainerColor,
                          inactiveColor: kInactiveCardColor,
                          onChanged: (double newValue){
                            setState(() {
                              height=newValue.round();
                            });
                          },
                        ),
                      )
                    ],
                  ),
                )
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: ReusableCard(
                          colour: kActiveCardColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'WEIGHT',
                              style: kLabelTextStyle,
                            ),
                            Text(
                              weight.toString(),
                              style: kNumberTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  child: Icon(FontAwesomeIcons.minus,color: Colors.white,),
                                  backgroundColor: Color(0xFF4C4F5E),
                                  elevation: 6.0,
                                  onPressed: (){
                                    setState(() {
                                      weight-=1;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 20.0,
                                ),
                                FloatingActionButton(
                                  child: Icon(FontAwesomeIcons.plus,color: Colors.white,),
                                  backgroundColor: Color(0xFF4C4F5E),
                                  elevation: 6.0,
                                  onPressed: (){
                                    setState(() {
                                      weight+=1;
                                    });
                                  },
                                ),
                              ],

                            )
                          ],
                        ),
                      )
                  ),
                  Expanded(
                      child: ReusableCard(colour: kActiveCardColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'AGE',
                              style: kLabelTextStyle,
                            ),
                            Text(
                              age.toString(),
                              style: kNumberTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  child: Icon(FontAwesomeIcons.minus,color: Colors.white,),
                                  backgroundColor: Color(0xFF4C4F5E),
                                  elevation: 6.0,
                                  onPressed: (){
                                    setState(() {
                                      age-=1;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 20.0,
                                ),
                                FloatingActionButton(
                                  child: Icon(FontAwesomeIcons.plus,color: Colors.white,),
                                  backgroundColor: Color(0xFF4C4F5E),
                                  elevation: 6.0,
                                  onPressed: (){
                                    setState(() {
                                      age+=1;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                  ),
                ],
              ),
            ),
            Container(
              color: kBottomContainerColor,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: kBottomContainerHeight,
            )
          ],
        )
    );
  }
}



