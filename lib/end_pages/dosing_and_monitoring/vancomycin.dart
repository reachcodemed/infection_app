import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infection/custom_widgets.dart';
import 'package:infection/constants.dart';
import 'package:infection/end_pages/dosing_and_monitoring/height_weight_converter_widget.dart';
import 'package:infection/end_pages/dosing_and_monitoring/level_template_widget.dart';
import 'package:infection/functions.dart';
import 'package:infection/main_pages/opening_page.dart';


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

  int _currentIndexOfBottomBar = 0;
  int? isMale = 0;

  int? targetLevel = 0;
  int? currentDose = 0;
  int? currentFrequency = 2;

  String preDoseLevel = '';

  String inputAge ='';
  String inputWeight = '';
  String inputHeight = '';
  String inputCreatinine = '';
  String finalLoadingDose = "mg";
  String finalMaintenanceDose = "mg";
  String finalCreatinineClearance = "";
  String finalIdealBodyWeight = "";

  List<double> creatinineValues = [0,20,29,39,54,74,89,109,10000];
  List<String> maintenanceOutputDoses = ['1g','500mg','750mg','500mg','750mg','1g','1.25g','1.5g','1.5g'];

  List<double> weightValues = [0,40,59,90,1000];
  List<String> loadingOutputDoses = ['750mg','1g','1.5g','2g'];

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

    if (double.parse(inputWeight) < (Functions().idealBodyWeight(inputHeight,inputWeight,isMale)*1.2))
    {
      doseDeterminedWeight = double.parse(inputWeight);

    }
    else
    {
      doseDeterminedWeight = Functions().idealBodyWeight(inputHeight,inputWeight,isMale);
    }


    for(int i = 0; i<creatinineValues.length;i++) {
      if (Functions().creatinineClearance(inputCreatinine,doseDeterminedWeight, inputAge, isMale) >= creatinineValues[i] &&
          Functions().creatinineClearance(inputCreatinine, doseDeterminedWeight, inputAge, isMale) < creatinineValues[i + 1])
      {
        finalMaintenanceDose = maintenanceOutputDoses[i];
        break;
      }
    }

    for(int j = 0;j<loadingOutputDoses.length;j++)
    {


      if(double.parse(inputWeight)>=weightValues[j]&&double.parse(inputWeight)<weightValues[j+1])
      {
        print('Hiyo there $j');
        finalLoadingDose = loadingOutputDoses[j];
        break;
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
            antibioticTextOutput1: "Loading Dose\n\nMaintenance Dose\n\nIdeal Body Weight (IBW)\n\nCreatinine Clearance",
            antibioticTextOutput2: '= $finalLoadingDose\n\n= $finalMaintenanceDose\n\n= $finalCreatinineClearance ml/min\n\n= $finalIdealBodyWeight kg',
            topPanelColour: kDosingGreen,

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
                      line1: ToggleSwitchQuad(
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
                          switchColour: kVeryLightPinkToggleHighlight),
                    line2: ToggleSwitchQuad(
                        title: "Current frequency?",
                        indexPosition: currentFrequency,
                        onValueChanged: (index)
                        {
                          setState(() {
                            currentFrequency = index;
                          });
                        },

                        firstText: '<OD',
                        secondText: 'OD',
                        thirdText: "BD",
                        fourthText: 'TDS',
                        switchColour: kVeryLightPinkToggleHighlight),
                    line3: InterpretationTextFieldAndButton(
                        onChanged: (input)
                        {
                          setState(() {

                          });
                        },
                        onPressed: ()
                        {

                        },
                        text: 'Pre-dose level?'),
                    line4: Text("Output Here"),

                  ),
                ),

                bottomRedBox: LevelsRedTextBox(
                    topBoldText: 'Monitoring',
                    bottomMainText: 'Twice weekly: If renal function remains stable and pre-dose levels are within recommended range.\n\nAlternate days: If renal function is impaired but stable.\n\nDaily: If renal function changing rapidly, check levels daily to prevent over/under treatment.'),
              ),

              HeightAndWeightConverter(),


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


