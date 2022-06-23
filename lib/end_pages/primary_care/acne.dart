import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';

class GPAcne extends StatefulWidget {
  const GPAcne({Key? key}) : super(key: key);

  @override
  _GPAcneState createState() => _GPAcneState();
}

class _GPAcneState extends State<GPAcne> {

  String antibioticTextOutput = "Select Options";
  int? treatmentLine = 0;

  List<String> antibioticTextInput = [
    """Self-care (wash with mild soap; do not scrub; avoid make-up)""",
    """Topical: Retinoid (such as Adapalene 0.1% gel/cream)

Adult: Apply thinly in the evening once a day

Children: please refer to BNFC

Duration: 6-8 weeks

OR 

Topical: Benzoyl Peroxide

Adult: Apply 1-2 times a day, preferably apply after washing with soap and water, start treatment with lower strength preparations.

Children: please refer to BNFC

Duration: 6-8 weeks
""",
    """ADD to second line:

Topical: Clindamycin 10mg/1ml 1% topical solution

Adult: Apply thinly twice daily, to be applied thinly

Children: please refer to BNFC

OR

Switch to combination product such as: Clindamycin 10mg/g and Tretinoin 0.025 mg/g or Clindamycin 10mg/g and Benzoyl Peroxide 50mg

Adult: Apply thinly once daily in the evening

Children: Please refer to BNFC

Duration: 12 weeks

If treatment failure or severe nodes/cysts: Doxycycline 100mg BD for 6-12 weeks
""",

  ];

  notifyParent()
  {
    if(treatmentLine == 0)
      {
       antibioticTextOutput = antibioticTextInput[0];
      }
    else if(treatmentLine == 1)
      {
        antibioticTextOutput = antibioticTextInput[1];
      }
    else if(treatmentLine == 2)
      {
        antibioticTextOutput = antibioticTextInput[2];
      }
    else
      {
        antibioticTextOutput = "Select Options";
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
      pageTitle: "Acne Vulgaris",
      antibioticTextOutput: antibioticTextOutput,

      topRedBox: TopRedInfoBox(
        boxColour: kPaedsDropDownBlue,
        textInput: 'Topical monotherapy with antibiotics is not recommended because of risk of antibiotic resistance. Topical antibiotics should be prescribed in combination with benzoyl peroxide',
      ),

     toggleBox1: TripleSwitchFullWidth(
         indexPosition: treatmentLine,
         firstText: 'First Line',
         secondText: 'Second Line',
         thirdText: 'Intractable/Scalp',
         onValueChanged: (index)
    {
      setState(() {
        treatmentLine = index;
        notifyParent();
      });
    },
     ),




    );
  }
}
