import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/custom_widgets.dart';

class DecompensatedLiver extends StatefulWidget {
  const DecompensatedLiver({Key? key}) : super(key: key);

  @override
  _DecompensatedLiverState createState() => _DecompensatedLiverState();
}

class _DecompensatedLiverState extends State<DecompensatedLiver> {


  int? penicillinAllergic = 0;
  int? allergyType = null;

  List <String> antibioticTextInput =
  [
    """ CefTRIAXone IV 2g OD + Teicoplanin IV (see trust doing guide) + Metronidazole PO 400mg TDS
        
If haemodynamically unstable Give a STAT dose of Gentamicin IV (see local dosing guide). Avoid repeated doses due to high risk of AKI in population.

48-72 hour Review:

1. Stop antibiotics if infection unlikely/ruled out
2. Review cultures and likely source and refine treatment based on results.
3. IV to PO switch as early as clinically appropriate
4. Keep courses as short as possible to reduce resistance and side effects.
""",
    """ CefTRIAXone IV 2g OD + Teicoplanin IV (see trust doing guide) + Metronidazole PO 400mg TDS
        
If haemodynamically unstable Give a STAT dose of Gentamicin IV (see local dosing guide). Avoid repeated doses due to high risk of AKI in population.

48-72 hour Review:

1. Stop antibiotics if infection unlikely/ruled out
2. Review cultures and likely source and refine treatment based on results.
3. IV to PO switch as early as clinically appropriate
4. Keep courses as short as possible to reduce resistance and side effects.
""",
    """ Ciprofloxacin PO 500mg BD + Teicoplanin IV (see trust doing guide) + Metronidazole PO 400mg TDS (Only give IV concerns over absorption)
            
If haemodynamically unstable Give a STAT dose of Gentamicin IV (see local dosing guide). Avoid repeated doses due to high risk of AKI in population.

48-72 hour Review:

1. Stop antibiotics if infection unlikely/ruled out
2. Review cultures and likely source and refine treatment based on results.
3. IV to PO switch as early as clinically appropriate
4. Keep courses as short as possible to reduce resistance and side effects.
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
      else if(penicillinAllergic ==1 && allergyType ==1)
        {
          antibioticTextOutput = antibioticTextInput[1];
        }
      else if(penicillinAllergic == 1 && allergyType ==0)
        {
          antibioticTextOutput = antibioticTextInput[2];
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
      pageTitle: "Decompensated Liver Disease",
      antibioticTextOutput: antibioticTextOutput,

      toggleBox1: YesNoToggleBasic(
          title: '1. Allergic to Penicillin?',
          indexPosition: penicillinAllergic,
          
          onValueChanged: (index)
          {

            setState(()
            {
              penicillinAllergic = index;
              penicillinAllergic == 1?allergyType = 0:allergyType = null;
            });
            notifyParent();

          },
      ),
      penicillinToggle: PenicillinSlider(
        indexPosition: allergyType,
        onValueChanged: (index)
        {
          setState(() {
            if (penicillinAllergic == 1)
            {
              allergyType = index;
            }
            else
            {
              allergyType = null;
            }

          });
          notifyParent();
        },
        ),
    );
  }
}
