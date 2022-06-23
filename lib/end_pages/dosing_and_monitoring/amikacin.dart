import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infection/custom_widgets.dart';
import 'package:infection/constants.dart';
import 'package:infection/end_pages/dosing_and_monitoring/height_weight_converter_widget.dart';
import 'package:infection/end_pages/dosing_and_monitoring/level_template_widget.dart';
import 'package:infection/functions.dart';
import 'package:infection/main_pages/opening_page.dart';



class Amikacin extends StatefulWidget {
  const Amikacin({Key? key}) : super(key: key);

  @override
  _AmikacinState createState() => _AmikacinState();
}

class _AmikacinState extends State<Amikacin> {

  final fieldTextHeight = TextEditingController();
  final fieldTextWeight = TextEditingController();
  final fieldTextAge = TextEditingController();
  final fieldTextCreatinine = TextEditingController();

  int _currentIndexOfBottomBar = 0;
  int? isMale = 0;
  int? isAKI = 0;
  int? akiType = null;

  String inputAge ='';
  String inputWeight = '';
  String inputHeight = '';
  String inputCreatinine = '';
  String finalDose = "mg";
  String finalCreatinineClearance = "min/ml";
  String finalIdealBodyWeight = "kg";


  List <double> levelValues = [0,5.0,7.5,15.0,10000];
  List <String> levelOutput = [
    'Continue on current dosing regimen.\n\nTwice weekly pre-dose levels advised (more frequent if unstable GFR or UO).'
    ,'Delay next dose by 12 hours (a repeat level is not needed). The resume dosing at a 24 hour interval\n\nTake a level pre-dose and wait for level (target <5mg/L) before giving each dose.',
    'Repeat the level in 12 hours. Once level <5mg/L resume dosing at a 48 hour interval.\n\nTake a level pre-dose and wait for level (target <5mg/L) before giving each dose.',
    'Repeat level in 24 hours. Discuss repeated result with antimicrobial pharmacist or consider stopping.\n\nTake a pre-dose and wait for level (target <5mg/L) before giving each dose.'];
  String levelOutputText = '';
  String topLine1Input = '';

  String bottomLine1Input = '';
  String timingOfLevelsOutput = '';

  void clearText()
  {
    fieldTextHeight.clear();
    fieldTextWeight.clear();
    fieldTextAge.clear();
    fieldTextCreatinine.clear();

    setState(() {
      inputWeight = '';
      inputHeight = '';
      inputAge = '';
      inputCreatinine = '';
      finalDose = 'mg';

      finalCreatinineClearance = '';
      finalIdealBodyWeight = '';
      isMale = 0;
      isAKI = 0;
    });


  }


  calculateDose()
  {

    double doseDeterminedWeight;

    if (double.parse(inputWeight) < (Functions().idealBodyWeight(inputHeight,inputWeight,isMale)*1.2))
    {
      doseDeterminedWeight = double.parse(inputWeight);
      print(inputWeight);
      print(doseDeterminedWeight);

      if (doseDeterminedWeight >100)
      {
        doseDeterminedWeight = 100;
      }
      else
      {

      }

    }


    else
    {
      doseDeterminedWeight = Functions().idealBodyWeight(inputHeight,inputWeight,isMale) + 0.4*(double.parse(inputWeight)- Functions().idealBodyWeight(inputHeight,inputWeight,isMale));

      print(inputWeight);
      print(doseDeterminedWeight);

      if (doseDeterminedWeight >100)
      {
        doseDeterminedWeight = 100;
      }
      else
      {

      }

    }

    if(isAKI == 0)
      {
        if (Functions().creatinineClearance(inputCreatinine,Functions().idealBodyWeight(inputHeight,inputWeight,isMale),inputAge,isMale)>=40)
        {
          finalDose = '${(Functions().rounding(50, 15*doseDeterminedWeight))} mg once daily';
        }

        else if (Functions().creatinineClearance(inputCreatinine,Functions().idealBodyWeight(inputHeight,inputWeight,isMale),inputAge,isMale)<40 && Functions().creatinineClearance(inputCreatinine,Functions().idealBodyWeight(inputHeight,inputWeight,isMale),inputAge,isMale)>=20)

        {
          finalDose = '${(Functions().rounding(50, 7.5*doseDeterminedWeight))} mg once daily';
        }
        else if (Functions().creatinineClearance(inputCreatinine,Functions().idealBodyWeight(inputHeight,inputWeight,isMale),inputAge,isMale)<20)
        {



          finalDose = '${(Functions().rounding(50, 7.5*doseDeterminedWeight))} mg STAT once only';
        }
      }
    else
      {
        if(akiType == 0)
          {
            finalDose = '${(Functions().rounding(50, 15*doseDeterminedWeight))} mg STAT once only';
          }
        else if(akiType == 1)
          {
            finalDose = '${(Functions().rounding(50, 15*doseDeterminedWeight))} mg STAT once only';
          }
        else if(akiType == 2)
          {
            finalDose = 'Discuss with microbiology';
          }
        else
          {
            print('There has been an error');
          }
      }



    finalCreatinineClearance = (Functions().creatinineClearance(inputCreatinine,Functions().idealBodyWeight(inputHeight,inputWeight,isMale),inputAge,isMale)).toStringAsFixed(2);


    finalIdealBodyWeight = (Functions().idealBodyWeight(inputHeight, inputWeight, isMale)*100/100.0).toStringAsFixed(1);


    notifyParent();

  }



  notifyParent()
  {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              elevation: 0.0,
              toolbarHeight: 45.0,
              backgroundColor: Colors.white,
              leading:
              IconButton(
                icon: const Icon(CupertinoIcons.chevron_left,
                  size: 22.0,
                  color: Colors.black,),
                onPressed: ()
                {
                  Navigator.pop(context);
                },
              ),

            ),

            body:

            IndexedStack(
              children: [
                AmiOrGentCalculateScreen(
                    fieldTextHeight: fieldTextHeight,
                    fieldTextWeight: fieldTextWeight,
                    fieldTextAge: fieldTextAge,
                    fieldTextCreatinine: fieldTextCreatinine,
                    isMale: isMale,
                    isAKI: isAKI,
                    akiType: akiType,

                    inputAge: inputAge,
                    inputCreatinine: inputCreatinine,
                    inputHeight: inputHeight,
                    inputWeight: inputWeight,

                    resetPressed: clearText,

                    onValueChangedAKIType: (index)
                    {
                      FocusScope.of(context).unfocus();
                      setState(() {
                        isAKI == 1?akiType = index:akiType = null;
                      });
                    },

                    onValueChangedAKI: (index)
                      {
                        FocusScope.of(context).unfocus();
                        setState(() {
                          isAKI= index;
                          isAKI == 1?akiType = 0:akiType = null;
                        });
                      },

                    onValueChangedSex: (index)
                      {
                        FocusScope.of(context).unfocus();
                        setState(() {
                          isMale = index;
                        });

                      },
                    onSubmittedHeight: (input)
                    {
                      inputHeight = input;
                      notifyParent();
                    },

                    dosePressed: (){
                      try
                      {
                        setState(() {
                          calculateDose();
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
                                child: const Text('Please complete the text fields with appropriate numerical values',
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
                                      clearText();
                                    }
                                ),
                              ]
                          ),
                        );
                      }
                    },

                    onSubmittedWeight: (input)
                    {
                      inputWeight = input;
                      notifyParent();
                    },

                    onSubmittedAge: (input)
                    {
                      inputAge = input;
                      notifyParent();
                    },

                    onSubmittedCreatinine: (input)
                    {
                      inputCreatinine = input;
                      notifyParent();
                    },



                    title: 'Amikacin Dosing',
                    idealBodyWeightOutput: finalIdealBodyWeight,
                    creatinineClearanceOutput: finalCreatinineClearance,
                    doseOutput: finalDose,

                ),



                LevelInterpretationWidget(
                  pageTitle: "Amikacin Levels",
                  topRedBox: LevelsRedTextBox(
                      topBoldText: "When to take a level",
                      bottomMainText: "Pre-dose levels (within an hour of administration) should be taken before the second dose"),

                  topBox: Expanded(
                    child: LevelPageBuildingBlock(
                        topBarTitle: 'Timing and range of levels',
                        line1:InterpretationTextFieldAndButton(
                            onChanged: (input)
                            {
                              setState(() {
                                topLine1Input = input;
                              });
                            },
                            onPressed: ()
                            {
                              setState(() {
                                if(double.parse(topLine1Input) <60)
                                {
                                  timingOfLevelsOutput = 'The result MUST be received and be less than 5mg/L before the next dose is given.\n\nPre-dose levels and renal function should be checked daily.';
                                }
                                else
                                  {
                                    timingOfLevelsOutput = 'Levels should be less than 5mg/L before subsequent doses are given.\n\nIf age <65 years, second dose can be given without waiting for the result. The result MUS be checked prior to the third dose';
                                  }
                              });


                            },
                            text: 'What is the creatinine clearance?'),
                        line2: Container(
                          margin: EdgeInsets.only(top: 8),
                          child: Text(timingOfLevelsOutput,
                            style: const TextStyle(fontSize: 13),
                          ),
                        ),

                    ),
                  ),

                  bottomBox: Expanded(
                    child: LevelPageBuildingBlock(topBarTitle: 'Interpretation and dose adjustment',
                    line1:  InterpretationTextFieldAndButton(
                        onChanged: (input)
                        {
                          setState(() {
                            bottomLine1Input = input;
                          });
                        },
                        onPressed: ()
                        {
                          for (int i = 0;i< levelOutput.length;i++)
                          {
                            if(double.parse(bottomLine1Input)>=levelValues[i]&&double.parse(bottomLine1Input)<levelValues[i+1])
                            {
                              setState(() {
                                levelOutputText = levelOutput[i];
                              });

                              break;
                            }

                          }
                        },
                        text: 'What is the amikacin level?'),
                    line2: Container(
                      margin: EdgeInsets.only(top: 8),
                      child: Text(levelOutputText,
                        style: const TextStyle(fontSize: 13),),
                    ),


                    ),
                  ),







                ),


                HeightAndWeightConverter()

              ],
              index: _currentIndexOfBottomBar,

            ),

            bottomNavigationBar: SizedBox(
              height: 55,
              child: BottomNavigationBar(

                  currentIndex: _currentIndexOfBottomBar,
                  backgroundColor: Colors.white,
                  selectedItemColor: kDosingSelectedBlue,
                  unselectedItemColor: kContactsPageGrey,
                  items: const <BottomNavigationBarItem>
                  [
                    BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.function),
                    label: 'Calculate',
                   ),
                    BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.speedometer),
                      label: 'Level',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.compass),
                      label: 'Height/Weight',
                    ),

              ],

                onTap: (index)
                {
                  setState(() {
                    _currentIndexOfBottomBar = index;

                  });
                },

              ),
            ),
          ),
      ),
    );
  }
}
