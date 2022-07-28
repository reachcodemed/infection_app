import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infection/custom_widgets.dart';
import 'package:infection/constants.dart';
import 'package:infection/end_pages/dosing_and_monitoring/height_weight_converter_widget.dart';
import 'package:infection/end_pages/dosing_and_monitoring/level_template_widget.dart';
import 'package:infection/functions.dart';
import 'package:infection/main_pages/opening_page.dart';



class Gentamicin extends StatefulWidget {
  const Gentamicin({Key? key}) : super(key: key);

  @override
  _GentamicinState createState() => _GentamicinState();
}

class _GentamicinState extends State<Gentamicin> {

  final fieldTextHeight = TextEditingController();
  final fieldTextWeight = TextEditingController();
  final fieldTextAge = TextEditingController();
  final fieldTextCreatinine = TextEditingController();
  final textControllerInterpretation = TextEditingController();

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

  List <double> levelValues = [0,1.0,1.5,3.0,10000];
  List <String> levelOutput = [
    'Continue on current dosing regimen.\n\nTwice weekly pre-dose levels advised (more frequent if unstable GFR or UO).',
    'Delay next dose by 12 hours (a repeat level is not needed). The resume dosing at a 24 hour interval.\n\nTake a level pre-dose and wait for level (target <1mg/L) before giving each dose.',
    'Repeat the level in 12 hours. Once level <1mg/L resume dosing at a 48 hour interval.\n\nTake a level pre-dose and wait for level (target <1mg/L) before giving each dose.',
    'Repeat level in 24 hours. Discuss repeated result with antimicrobial pharmacist or consider stopping.\n\nTake a pre-dose and wait for level (target <1mg/L) before giving each dose.'];

  String topLine1Input = '';
  String levelOutputText = '';

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
        finalDose = '${(Functions().rounding(20, 5*doseDeterminedWeight))} mg once daily';
      }

      else if (Functions().creatinineClearance(inputCreatinine,Functions().idealBodyWeight(inputHeight,inputWeight,isMale),inputAge,isMale)<40 && Functions().creatinineClearance(inputCreatinine,Functions().idealBodyWeight(inputHeight,inputWeight,isMale),inputAge,isMale)>=20)

      {
        finalDose = '${(Functions().rounding(20, 3*doseDeterminedWeight))} mg once daily';
      }
      else if (Functions().creatinineClearance(inputCreatinine,Functions().idealBodyWeight(inputHeight,inputWeight,isMale),inputAge,isMale)<20)
      {
        finalDose = '${(Functions().rounding(20, 3*doseDeterminedWeight))} mg STAT once only';
      }
    }
    else
    {
      if(akiType == 0)
      {
        finalDose = '${(Functions().rounding(20, 5*doseDeterminedWeight))} mg STAT once only';
      }
      else if(akiType == 1)
      {
        finalDose = '${(Functions().rounding(20, 3*doseDeterminedWeight))} mg STAT once only';
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


  void levelInterpretation()
  {

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



                title: 'Gentamcin Dosing',
                idealBodyWeightOutput: finalIdealBodyWeight,
                creatinineClearanceOutput: finalCreatinineClearance,
                doseOutput: finalDose,

              ),

              LevelInterpretationWidget(
                  pageTitle: 'Gentamicin Levels',
                  topRedBox: LevelsRedTextBox(
                      topBoldText: "When to take the level",
                      bottomMainText: 'Stable renal function: within one hour before the 2nd dose. Give the 2nd dose without waiting for the level result.\n\nUnstable renal function: 24 hours after 1st Dose and await level <1mg/L before re-dosing'),
                  topBox: Expanded(
                    child: LevelPageBuildingBlock(
                        topBarTitle: "Interpretation of gentamicin level",
                      line1:InterpretationTextFieldAndButton(
                        textController: textControllerInterpretation,
                          onChanged: (input)
                          {
                            setState(() {
                              topLine1Input = input;
                            });
                          },
                          onPressed: ()
                          {
                            for (int i = 0;i< levelOutput.length;i++)
                              {
                                if(double.parse(topLine1Input)>=levelValues[i]&&double.parse(topLine1Input)<levelValues[i+1])
                                  {
                                    setState(() {
                                      levelOutputText = levelOutput[i];
                                    });

                                    break;
                                  }

                              }
                          },
                          text: 'What is the gentamicin level?'),
                      line2: Text(levelOutputText,
                      textAlign: TextAlign.left,
                      style: const TextStyle(fontSize: 13),),

                    ),
                  ),

                bottomRedBox: LevelsRedTextBox(
                    topBoldText: "Monitoring",
                    bottomMainText: "In patients with unstable renal function gentamicin levels should be repeated daily.\n\nIn patients with stable renal function gentamicin levels should be repeated twice weekly"),
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
