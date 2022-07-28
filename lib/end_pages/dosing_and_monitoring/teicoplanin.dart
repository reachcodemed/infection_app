import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:infection/constants.dart';
import 'package:infection/end_pages/dosing_and_monitoring/height_weight_converter_widget.dart';
import 'package:infection/end_pages/dosing_and_monitoring/level_template_widget.dart';




class Teicoplanin extends StatefulWidget {
  const Teicoplanin({Key? key}) : super(key: key);

  @override
  _TeicoplaninState createState() => _TeicoplaninState();
}

class _TeicoplaninState extends State<Teicoplanin> {

  final textControllerDosing = TextEditingController();
  final textControllerCrCl = TextEditingController();

  int _currentIndexOfBottomBar = 0;
  int? isMale = 0;
  int? isAKI = 0;
  int? akiType = null;

  String inputWeightDosing = '';
  String inputWeightDosingReduction = '';
  String inputCrClDosingReduction = '';

  String topLine1Input = '';

  List <double> dosingRanges = [0,45,60,80,95,120,140,10000];
  List <String> dosingOutputs = [
    "400 mg","600 mg","800 mg","1000 mg","1200 mg","1400 mg","Discuss with antimicrobial pharmacist",
  ];
  String dosingOutput = '';
  String dosingReductionOutput = '';

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

              LevelInterpretationWidget(
                  pageTitle: "Teicoplanin Dosing",
                  topBox: Expanded(
                    child: LevelPageBuildingBlock(
                        topBarTitle: 'Dosing',
                        line1: InterpretationTextFieldAndButton(
                            textController: textControllerDosing,
                            onChanged: (input)
                            {
                              setState(() {
                                inputWeightDosing = input;
                              });
                            },
                            onPressed: ()
                            {
                              for(int i = 0;i<dosingRanges.length;i++)
                              {
                                if(double.parse(inputWeightDosing)>=dosingRanges[i]&&double.parse(inputWeightDosing)<dosingRanges[i+1])
                                {
                                  setState(() {

                                if(double.parse(inputWeightDosing)>=140)
                                    {

                                    dosingOutput = dosingOutputs[i];

                                    }

                                  else
                                    {
                                      dosingOutput = "Loading dose = ${dosingOutputs[i]}\n\n12-hourly for 3 doses then OD days 3 & 4. Loading doses remains the same regardless of renal function.\n\nMaintenance dose = ${dosingOutputs[i]} OD\n\nFor some patients > 80kg the dose may need to be increased based on the levels.";
                                    }


                                  });
                                }
                              }
                            },
                            extraUnits: const Text('kg',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),),
                            text: "1. Patient's Weight"),
                        line2: Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            child: Text(dosingOutput,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              fontSize: 12,
                            ),),
                          ),
                        ),

                    ),
                  ),

                bottomBox: Expanded(
                  child: LevelPageBuildingBlock(
                    topBarTitle: 'Renal Dose Reduction',
                    line1: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        //SizedBox(height: widget.upperBoxHeight),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(
                              //width: 80,
                              child: Text("1. Patient's Weight",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),),
                            ),

                            //const SizedBox(width: 92),

                            Row(
                              //mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 60,
                                  height: 30,
                                  child: TextField(
                                    //controller: TextEditingController(),
                                    keyboardType: TextInputType.number,
                                    onChanged: (input)
                                    {
                                      setState(() {
                                        inputWeightDosingReduction = input;
                                      });
                                    },
                                      style: const TextStyle(
                                      fontSize: 12,
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
                                SizedBox(width: 10,),
                                const Text("kg",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),),
                              ],
                            ),
                            SizedBox(width: 40),

                          ],
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                    line2: InterpretationTextFieldAndButton(
                        textController: textControllerCrCl,
                        onChanged: (input)
                        {
                          setState(() {
                            inputCrClDosingReduction = input;
                          });
                        },
                        onPressed: ()
                        {
                          for(int i = 0;i<dosingRanges.length;i++)
                          {
                            if(double.parse(inputWeightDosingReduction)>=dosingRanges[i]&&double.parse(inputWeightDosingReduction)<dosingRanges[i+1])
                            {
                              setState(() {
                                if(double.parse(inputWeightDosingReduction)>=140)
                                {
                                  dosingReductionOutput = dosingOutputs[i];
                                }

                                else
                                {
                                  if(double.parse(inputCrClDosingReduction)>=40)
                                    {
                                      dosingReductionOutput = "Dose = ${dosingOutputs[i]}\n\nNo dose adjustment advised.";
                                    }

                                  else if (double.parse(inputCrClDosingReduction)<40 && double.parse(inputCrClDosingReduction)>=30)
                                    {
                                      dosingReductionOutput = "Dose = ${dosingOutputs[i]}\n\nDose reduce on day 4 of treatment, reducing the dosing frequency to every 48 hours.";
                                    }
                                  else
                                    {
                                      dosingReductionOutput = "Dose = ${dosingOutputs[i]}\n\nDose reduce on day 4 of treatment, reducing the dosing frequency to every 72 hours.";
                                    }

                                }
                              });
                            }
                          }
                        },
                        extraUnits: const Text('ml/min',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),),
                        text: "2. Creatinine Clearance"),
                    line3: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Text(dosingReductionOutput,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontSize: 12,
                          ),),
                      ),
                    ),

                  ),
                ),
                bottomRedBox: LevelsRedTextBox(
                    topBoldText: "Monitoring",
                    bottomMainText: "Pre-dose (trough) levels taken at least 5 days after starting treatment. Take level within 1 hour before the dose. In bone and joint infections aim for levels of 20-60 mg/L"),
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
                label: 'Calculator',
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
