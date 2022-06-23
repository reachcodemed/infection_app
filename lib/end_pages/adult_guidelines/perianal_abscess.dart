import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/custom_widgets.dart';

class PerianalAbscess extends StatefulWidget {
  const PerianalAbscess({Key? key}) : super(key: key);

  @override
  _PerianalAbscessState createState() => _PerianalAbscessState();
}

class _PerianalAbscessState extends State<PerianalAbscess> {


  int?penicillinAllergic = 0;

  List <String> antibioticTextInput =
  [
    """ Co-amoxiclav PO 625mg PO TDS

Only treat with antibiotics if surrounding cellulitis is present. Drainage should always be attempted.

Duration:
Treatment 5-7 days
""",
    """ Doxycycline 200mg PO OD
+ Metronidazole 400mg PO TDS

Only treat with antibiotics if surrounding cellulitis is present. Drainage should always be attempted.

Duration:
Treatment 5-7 days
""",


  ];

  String antibioticTextOutput = "Select Options";


  notifyParent()
  {
    setState(() {
      if(penicillinAllergic == 0)
        {
          antibioticTextOutput = antibioticTextInput[0];
        }
      else
        {
          antibioticTextOutput = antibioticTextInput[1];
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
      pageTitle: "Perianal Abscess",
      antibioticTextOutput: antibioticTextOutput,
      

      toggleBox1: YesNoToggleBasic(
        title: '1. Allergic to Penicillin?',
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
