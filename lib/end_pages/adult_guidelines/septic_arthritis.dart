import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/custom_widgets.dart';

class SepticArthritis extends StatefulWidget {
  @override
  _SepticArthritisState createState() => _SepticArthritisState();
}

class _SepticArthritisState extends State<SepticArthritis> {

  int? isProsthesis = 0;
  int? isMRSA = 0;
  int? isPenicillinAllergic = 0;
  int? allergyType = null;

  List <String> antibioticTextInput =
  [
    """Native joint: Flucloxacillin 2g IV QDS

In high-risk cases: Elderly, frail, recurrent UTI, recent abdominal surgery, IVDU, diabetic, needing HDU/ITU. Discuss with Consultant Microbiologist
        
If gonococcal septic arthritis suspected: CefTRIAXone 2g IV OD PLUS discuss with Consultant Microbiologist

48-72 hour review:  Review joint with MC&S and crystal report, if no improvement, clinical deterioration or uncertainty of diagnosis refer to orthopaedics and microbiology. Stop antibiotics if no evidence of infection. Consider orals if well and treating SSTI infection not septic joint.

Duration: For septic arthritis: 6 weeks, with a minimum of 2 weeks IV antibiotics, this can be facilitated as an outpatient (OPAT) if the patient is otherwise well.
""",
    """Chronic infection, Prosthetic joint, known colonisation of other organs (e.g. cystic fibrosis): Please obtain deep sample arrange for urgent processing in the lab and discuss with Consultant Microbiologist prior to starting therapy

48-72 hour review:  Review joint with MC&S and crystal report, if no improvement, clinical deterioration or uncertainty of diagnosis refer to orthopaedics and microbiology. Stop antibiotics if no evidence of infection. Consider orals if well and treating SSTI infection not septic joint.

Duration: For septic arthritis: 6 weeks, with a minimum of 2 weeks IV antibiotics, this can be facilitated as an outpatient (OPAT) if the patient is otherwise well.
""",
    """Native joint: Teicoplanin IV (see Trust dosing guide)

In high-risk cases: Elderly, frail, recurrent UTI, recent abdominal surgery, IVDU, diabetic, needing HDU/ITU. Discuss with Consultant Microbiologist

If gonococcal septic arthritis suspected: discuss with Consultant Microbiologist

48-72 hour review:  Review joint with MC&S and crystal report, if no improvement, clinical deterioration or uncertainty of diagnosis refer to orthopaedics and microbiology. Stop antibiotics if no evidence of infection. Consider orals if well and treating SSTI infection not septic joint.

Duration: For septic arthritis: 6 weeks, with a minimum of 2 weeks IV antibiotics, this can be facilitated as an outpatient (OPAT) if the patient is otherwise well.
""",
    """Native joint: CefTRIAXone 2g IV OD

In high-risk cases: Elderly, frail, recurrent UTI, recent abdominal surgery, IVDU, diabetic, needing HDU/ITU. Discuss with Consultant Microbiologist"

If gonococcal septic arthritis suspected: CefTRIAXone 2g IV OD PLUS discuss with Consultant Microbiologist

48-72 hour review:  Review joint with MC&S and crystal report, if no improvement, clinical deterioration or uncertainty of diagnosis refer to orthopaedics and microbiology. Stop antibiotics if no evidence of infection. Consider orals if well and treating SSTI infection not septic joint.

Duration: For septic arthritis: 6 weeks, with a minimum of 2 weeks IV antibiotics, this can be facilitated as an outpatient (OPAT) if the patient is otherwise well.
""",
    """Native joint: Teicoplanin IV (see Trust dosing guide)

In high-risk cases: Elderly, frail, recurrent UTI, recent abdominal surgery, IVDU, diabetic, needing HDU/ITU. Discuss with Consultant Microbiologist

If gonococcal septic arthritis suspected: discuss with Consultant Microbiologist

48-72 hour review:  Review joint with MC&S and crystal report, if no improvement, clinical deterioration or uncertainty of diagnosis refer to orthopaedics and microbiology. Stop antibiotics if no evidence of infection. Consider orals if well and treating SSTI infection not septic joint.

Duration: For septic arthritis: 6 weeks, with a minimum of 2 weeks IV antibiotics, this can be facilitated as an outpatient (OPAT) if the patient is otherwise well.
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
        pageTitle: 'Septic Arthritis',
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
        
        
        antibioticTextOutput: antibioticTextOutput,);
  }
}
