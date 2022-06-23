import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';

class HeightAndWeightConverter extends StatefulWidget {
  const HeightAndWeightConverter({Key? key}) : super(key: key);

  @override
  _HeightAndWeightConverterState createState() => _HeightAndWeightConverterState();
}

class _HeightAndWeightConverterState extends State<HeightAndWeightConverter> {
  @override

  int? heightOrWeight = 0;
  int? heightUnitsTop = 0;
  int? weightUnitsTop = 0;
  int? heightUnitsBottom = 0;
  int? weightUnitsBottom = 0;
  String inputValue = '';
  String inputFt = '';
  String inputIn = '';
  String inputSt = '';
  String inputLb = '';
  String outputValue = '';
  final fieldTextTopField = TextEditingController();
  final fieldTextft = TextEditingController();
  final fieldTextin = TextEditingController();
  final fieldTextSt = TextEditingController();
  final fieldTextLb = TextEditingController();

  void resetText()
  {
      fieldTextTopField.clear();
      fieldTextin.clear();
      fieldTextft.clear();
      fieldTextSt.clear();
      fieldTextLb.clear();
      outputValue = '';
      // heightUnitsTop = 0;
      // heightUnitsBottom = 0;
      // weightUnitsTop = 0;
      // weightUnitsBottom = 0;
      // heightOrWeight = 0;

      notifyParent();

  }

  void calculate()
  {

      if(heightOrWeight == 0)
      {
        if (heightUnitsTop == 0)
        {
          if (heightUnitsBottom == 0)
          {
            outputValue = '${double.parse(inputValue).toStringAsFixed(0)} cm';
          }
          else if (heightUnitsBottom == 1)
          {
            outputValue = '${(double.parse(inputValue)*0.01).toStringAsFixed(2)} m';
          }
          else if (heightUnitsBottom ==  2) {
            double totalInches;
            String outputInches;
            String outputFoot;
            totalInches = double.parse(inputValue) / 2.54;
            outputFoot = ((totalInches - totalInches.remainder(12.0))/12).toStringAsFixed(0);
            outputInches = (totalInches - double.parse(outputFoot)*12).toStringAsFixed(0);

            outputValue = '$outputFoot ft $outputInches in';
          }

        }

        else if (heightUnitsTop == 1)
        {
          if (heightUnitsBottom == 0)
          {
            outputValue = '${(double.parse(inputValue)*100).toStringAsFixed(0)} cm';
          }
          else if (heightUnitsBottom == 1)
          {
            outputValue = '${double.parse(inputValue).toStringAsFixed(2)} m';

          }
          else if (heightUnitsBottom ==  2) {
            double totalInches;
            String outputInches;
            String outputFoot;
            totalInches = double.parse(inputValue)*100 / 2.54;
            outputFoot = ((totalInches - totalInches.remainder(12.0))/12).toStringAsFixed(0);
            outputInches = (totalInches - double.parse(outputFoot)*12).toStringAsFixed(0);

            outputValue = '$outputFoot ft $outputInches in';
          }
        }

        else if (heightUnitsTop == 2)
        {
          if (heightUnitsBottom == 0)
          {
            double totalCm;
            totalCm = ((double.parse(inputFt)*12) + double.parse(inputIn))*2.54;
            outputValue = '${(totalCm).toStringAsFixed(0)} cm';
          }
          else if (heightUnitsBottom == 1)
          {
            double totalCm;
            totalCm = ((double.parse(inputFt)*12) + double.parse(inputIn))*2.54;
            outputValue = '${(totalCm/100).toStringAsFixed(2)} m';

          }
          else if (heightUnitsBottom ==  2) {

            outputValue = '${double.parse(inputFt).toStringAsFixed(0)} ft ${double.parse(inputIn).toStringAsFixed(0)} in';
          }

        }



      }

      else if (heightOrWeight == 1)
      {
        if(weightUnitsTop == 0)
        {
          if(weightUnitsBottom == 0)
          {
            outputValue = '${double.parse(inputValue).toStringAsFixed(0)} lb';
          }
          else if(weightUnitsBottom == 1)
          {
            double totalStone;
            double extraLb;

            totalStone = (double.parse(inputValue) - double.parse(inputValue).remainder(14))/14;
            extraLb = double.parse(inputValue).remainder(14);

            outputValue = '${totalStone.toStringAsFixed(0)} st ${extraLb.toStringAsFixed(0)} lb';
          }
          else if(weightUnitsBottom == 2)
          {
            outputValue = '${(double.parse(inputValue)*0.4535).toStringAsFixed(1)} kg';
          }
        }
        else if (weightUnitsTop == 1)
        {
          if(weightUnitsBottom == 0)
          {
            outputValue = '${((double.parse(inputSt)*14)+(double.parse(inputLb))).toStringAsFixed(0)} lb';
          }
          else if(weightUnitsBottom == 1)
          {

            outputValue = '${double.parse(inputSt).toStringAsFixed(0)} st ${double.parse(inputLb).toStringAsFixed(0)} lb';
          }
          else if(weightUnitsBottom == 2)
          {
            outputValue = '${(((double.parse(inputSt)*14)+(double.parse(inputLb)))*0.4535).toStringAsFixed(1)} kg';
          }
        }

        else if (weightUnitsTop == 2)
        {
          if(weightUnitsBottom == 0)
          {
            outputValue = '${(double.parse(inputValue)*2.205).toStringAsFixed(0)} lb';
          }
          else if(weightUnitsBottom == 1)
          {
            double totalPounds = double.parse(inputValue)*2.205;
            double totalStone;
            double extraPounds;

            totalStone = (totalPounds - totalPounds.remainder(14))/14;
            extraPounds = totalPounds.remainder(14);

            outputValue = '${totalStone.toStringAsFixed(0)} st ${extraPounds.toStringAsFixed(0)} lb';

          }
          else if(weightUnitsBottom == 2)
          {
            outputValue = '${double.parse(inputValue).toStringAsFixed(1)} kg';
          }
        }

      }

  }

  notifyParent()
  {
    setState(() {

    });
  }

  Widget build(BuildContext context) {
    return
      Scaffold(
        body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:20.0,vertical: 10.0,),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children:[
                      Container(
                        width: double.infinity,
                        height: 40,
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 8),
                        margin: const EdgeInsets.only(bottom: 8),
                        color: kDosingGreen,
                        child: const Text('Height/Weight Conversion',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 15.5,
                          ),),
                      ),
                      Container(
                        width: double.infinity,
                        height: 30,
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 8),
                        margin: const EdgeInsets.only(bottom: 8),
                        color: kDosingLightOrange,
                        child: const Text('Conversion',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),),
                      ),
                    ],
                  ),

                  const SizedBox(height: 50,),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextDoubleSwitch(
                        title: '1. Select measurement',
                        indexPosition: heightOrWeight,
                        minWidth: 50,
                        onValueChanged: (index)
                        {
                          setState(() {
                            heightOrWeight = index;
                            FocusScope.of(context).unfocus();
                          });
                        },
                        firstText: 'Height',
                        secondText: 'Weight',
                        switchColour: kVeryLightPinkToggleHighlight,
                      ),
                      Container(
                          margin: const EdgeInsets.only(bottom:5),
                          height: 120,
                          width: double.infinity,
                          color: kDosingGreen,
                          child:
                          LayoutBuilder(
                            builder: (context,constraints)=>
                            Container(
                              padding: EdgeInsets.only(left: 12, right: 12),
                              color: Colors.white,
                              margin: const EdgeInsets.all(2),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children:
                                [
                                  heightOrWeight == 0 && heightUnitsTop == 2?
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(left:2),
                                        width: 60,
                                        height: 30,
                                        child: TextField(
                                          controller: fieldTextft,
                                          keyboardType: TextInputType.number,
                                          onChanged: (input)
                                          {
                                            setState(() {
                                              inputFt = input;
                                            });
                                          },
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                          textAlign: TextAlign.center,
                                          textAlignVertical: TextAlignVertical.center,
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(color: Colors.grey),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: Colors.grey),
                                            ),

                                          ),
                                          maxLines: 1,
                                        ),
                                      ),

                                      const Padding(
                                        padding: EdgeInsets.only(left:8.0,right: 8.0,),
                                        child: Text('ft'),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(left:2),
                                        width: 60,
                                        height: 30,
                                        child: TextField(
                                          controller: fieldTextin,
                                          keyboardType: TextInputType.number,
                                          onChanged: (input)
                                          {
                                            setState(() {
                                              inputIn = input;
                                            });
                                          },
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                          textAlign: TextAlign.center,
                                          textAlignVertical: TextAlignVertical.center,
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(color: Colors.grey),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: Colors.grey),
                                            ),

                                          ),
                                          maxLines: 1,
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(left:8.0,right: 8.0,),
                                        child: Text('in'),
                                      ),


                                    ],
                                  ):heightOrWeight == 1 && weightUnitsTop == 1?
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(left:2),
                                        width: 60,
                                        height: 30,
                                        child: TextField(
                                          controller: fieldTextSt,
                                          keyboardType: TextInputType.number,
                                          onChanged: (input)
                                          {
                                            setState(() {
                                              inputSt = input;
                                            });
                                          },
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                          textAlign: TextAlign.center,
                                          textAlignVertical: TextAlignVertical.center,
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(color: Colors.grey),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: Colors.grey),
                                            ),

                                          ),
                                          maxLines: 1,
                                        ),
                                      ),

                                      const Padding(
                                        padding: EdgeInsets.only(left:8.0,right: 8.0,),
                                        child: Text('st'),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(left:2),
                                        width: 60,
                                        height: 30,
                                        child: TextField(
                                          controller: fieldTextLb,
                                          keyboardType: TextInputType.number,
                                          onChanged: (input)
                                          {
                                            setState(() {
                                              inputLb = input;
                                            });
                                          },
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                          textAlign: TextAlign.center,
                                          textAlignVertical: TextAlignVertical.center,
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(color: Colors.grey),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: Colors.grey),
                                            ),

                                          ),
                                          maxLines: 1,
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(left:8.0,right: 8.0,),
                                        child: Text('lb'),
                                      ),


                                    ],
                                  ):
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      margin: const EdgeInsets.only(left:2),
                                      width: 90,
                                      height: 30,
                                      child: TextField(
                                        controller: fieldTextTopField,
                                        keyboardType: TextInputType.number,
                                        onChanged: (input)
                                        {
                                          setState(() {
                                            inputValue = input;
                                          });
                                        },
                                        style: const TextStyle(
                                          fontSize: 14,
                                        ),
                                        textAlign: TextAlign.center,
                                        textAlignVertical: TextAlignVertical.center,
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.grey),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.grey),
                                          ),

                                        ),
                                        maxLines: 1,
                                      ),
                                    ),
                                  )

                                  ,

                                  heightOrWeight == 0? TripleSwitchFullWidth(
                                      firstText: 'cm',
                                      secondText: 'm',
                                      thirdText: 'ft in',
                                      switchColour: Colors.white,
                                      indexPosition: heightUnitsTop,
                                      onValueChanged: (index)
                                      {
                                        setState(() {
                                          FocusScope.of(context).unfocus();
                                          heightUnitsTop = index;
                                        });

                                      }):TripleSwitchFullWidth(
                                      firstText: 'lbs',
                                      secondText: 'st',
                                      thirdText: 'kg',
                                      switchColour: kVeryLightPinkToggleHighlight,
                                      indexPosition: weightUnitsTop,
                                      onValueChanged: (index)
                                      {
                                        setState(() {
                                          FocusScope.of(context).unfocus();
                                          weightUnitsTop = index;
                                        });

                                      }),
                                ]

                              ),
                            ),
                          ),
                      ),
                      Container(
                          margin: const EdgeInsets.only(bottom:5),
                          height: 130,
                          width: double.infinity,
                          color: kDosingGreen,
                          child:
                          LayoutBuilder(
                            builder: (context,constraints)=>
                                Container(
                                  padding: EdgeInsets.only(left: 12, right: 12),
                                  color: Colors.white,
                                  margin: const EdgeInsets.all(2),
                                  child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children:
                                      [

                                        heightOrWeight == 0? TripleSwitchFullWidth(
                                            firstText: 'cm',
                                            secondText: 'm',
                                            thirdText: 'ft in',
                                            minSpacerHeight: 0,
                                            switchColour: Colors.white,
                                            indexPosition: heightUnitsBottom,
                                            onValueChanged: (index)
                                            {
                                              setState(() {
                                                FocusScope.of(context).unfocus();
                                                heightUnitsBottom = index;
                                              });

                                            }):TripleSwitchFullWidth(

                                            firstText: 'lbs',
                                            secondText: 'st',
                                            thirdText: 'kg',
                                            minSpacerHeight: 0,
                                            switchColour: kVeryLightPinkToggleHighlight,
                                            indexPosition: weightUnitsBottom,
                                            onValueChanged: (index)
                                            {
                                              setState(() {
                                                FocusScope.of(context).unfocus();
                                                weightUnitsBottom = index;
                                              });

                                            }),

                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(4),
                                              color: Colors.grey[600],
                                            ),

                                            margin: const EdgeInsets.only(left:2),
                                            width: 90,
                                            height: 30,


                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(4),
                                                color: Colors.white,
                                              ),
                                              margin: EdgeInsets.all(0.75),
                                              child:
                                                Align(
                                                  alignment: Alignment.center,
                                                  child: Text(outputValue,
                                                  ),
                                                ),
                                            ),

                                          ),
                                        ),

                                      ]

                                  ),
                                ),
                          ),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          MaterialButton(
                            height: 30,
                            splashColor: Colors.grey,
                            highlightColor: Colors.white,
                            child: const Text('Reset',
                                style: TextStyle(
                                  color: kIconLightGrey,
                                  fontWeight: FontWeight.w400,

                                )),
                            onPressed: (){
                              resetText();
                            },),
                          MaterialButton(
                            height: 30,
                            color: kVeryLightPinkToggleHighlight,
                            splashColor: kIconLightGrey,
                            highlightColor: kHighlightedToggleRed,
                            elevation: 0,
                            highlightElevation: 0,
                            child: const Text("Convert",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),),
                            onPressed: (){
                              try
                              {
                                setState(() {
                                  calculate();
                                });
                              }
                              catch(e)
                              {
                                showDialog<String>(
                                  useSafeArea: true,
                                  barrierDismissible: false,
                                  context: context,
                                  builder:(BuildContext context) => AlertDialog(
                                    titlePadding: EdgeInsets.only(top:20, left: 10, right: 10,),
                                      title: Container(
                                        margin: const EdgeInsets.fromLTRB(10,0,10,15),
                                        child: const Text('Please complete the text field with appropriate numerical values',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 14.0,
                                            ),

                                        ),
                                      ),
                                      actions: [

                                        TextButton(
                                            child: const Text('Dismiss',
                                              style: TextStyle(
                                                fontSize: 14.0,
                                              ),),
                                            onPressed: (){
                                              Navigator.of(context).pop();
                                              resetText();
                                            }
                                        ),
                                      ]
                                  ),
                                );
                              }
                            },
                          ),
                        ],
                      ),

                    ],
                  ),

                ],
              ),

          ),
        ),
    ),
      );
  }
}

