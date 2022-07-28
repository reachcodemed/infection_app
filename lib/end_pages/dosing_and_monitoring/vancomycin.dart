import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infection/custom_widgets.dart';
import 'package:infection/constants.dart';
import 'package:infection/end_pages/dosing_and_monitoring/height_weight_converter_widget.dart';
import 'package:infection/end_pages/dosing_and_monitoring/level_template_widget.dart';
import 'package:infection/functions.dart';


//TODO: Complete the vancomycin page level adjustment!



class Vancomycin extends StatefulWidget {
  const Vancomycin({Key? key}) : super(key: key);

  @override
  _VancomycinState createState() => _VancomycinState();
}

class _VancomycinState extends State<Vancomycin> {

  final fieldTextHeight = TextEditingController();
  final fieldTextWeight = TextEditingController();
  final fieldTextAge = TextEditingController();
  final fieldTextCreatinine = TextEditingController();
  final textControllerInterpretation = TextEditingController();

  int _currentIndexOfBottomBar = 0;
  int? isMale = 0;

  int? targetLevel = 0;
  int? currentDose = 0;
  int? currentFrequency = 2;

  String preDoseLevelString = '';
  double preDoseLevelDouble = 0;

  String inputAge ='';
  String inputWeight = '';
  String inputHeight = '';
  String inputCreatinine = '';
  String finalLoadingDose = "mg";
  String finalMaintenanceDose = "mg";
  String finalCreatinineClearance = "";
  String finalIdealBodyWeight = "";
  String finalBottomDosingExtraInformationOutput = "";
  String finalBottomInterpretationExtraInformationOutput = "";


  List<double> creatinineValues = [0,20,29,39,54,74,89,109,10000];
  List<List<int>> maintenanceOutputDoses = [
    [1000,0],
    [500,1],
    [750,1],
    [500,2],
    [750,2],
    [1000,2],
    [1250,2],
    [1500,2],
    [1500,2],
  ];


  List<double> weightValues = [0,40,59,90,1000];
  List<String> loadingOutputDoses = ['750 mg','1000 mg','1500 mg','2000 mg'];

  List<String> dosingOutputExtraInformation = [
    "Re-dose when levels in range. Check every 24 hours and discuss with pharmacy prior to re-dosing",
    "Dosing interval is OD (every 24 hours). Measure a pre-dose (trough) level immediately before the SECOND maintenance dose\n\nNote: DO NOT omit a dose whilst awaiting a serum vancomycin result, unless the patient has severe renal impairment (CrCl <20ml/min) or poor urine output (<0.5ml/kg/hr for >= 6 hours).",
    "Dosing interval is BD (every 12 hours). Measure a pre-dose (trough) level immediately before the THIRD or FOURTH maintenance dose; whichever falls before the morning dose\n\nNote: DO NOT omit a dose whilst awaiting a serum vancomycin result, unless the patient has severe renal impairment (CrCl <20ml/min) or poor urine output (<0.5ml/kg/hr for >= 6 hours).",
  ];

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
      finalLoadingDose = 'mg';
      finalMaintenanceDose = 'mg';
      finalCreatinineClearance = '';
      finalIdealBodyWeight = '';
      isMale = 0;
    });


  }


  calculateDose()
  {

    double doseDeterminedWeight;

      if (double.parse(inputWeight) <
          (Functions().idealBodyWeight(inputHeight, inputWeight, isMale) *
              1.2)) {
        doseDeterminedWeight = double.parse(inputWeight);
      }
      else {
        doseDeterminedWeight =
            Functions().idealBodyWeight(inputHeight, inputWeight, isMale);
      }

    for(int i = 0; i<creatinineValues.length;i++) {
      if (Functions().creatinineClearance(inputCreatinine,doseDeterminedWeight, inputAge, isMale) >= creatinineValues[i] &&
          Functions().creatinineClearance(inputCreatinine, doseDeterminedWeight, inputAge, isMale) < creatinineValues[i + 1])
      {
        print("I made it here");
        finalMaintenanceDose = "${maintenanceOutputDoses[i][0].toStringAsFixed(0)} mg";

        finalBottomDosingExtraInformationOutput = dosingOutputExtraInformation[maintenanceOutputDoses[i][1]];
        //
        // if (maintenanceOutputDoses[i][1] == 0)
        //   {
        //     finalBottomDosingExtraInformationOutput = dosingOutputExtraInformation[0];
        //   }
        // else if (maintenanceOutputDoses[i][1]==1)
        //   {
        //     finalBottomDosingExtraInformationOutput = dosingOutputExtraInformation[1];
        //   }
        // else if(maintenanceOutputDoses[i][1]==2)
        //   {
        //     finalBottomDosingExtraInformationOutput = dosingOutputExtraInformation[2];
        //   }
        // else
        //   {
        //     finalBottomDosingExtraInformationOutput = "";
        //   }

        break;
      }
    }

    for(int j = 0;j<loadingOutputDoses.length;j++)
    {


      if(double.parse(inputWeight)>=weightValues[j]&&double.parse(inputWeight)<weightValues[j+1])
      {
        finalLoadingDose = loadingOutputDoses[j];
        break;
      }
    }



    finalCreatinineClearance = (Functions().creatinineClearance(inputCreatinine,Functions().idealBodyWeight(inputHeight,inputWeight,isMale),inputAge,isMale)).toStringAsFixed(2);


    finalIdealBodyWeight = (Functions().idealBodyWeight(inputHeight, inputWeight, isMale)*100/100.0).toStringAsFixed(1);


    notifyParent();

  }

  levelInterpretationChecker({required int numberOfLevelsToMoveUpOrDown, required String extraStringText})
  {
    List<List<int>> matchedPairsDoses = [
      [0,500],
      [1, 750],
      [2, 1000],
      [3, 1250],
      [4, 1500],
    ];

    List<List<int>> matchedPairsFreq = [
      [0,4],
      [1,1],
      [2,2],
    ];


    for (int i = 0; i < maintenanceOutputDoses.length; i ++)
    {
      if(matchedPairsFreq[currentFrequency!][1] == maintenanceOutputDoses[i][1] && matchedPairsDoses[currentDose!][1] == maintenanceOutputDoses[i][0])
      {

        print(i);
        i = i + numberOfLevelsToMoveUpOrDown;

        if (i >= maintenanceOutputDoses.length-1)
        {
          finalBottomInterpretationExtraInformationOutput = "The patient is already at the maximum dose. Check doses were correctly administered and discuss with antimicrobial pharmacist/microbiology. The patient may need reloading.";
        }

        else if(i == 0)
          {
            finalBottomInterpretationExtraInformationOutput = "The patient is beyond minimum dosing and requires discussion with antimicrobial pharmacy/microbiology";
          }
        else
        {
          finalBottomInterpretationExtraInformationOutput = "$extraStringText ${maintenanceOutputDoses[i][0].toStringAsFixed(0)} mg\n\n${dosingOutputExtraInformation[maintenanceOutputDoses[i][1]]}\n";
        }
        break;
      }
      else
      {

        finalBottomInterpretationExtraInformationOutput = "This is not a standard dosing regimen, please discuss with antimicrobial pharmacist/microbiology before changing doses";
      }
    }


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
              DosingEndPage(
            pageTitle: 'Vancomycin Dosing',
            antibioticTextOutput1: "Loading Dose\n\nMaintenance Dose\n\nCreatinine Clearance\n\nIdeal Body Weight",
            antibioticTextOutput2: '= $finalLoadingDose\n\n= $finalMaintenanceDose\n\n= $finalCreatinineClearance ml/min\n\n= $finalIdealBodyWeight kg',
            topPanelColour: kDosingGreen,
            additionalBottomTextBox: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(top:20,left:8),
                child: Text(finalBottomDosingExtraInformationOutput,
                  textAlign: TextAlign.start,
                ),
              ),
            ),

                  toggleBox1: WeightOrHeightEntryPaeds(
                      fieldText: fieldTextHeight,
                      title: "1. Height"  ,
                      units: "cm",
                      onChanged: (input)
                  {
                    setState(() {
                      inputHeight = input;
                    });
                  }),
                  toggleBox2: WeightOrHeightEntryPaeds(
                    fieldText: fieldTextWeight,
                    title: "2. Weight",
                    units: "kg",
                    onChanged: (input)
                    {
                      setState(() {
                        inputWeight = input;
                      });

                    },),
                  toggleBox3: WeightOrHeightEntryPaeds(
                    fieldText: fieldTextAge,
                    title: "3. Age",
                    units: "",
                    onChanged: (input)
                    {
                      setState(() {
                        inputAge = input;
                      });

                    },),
                  toggleBox4: WeightOrHeightEntryPaeds(
                    fieldText: fieldTextCreatinine,
                    title: "4. Creat",
                    units: "",
                    onChanged: (input)
                    {
                      setState(() {
                        inputCreatinine = input;
                      });

                    },),


                  toggleBox5: DosingDoubleToggle(
                    title: "5. Sex",
                    firstToggleText: 'Male',
                    secondToggleText: 'Female',

                    indexPosition: isMale,
                    onValueChanged: (index)
                    {
                      FocusScope.of(context).unfocus();
                      setState(() {
                        isMale = index;
                      });

                    },

                    button1: MaterialButton(
                      height: 30,
                      minWidth: 50,
                      splashColor: Colors.grey,
                      highlightColor: Colors.white,
                      child: const Text('Reset',
                          style: TextStyle(
                            color: kIconLightGrey,
                            fontWeight: FontWeight.w400,

                          )),
                      onPressed: ()
                      {
                        clearText();
                      },),

                    button2: MaterialButton(
                      height: 30,
                      minWidth: 50,
                      color: kHighlightedToggleRed,
                      splashColor: kIconLightGrey,
                      highlightColor: kHighlightedToggleRed,
                      elevation: 0,
                      highlightElevation: 0,
                      child: const Text("Dose",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),),
                      onPressed: (){
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
                    ),
                  ),
              ),

              LevelInterpretationWidget(
                pageTitle: 'Vancomycin Levels',
                topBox: LevelPageBuildingBlock(
                    topBarTitle: 'Select infection target level',
                    line1:
                       Container(
                         margin: EdgeInsets.only(bottom: 10,),
                         child: CupertinoSlidingSegmentedControl<int>(
                                groupValue: targetLevel,
                                children:
                                {
                                  0: Container(
                                    alignment: Alignment.center,
                                    width: MediaQuery.of(context).size.width/2.0,
                                    height: 30,
                                    child: const Text("Non-severe 10-15 mg/L",
                                      textAlign: TextAlign.center,
                                      style:TextStyle(
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                  1:Container(
                                    alignment: Alignment.center,
                                    width: MediaQuery.of(context).size.width/2.0,
                                    height: 30,
                                    child: const Text("Severe 15-20 mg/L",
                                      textAlign: TextAlign.center,
                                      style:TextStyle(
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),

                                },
                                onValueChanged: (index)
                                {
                                  setState(() {
                                    targetLevel = index;
                                  });
                                },
                                thumbColor: kVeryLightPinkToggleHighlight,
                                backgroundColor: kBackgroundToggleGrey,
                              ),
                       ),


                    ),

                bottomBox: Expanded(
                  child: LevelPageBuildingBlock(
                      topBarTitle: 'Interpretation of vancomycin level',
                      line1: ToggleSwitchQuintet(
                          title: "Current Dose?",
                          indexPosition: currentDose,
                          onValueChanged: (index)
                          {
                            setState(() {
                              currentDose = index;
                            });

                          },

                          firstText: '0.5g',
                          secondText: '0.75g',
                          thirdText: "1g",
                          fourthText: '1.25g',
                          fifthText: '1.5g',
                          switchColour: kVeryLightPinkToggleHighlight),
                    line2: ToggleSwitchTriple(
                        title: "Current frequency?",
                        indexPosition: currentFrequency,
                        descriptionSpecificFontSize: 13,
                        onValueChanged: (index)
                        {
                          setState(() {
                            currentFrequency = index;
                          });
                        },

                        firstText: '<OD',
                        secondText: 'OD',
                        thirdText: "BD",
                        switchColour: kVeryLightPinkToggleHighlight),
                    line3: InterpretationTextFieldAndButton(
                        textController: textControllerInterpretation,
                        onChanged: (input)
                        {
                          setState(() {
                            preDoseLevelString = input;
                          });

                        },
                        onPressed: ()
                        {
                          try
                          {
                            preDoseLevelDouble = double.parse(preDoseLevelString);


                            setState(() {

                              if (preDoseLevelDouble <5)
                                {
                                  levelInterpretationChecker(
                                      numberOfLevelsToMoveUpOrDown: 2,
                                      extraStringText: "Increase dose to"
                                  );

                                }
                              else if (preDoseLevelDouble >= 5 && preDoseLevelDouble <10)
                                {
                                  if(targetLevel == 0)
                                    {
                                      levelInterpretationChecker(
                                          numberOfLevelsToMoveUpOrDown: 1,
                                          extraStringText: "Increase dose to"
                                      );
                                    }
                                  else if (targetLevel == 1)
                                    {
                                      levelInterpretationChecker(
                                          numberOfLevelsToMoveUpOrDown: 2,
                                          extraStringText: "Increase dose to"
                                      );
                                    }
                                }
                              else if (preDoseLevelDouble >=10 && preDoseLevelDouble <15)
                                {
                                  if(targetLevel == 0)
                                  {
                                    finalBottomInterpretationExtraInformationOutput = "Maintain at present dose, the dosing is within the target range";
                                  }
                                  else if (targetLevel == 1)
                                  {
                                    levelInterpretationChecker(
                                        numberOfLevelsToMoveUpOrDown: 1,
                                        extraStringText: "Increase dose to"
                                    );
                                  }
                                }
                              else if (preDoseLevelDouble >=15 && preDoseLevelDouble <20)
                                {
                                  finalBottomInterpretationExtraInformationOutput = "Maintain at present dose, the dosing is within the target range";
                                }
                              else if (preDoseLevelDouble >=20 && preDoseLevelDouble <25)
                                {
                                  levelInterpretationChecker(
                                      numberOfLevelsToMoveUpOrDown: -1,
                                      extraStringText: "Decrease dose to"
                                  );
                                }
                              else if (preDoseLevelDouble >= 25 && preDoseLevelDouble <30)
                                {
                                  levelInterpretationChecker(
                                      numberOfLevelsToMoveUpOrDown: -2,
                                      extraStringText: "OMIT next dose and reduce dose to"
                                  );
                                }
                              else
                                {
                                  finalBottomInterpretationExtraInformationOutput = "STOP and contact antimicrobial pharmacist or microbiology for advice";
                                }
                            });
                          }
                          catch(e)
                          {
                            print("There was a problem");

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
                                          textControllerInterpretation.clear();
                                          setState(() {
                                            preDoseLevelDouble = 0;
                                            preDoseLevelString = '';
                                          });
                                        }
                                    ),
                                  ]
                              ),
                            );

                          }

                        },
                        text: 'Pre-dose level?'),
                    line4: Align(
                        alignment: Alignment.topLeft,
                        child: Text(finalBottomInterpretationExtraInformationOutput)),

                  ),
                ),

                bottomRedBox: LevelsRedTextBox(
                    topBoldText: 'Monitoring',
                    bottomMainText: 'Twice weekly: If renal function remains stable and pre-dose levels are within recommended range.\n\nAlternate days: If renal function is impaired but stable.\n\nDaily: If renal function changing rapidly, check levels daily to prevent over/under treatment.'),
              ),

              const HeightAndWeightConverter(),


            ],
            index: _currentIndexOfBottomBar,

          ),

          bottomNavigationBar: BottomNavigationBar(
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
    );
  }
}


