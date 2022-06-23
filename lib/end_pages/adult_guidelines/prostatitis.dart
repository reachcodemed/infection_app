import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/custom_widgets.dart';

class Prostatitis extends StatefulWidget {
  const Prostatitis({Key? key}) : super(key: key);

  @override
  _ProstatitisState createState() => _ProstatitisState();
}

class _ProstatitisState extends State<Prostatitis> {


  int?isSeptic = 0;

  List <String> antibioticTextInput =
  [
    """ Co-trimoxazole 960mg PO BD 14 days (not suitable in sulphur allergy). If Co-trimoxazole is unsuitable, then Ciprofloxacin 500mg BD 14 days""",
    """ Gentamicin IV (see local dosing guidelines) for 24-72 hours
+ CefTRIAXone 2g IV OD

48-72 hr review:
If apyrexial and improving inflammatory markers - switch to PO as guided by cultures

Duration:
Complete 3-4 weeks of antibiotics. If ongoing pyrexia - exclude abscesses and discuss with microbiology
""",
  ];

  String antibioticTextOutput = "Select Options";


  notifyParent()
  {
    setState(() {
      if(isSeptic == 0)
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
      pageTitle: "Prostatitis",
      antibioticTextOutput: antibioticTextOutput,

      toggleBox1: YesNoToggleBasic(
        title: '1. Patient pregnant?',
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
    
    );
  }
}
