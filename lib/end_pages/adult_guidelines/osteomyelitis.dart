import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/custom_widgets.dart';

class Osteomyelitis extends StatefulWidget {

  @override
  State<Osteomyelitis> createState() => _OsteomyelitisState();
}

class _OsteomyelitisState extends State<Osteomyelitis> {
  int? isProsthesis = 0;
  int? isMRSA = 0;
  int? isPenicillinAllergic = 0;
  int? allergyType = null;

  List <String> antibioticTextInput =
  [
    """Discuss with Microbiology, option for empiric treatment is as follows once samples taken:

 Flucloxacillin 2g IV QDS
Add: Gentamicin STAT if systemically unwell (see trust dosing guide)

Diabetic – see separate pathway

High risk MRSA: (Recurrent in-patient, nursing home resident, leg ulcers or catheters). Send urgent MRSA screen and treat as per MRSA.

48-72 hour review:  Review with imaging and MC&S, if no improvement, clinical deterioration, or uncertainty of diagnosis refer to orthopaedics and microbiology. Stop antibiotics if no evidence of infection. Consider orals if well and treating SSTI infection not septic joint.
""",
    """Refer to Orthopaedics and discuss with Microbiology
Treatment should not be held and blood cultures should be obtained if:

• Fever is present
• There is an acute onset of symptoms
• The patient has a condition or suspected condition or concomitant infection or pathogen (e.g. Staph aureus) that would make the presence of a bloodstream infection more likely.

Notes:

a. Where patient is medically stable, withholding antimicrobials for as long as possible prior to collection of synovial fluid for culture increases likelihood of recovering an organism
b. Take blood cultures, check CRP and aspirate joint.
c. Give immediate antibiotics if haemodynamically compromised.
d.  When performing urgent open debridement, take multiple intra-operative samples for culture and arrange for urgent processing by ringing microbiology lab and CUH pathology reception"
""",
    """Discuss with Microbiology, option for empiric treatment is as follows once samples taken:

 Teicoplanin IV (see trust dosing guide)"
Add: Gentamicin STAT if systemically unwell (see trust dosing guide)

Diabetic – see separate pathway

48-72 hour review:  Review with imaging and MC&S, if no improvement, clinical deterioration, or uncertainty of diagnosis refer to orthopaedics and microbiology. Stop antibiotics if no evidence of infection. Consider orals if well and treating SSTI infection not septic joint.
""",
    """Discuss with Microbiology, option for empiric treatment is as follows once samples taken:

 CefTRIAXone 2g IV QDS
Add: Gentamicin STAT if systemically unwell (see trust dosing guide)

Diabetic – see separate pathway

High risk MRSA: (Recurrent in-patient, nursing home resident, leg ulcers or catheters). Send urgent MRSA screen, and treat as per MRSA.

48-72 hour review:  Review with imaging and MC&S, if no improvement, clinical deterioration, or uncertainty of diagnosis refer to orthopaedics and microbiology. Stop antibiotics if no evidence of infection. Consider orals if well and treating SSTI infection not septic joint.
""",
    """Discuss with Microbiology, option for empiric treatment is as follows once samples taken:

 Teicoplanin IV (see trust dosing guide)"
Add: Gentamicin STAT if systemically unwell (see trust dosing guide)

Diabetic – see separate pathway

48-72 hour review:  Review with imaging and MC&S, if no improvement, clinical deterioration, or uncertainty of diagnosis refer to orthopaedics and microbiology. Stop antibiotics if no evidence of infection. Consider orals if well and treating SSTI infection not septic joint.
""",

  ];

  String antibioticTextOutput = "Select Options";

  notifyParent()
  {

    setState(() {
      if(isProsthesis==0&&isMRSA==0&&isPenicillinAllergic==0)
      {
        antibioticTextOutput = antibioticTextInput[0];
      }
      else if(isProsthesis == 1)
      {
        antibioticTextOutput = antibioticTextInput[1];
      }
      else if(isProsthesis == 0 && isMRSA == 1)
        {
          antibioticTextOutput = antibioticTextInput[2];
        }

      else if(isProsthesis == 0 && isMRSA == 0 && isPenicillinAllergic == 1 && allergyType == 1)
        {
          antibioticTextOutput = antibioticTextInput[3];
        }

      else if (isProsthesis == 0 && isMRSA == 0 && isPenicillinAllergic == 1 && allergyType == 0)
          {
            antibioticTextOutput = antibioticTextInput[4];
          }
      else
        {
        antibioticTextOutput = "Please select the toggles.";
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
      pageTitle: "Osteomyelitis",
      toggleBox1: YesNoToggleBasic(
        title: '1. Possible Infected Prosthesis?',
        indexPosition: isProsthesis,
        
        onValueChanged: (index)
        {

          setState(()
          {
            isProsthesis = index;
            isProsthesis==1?isMRSA=null:isMRSA = 0;
            isProsthesis==1?isPenicillinAllergic=null:isPenicillinAllergic = 0;
            isProsthesis==1?allergyType=null:isProsthesis = isProsthesis;
          });

          notifyParent();

        },
      ),
      toggleBox2: YesNoToggleBasic(
        title: '2. Known MRSA?',
        indexPosition: isMRSA,
        
        onValueChanged: (index)
        {

          setState(()
          {
            isMRSA = index;

            isProsthesis==1?isMRSA=null:isMRSA = index;

            if(isMRSA ==1 || isMRSA == null)
              {
                isPenicillinAllergic = null;
                allergyType = null;
              }
            else
              {
                isPenicillinAllergic = 0;
              }

          });

          notifyParent();

        },
      ),

      toggleBox3: YesNoToggleBasic(
        title: '3. Allergic to Pencillin',
        indexPosition: isPenicillinAllergic,
        
        onValueChanged: (index)
        {

          setState(()
          {
            isPenicillinAllergic = index;

            if(isProsthesis == 1 || isMRSA == 1)
              {
                isPenicillinAllergic=null;

              }
            else
              {
                isPenicillinAllergic = index;
              }



            isPenicillinAllergic == 1?allergyType = 0:allergyType = null;




          });
          notifyParent();

        },
      ),
      penicillinToggle: PenicillinSlider(
        indexPosition: allergyType,
        onValueChanged: (index)
        {

          setState(() {

            if(isProsthesis == 1)
              {
                allergyType = null;
              }
            else
              {
                if(isPenicillinAllergic == 0 || isPenicillinAllergic == null)
                  {
                    allergyType = null;
                  }
                else if(isPenicillinAllergic == 1)
                  {
                    allergyType = index;
                  }
              }
          });

          notifyParent();


        },
        ),

      antibioticTextOutput: antibioticTextOutput,

    );
  }
}
