import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/custom_widgets.dart';

class Clostridiodes extends StatefulWidget {
  @override
  _ClostridiodesState createState() => _ClostridiodesState();
}

class _ClostridiodesState extends State<Clostridiodes> {

  int? olderThan60 = 0;
  int? pyrexia = 0;
  int? leucocytosis = 0;
  int? hypoalbuminaemia = 0;
  int? raisedCreatinine = 0;
  int? colitis = 0;
  int? needsICU = 0;
  int? radiologicalFeatures = 0;
  int colitisScore = 0;
  
  String antibioticTextOutput = "Select Options";
  
  List<String> antibioticTextInput = [
    """ Vancomycin 125mg QDS PO for 10 days
            
If unable to tolerate oral route: Metronidazole 500mg TDS IV and discuss with pharmacy

Escalate to the severe treatment option and discuss with medical microbiology
""",""" Vancomycin 125mg QDS PO for 10-14 days
                    
If unable to tolerate oral route: Metronidazole 500mg TDS IV and discuss with pharmacy

Escalate to life-threatening CDI treatment option and discuss with medical microbiology
""",""" Vancomycin 500mg QDS PO + Metronidazole 500mg TDS IV for 10 – 14 days

Refer to Gastroenterology and Surgical Registrars

Contact medical microbiology, Gastroenterology & Surgical Registrars  for further advice
""",
    
  ];
  
  
  colitisScoreFunction()
  {
    colitisScore = 0;
    setState(() {
      if (olderThan60 == 1)
      {
        colitisScore++;
      }
      if (pyrexia == 1)
      {
        colitisScore++;
      }
      if (leucocytosis == 1)
      {
        colitisScore++;
      }
      if (hypoalbuminaemia == 1)
      {
        colitisScore++;
      }
      if (raisedCreatinine == 1)
      {
        colitisScore++;
      }
    });

  }

  notifyParent()
  {
    setState(() {
      if(colitis == 1 || needsICU == 1 || radiologicalFeatures ==1)
        {
          antibioticTextOutput = antibioticTextInput [2];
        }
      else if(colitisScore <2)
        {
          antibioticTextOutput = antibioticTextInput [0];
        }
      else if (colitisScore >=2)
        {
          antibioticTextOutput = antibioticTextInput [1];
        }
      

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notifyParent();
  }


  @override
  Widget build(BuildContext context) {
    return ClassicEndPage(
      pageTitle: 'Clostridiodes difficile',
      antibioticTextOutput: antibioticTextOutput,
      widgetSpacing: 17,
      topRedBox: TopRedInfoBox(
        textInput: 'Severity Score',
        height: 25,
        textAlignment: Alignment.centerLeft,
        verticalPadding: 2,
        horizontalPadding: 5,
      ),
      
      toggleBox1: YesNoToggleSwitchScoring(
          title: '1. Age >60', 
          indexPosition: olderThan60,
          onValueChanged: (index)
          {
            setState(() {
              olderThan60 = index;
            });
            colitisScoreFunction();
            notifyParent();
          },

         ),

      toggleBox2: YesNoToggleSwitchScoring(
          title: "2. Temperature >38.5˚C",
          indexPosition: pyrexia,
          onValueChanged: (index)
          {
            setState(() {
              pyrexia = index;
            });
            colitisScoreFunction();
            notifyParent();
          },
          ),

      toggleBox3: YesNoToggleSwitchScoring(
          title: '3. WCC >15',
          indexPosition: leucocytosis,
          onValueChanged: (index)
          {
            setState(() {
              leucocytosis = index;
            });
            colitisScoreFunction();
            notifyParent();

            },
          ),

      toggleBox4: YesNoToggleSwitchScoring(
          title: "4. Albumin <25",
          indexPosition: hypoalbuminaemia,
          onValueChanged: (index)
          {
            setState(() {
              hypoalbuminaemia = index;
            });
            colitisScoreFunction();
            notifyParent();
          },
          ),

      toggleBox5: YesNoToggleSwitchScoring(
          title: '5. Creatinine >50% above baseline',
          indexPosition: raisedCreatinine,
          onValueChanged: (index)
          {
            setState(() {
              raisedCreatinine = index;
            });
            colitisScoreFunction();
            notifyParent();
          },
          ),

      toggleBox6: YesNoToggleSwitchScoring(
          title: "6. Endoscopic pseudomembranous colitis",
          indexPosition: colitis,
          onValueChanged: (index)
          {
            setState(() {
              colitis = index;
            });
            notifyParent();

          },
          ),

      toggleBox7: YesNoToggleSwitchScoring(
          title: '7. Need for ITU admission',
          indexPosition: needsICU,
          onValueChanged: (index)
          {
            setState(() {
              needsICU = index;
            });
            notifyParent();

          },
          ),

      toggleBox8: YesNoToggleSwitchScoring(
          title: "8. Radiological/abdo signs of severe colitis",
          indexPosition: radiologicalFeatures,
          onValueChanged: (index)
          {
            setState(() {
              radiologicalFeatures = index;
            });
            notifyParent();
          },
          ),


    );
  }
}

