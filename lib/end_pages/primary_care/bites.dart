import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';

class GPBites extends StatefulWidget {
  const GPBites({Key? key}) : super(key: key);

  @override
  _GPBitesState createState() => _GPBitesState();
}

class _GPBitesState extends State<GPBites> {

  String antibioticTextOutput = "Select Options";
  int? isPenicillinAllergic = 0;

  List<String> antibioticTextInput = [
    """Prophylaxis for human and animal bites:

Adult: Co-amoxiclav 375mg-625mg TDS

Children: please refer to BNFC

Duration: 7 days
""",
    """Human bites:

Adult: Clarithromycin 500mg BD and Metronidazole 400mg TDS

Children: please refer to BNFC

Duration: 7 days

Animal bites:

Adult: Doxycycline 100mg BD and Metronidazole 400mg TDS

Children: please refer to BNFC

Duration 7 days
""",
  ];

  notifyParent()
  {
   if(isPenicillinAllergic == 0)
     {
       antibioticTextOutput = antibioticTextInput[0];
     }
   else
     {
       antibioticTextOutput = antibioticTextInput[1];
     }
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
      topPanelColour: kPrimaryCareOrange,
      pageTitle: "Bites (Human & Animal)",

      antibioticTextOutput: antibioticTextOutput,

      topRedBox: TopRedInfoBox(
        boxColour: kPaedsDropDownBlue,
        height: 120,
        textInput: 'Human: thorough irrigation. Antibiotic prophylaxis advised. Assess risk of tetanus, rabies, HIV and hepatitis B and C. Cat: always give prophylaxis. Dog: give prophylaxis if: puncture wound; bite to hand, foot, face, joint, tendon, or ligament; immunocompetent; cirrhotic; or presence of prosthetic valve/joint.',
      ),

      toggleBox1: YesNoToggleBasic(
          title: '1. Allergic to Penicillin?',
          indexPosition: isPenicillinAllergic,
          switchColour: kHighlightedToggleYellow,
          onValueChanged: (index)
        {
          setState(() {
            isPenicillinAllergic = index;
            notifyParent();
          });
        },),


    );
  }
}
