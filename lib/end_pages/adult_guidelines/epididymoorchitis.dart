import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/custom_widgets.dart';

class Epididymoorchitis extends StatefulWidget {
  const Epididymoorchitis({Key? key}) : super(key: key);

  @override
  _EpididymoorchitisState createState() => _EpididymoorchitisState();
}

class _EpididymoorchitisState extends State<Epididymoorchitis> {

  int?riskOfSTI = 0;
  int?isSeptic = 0;
  int?penicillinAllergic = 0;


  List <String> antibioticTextInput =
  [
    """ Ciprofloxacin 500mg PO BD for 10-14 days

Or Doxycycline 100mg PO OD for 10-14 days
""",
    """Intramuscular CefTRIAXone 1g once only IM
+ Doxycycline 100mg PO BD for 10-14 days
""",
    """ Ciprofloxacin 500mg PO BD for 10-14 days 

Or Doxycycline 100mg PO OD for 10-14 days
""",
    """Intramuscular CefTRIAXone 1g once only IM
+ Doxycycline 100mg PO BD for 10-14 days

Add Gentamicin (see local dosing guidelines) IV for 24-72 hours. Continue CefTRIAXone 2g IV OD until apyrexial for 24 hours then continue as above
""",
    """ Ciprofloxacin 500mg PO BD for 10-14 days
Or Doxycycline 100mg PO BD for 10-14 days

Add Gentamcin (see local dosing guide) IV for 24-72 hours. Continue Ciprofloxacin 400mg IV BD until apyrexial for 24 hours then continue as above
""",
  ];

  String antibioticTextOutput = "Select Options";


  notifyParent()
  {
    setState(() {
      if(riskOfSTI==0 && isSeptic == 0 && penicillinAllergic ==0)
        {
          antibioticTextOutput = antibioticTextInput[0];
        }
      else if(riskOfSTI==1 && isSeptic == 0 && penicillinAllergic ==0)
        {
          antibioticTextOutput = antibioticTextInput[1];
        }
      else if(riskOfSTI==1 && isSeptic == 0 && penicillinAllergic ==1)
        {
          antibioticTextOutput = antibioticTextInput[2];
        }
      else if(isSeptic==1)
        {
          if(penicillinAllergic==0)
              {
                antibioticTextOutput = antibioticTextInput[3];
              }
          else if (penicillinAllergic==1)
              {
                antibioticTextOutput = antibioticTextInput[4];
              }
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
      pageTitle: "Epididymo-orchitis",
      antibioticTextOutput: antibioticTextOutput,

      topRedBox: TopRedInfoBox(
        textInput: 'Send urethral swabs and urine for culture and sensitivity. Send urine for Chlamydia NAAT testing',
      ),

      toggleBox1: YesNoToggleBasic(
        title: '1. Risk of STI?',
        indexPosition: riskOfSTI,
        
        onValueChanged: (index)
        {

          setState(()
          {
            riskOfSTI = index;

          });
          notifyParent();

        },
      ),
      toggleBox2: YesNoToggleBasic(
        title: '2. Septic?',
        indexPosition: isSeptic,
        
        onValueChanged: (index)
        {

          setState(()
          {
            isSeptic = index;
          });
          notifyParent();
        },
      ),

      toggleBox3: YesNoToggleBasic(
        title: '3. Allergic to Pencillin',
        indexPosition: penicillinAllergic,
        
        onValueChanged: (index)
        {

          setState(()
          {
            penicillinAllergic = index;
          });
          notifyParent();

        },
      ),

    );
  }
}
