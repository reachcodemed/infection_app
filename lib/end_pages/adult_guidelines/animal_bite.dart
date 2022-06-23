import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/custom_widgets.dart';

class AnimalBite extends StatefulWidget {
  const AnimalBite({Key? key}) : super(key: key);

  @override
  _AnimalBiteState createState() => _AnimalBiteState();
}

class _AnimalBiteState extends State<AnimalBite> {

  int? isSevere = 0;
  int? penicillinAllergic = 0;


  List <String> antibioticTextInput =
  [
    """ Co-amoxiclav PO 625mg TDS

Duration: 
Treatment: 7-10 days
Prophylaxis: 5-7 days

Management:
• Cleanse wound thoroughly
• Consider tetanus immunoglobulin (with adsorbed tetanus vaccine if necessary according to immunisation history)
• Assess HIV/Hepatitis B & C risk
• Assess tetanus & rabies risk - for dog/cat bites
• Surgical toilet is most important
• Antibiotics advised for: puncture wound; bite involving the hand/food/face/joint/tendon/ligament; immunocompromised; diabetic; asplenic; history of prosthetic valve or bite to proximal prosthetic joints
""",
    """ Co-amoxiclav IV 1.2g TDS

Duration: 
Treatment: 7-10 days
Prophylaxis: 5-7 days

Management:
• Cleanse wound thoroughly
• Consider tetanus immunoglobulin (with adsorbed tetanus vaccine if necessary according to immunisation history)
• Assess HIV/Hepatitis B & C risk
• Assess tetanus & rabies risk - for dog/cat bites
• Surgical toilet is most important
• Antibiotics advised for: puncture wound; bite involving the hand/food/face/joint/tendon/ligament; immunocompromised; diabetic; asplenic; history of prosthetic valve or bite to proximal prosthetic joints
""",
    """ Doxycycline 200mg PO OD
+ Metronidazole 400mg PO TDS

Duration: 
Treatment: 7-10 days
Prophylaxis: 5-7 days

Management:
• Cleanse wound thoroughly
• Consider tetanus immunoglobulin (with adsorbed tetanus vaccine if necessary according to immunisation history)
• Assess HIV/Hepatitis B & C risk
• Assess tetanus & rabies risk - for dog/cat bites
• Surgical toilet is most important
• Antibiotics advised for: puncture wound; bite involving the hand/food/face/joint/tendon/ligament; immunocompromised; diabetic; asplenic; history of prosthetic valve or bite to proximal prosthetic joints
""",
    """ Ciprofloxacin 500 mg PO BD or 400mg IV BD
+ Clindamycin 300-600mg PO QDS or 600-1200mg IV QDS
(both antibiotics have very good bioavailability 80-90%)

Duration: 
Treatment: 7-10 days
Prophylaxis: 5-7 days

Management:
• Cleanse wound thoroughly
• Consider tetanus immunoglobulin (with adsorbed tetanus vaccine if necessary according to immunisation history)
• Assess HIV/Hepatitis B & C risk
• Assess tetanus & rabies risk - for dog/cat bites
• Surgical toilet is most important
• Antibiotics advised for: puncture wound; bite involving the hand/food/face/joint/tendon/ligament; immunocompromised; diabetic; asplenic; history of prosthetic valve or bite to proximal prosthetic joints
""",

  ];

  String antibioticTextOutput = "Select Options";


  notifyParent()
  {
    setState(() {
      if(isSevere == 0 && penicillinAllergic == 0)
        {
          antibioticTextOutput = antibioticTextInput[0];
        }
      else if(isSevere == 1 && penicillinAllergic == 0)
        {
          antibioticTextOutput = antibioticTextInput[1];
        }
      else if(isSevere == 0 && penicillinAllergic == 1)
        {
          antibioticTextOutput = antibioticTextInput[2];
        }
      else if(isSevere == 1 && penicillinAllergic == 1)
        {
          antibioticTextOutput = antibioticTextInput[3];
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
      pageTitle: "Animal/Human Bite",
      antibioticTextOutput: antibioticTextOutput,

      topRedBox: TopRedInfoBox(
        textInput: 'In context of human bite, consider transmission of blood borne viruses (BBV)',
      ),

      toggleBox1: YesNoToggleBasic(
          title: '1. Severe/systemically unwell?',
          indexPosition: isSevere,

        onValueChanged: (index)
        {
          setState(()
          {
            isSevere= index;
          });
          notifyParent();

        },
        ),
      toggleBox2: YesNoToggleBasic(
          title: '2. Allergic to penicillin?',
          indexPosition: penicillinAllergic,

          onValueChanged: (index)
          {

            setState(()
            {
              penicillinAllergic = index;
            });
            notifyParent();

          },),

    );
  }
}
