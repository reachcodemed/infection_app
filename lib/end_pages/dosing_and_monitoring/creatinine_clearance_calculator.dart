// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infection/custom_widgets.dart';
import 'package:infection/constants.dart';
import 'package:infection/end_pages/dosing_and_monitoring/height_weight_converter_widget.dart';
import 'package:infection/functions.dart';


class CreatinineClearanceCalculator extends StatefulWidget {
  const CreatinineClearanceCalculator({Key? key}) : super(key: key);

  @override
  _CreatinineClearanceCalculatorState createState() => _CreatinineClearanceCalculatorState();
}

class _CreatinineClearanceCalculatorState extends State<CreatinineClearanceCalculator> {


  final fieldTextHeight = TextEditingController();
  final fieldTextWeight = TextEditingController();
  final fieldTextAge = TextEditingController();
  final fieldTextCreatinine = TextEditingController();


  int? isMale = 0;

  String inputAge ='';
  String inputWeight = '';
  String inputHeight = '';
  String inputCreatinine = '';

  String finalIdealBodyWeight = '';
  String finalCreatinineClearance = '';



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
      finalCreatinineClearance = '';
      finalIdealBodyWeight = '';
      isMale = 0;
    });

  }

 void calculateCrCl()
 {

   setState(() {
     finalIdealBodyWeight = '${(Functions().idealBodyWeight(inputHeight,inputWeight,isMale)).toStringAsFixed(1)}';

     finalCreatinineClearance = '${(Functions().creatinineClearance(inputCreatinine,Functions().idealBodyWeight(inputHeight,inputWeight,isMale), inputAge, isMale)).toStringAsFixed(2)}';
   });

 }


  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          //toolbarHeight: 45.0,
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
        DosingEndPage(
            topPanelColour: kDosingGreen,
            pageTitle: "Creatinine Clearance Calculator",
            antibioticTextOutput1: "\nIdeal Body Weight (IBW)\n\nCreatinine Calculator",
            antibioticTextOutput2: "\n= $finalIdealBodyWeight kg\n\n= $finalCreatinineClearance min/ml",

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
                  calculateCrCl();
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
                        child: const Text('Please complete all the text fields with appropriate numerical values',
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
    ),
    );
  }
}
