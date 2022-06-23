import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';

class GPLowerUTI extends StatefulWidget {
  const GPLowerUTI({Key? key}) : super(key: key);

  @override
  _GPLowerUTIState createState() => _GPLowerUTIState();
}

class _GPLowerUTIState extends State<GPLowerUTI> {

  String antibioticTextOutput = "Select Options";
  int? isFirstLine = 0;
  int? penicillinAllergic = 0;
  int? category = 0;
  int? allergyType = null;

  List <String> adultMaleInput = [
    """First Line: Oral Nitrofurantoin (eGFR >45)

Adult: 100mg MR BD 

Duration: 7 days
""",
    """First Line: Oral Nitrofurantoin (eGFR >45)

Adult: 100mg MR BD 

Duration: 7 days
""",
    """First Line: Oral Nitrofurantoin (eGFR >45)

Adult: 100mg MR BD 

Duration: 7 days
""",
    """Second line: Oral Trimethoprim 

Adult: 200mg BD

Duration: 7 days
""",
    """Second line: Oral Trimethoprim 

Adult: 200mg BD

Duration: 7 days
""",
    """Second line: Oral Trimethoprim 

Adult: 200mg BD

Duration: 7 days
""",
    """Consider alternative diagnoses basing antibiotics choice on recent culture and susceptibility results""",
    """Consider alternative diagnoses basing antibiotics choice on recent culture and susceptibility results""",
    """Consider alternative diagnoses basing antibiotics choice on recent culture and susceptibility results""",
  ];


  List <String> adultFemaleInput = [
    """First Line: Oral Nitrofurantoin (eGFR >45)

Adult: 100mg MR BD 

Duration: 3 days

""",
    """First Line: Oral Nitrofurantoin (eGFR >45)

Adult: 100mg MR BD 

Duration: 3 days
""",
    """First Line: Oral Nitrofurantoin (eGFR >45)

Adult: 100mg MR BD 

Duration: 3 days

""",
    """Second line: Oral Trimethoprim 

Adult: 200mg BD

Duration: 3 days

""",
    """Second line: Oral Trimethoprim 

Adult: 200mg BD

Duration: 3 days

""",
    """Second line: Oral Trimethoprim 

Adult: 200mg BD

Duration: 3 days

""",
    """Third line: Oral Pivmecillinam 

Adult: 400mg initial dose then 200mg TDS

Duration: 3 days 

OR

 Fosfomycin 

Adult: 3g single dose sachet

Duration: STAT
""",
    """ Fosfomycin   

Adult: 3g single dose sachet

Duration: STAT
""",
    """ Fosfomycin  

Adult: 3g single dose sachet

Duration: STAT
""",
  ];

  List<String> pregnantInput = [
    """First Line: Oral Nitrofurantoin (eGFR >45)

Adult: 100mg MR BD 

Duration: 7 days
""",
    """First Line: Oral Nitrofurantoin (eGFR >45)

Adult: 100mg MR BD 

Duration: 7 days
""",
    """First Line: Oral Nitrofurantoin (eGFR >45)

Adult: 100mg MR BD 

Duration: 7 days
""",
    """Second line: Oral Amoxicillin 

Adult: 500mg TDS

Duration: 7 days 

OR 

Oral Cefalexin 

Adult: 500mg BD

Duration: 7 days
""",
    """Second line: Oral Cefalexin 

Adult: 500mg BD

Duration: 7 days
""",
    """Discuss with Consultant Microbiologist""",
    """Discuss with Consultant Microbiologist""",
    """Discuss with Consultant Microbiologist""",
    """Discuss with Consultant Microbiologist""",
  ];


  List<String> childInput = [
    """First Line: Oral Trimethoprim 4mg/kg BD (max 200mg per dose)

OR 

3-5 months: 25mg BD 
6 months-5 years: 50mg BD
6-11 years: 100mg BD
12-17 years: 200mg BD

Duration 3 days

OR 

Oral Nitrofurantoin (eGFR > 45)

3 months - 11 years 750 micrograms/kg QDS
12-17 years 100mg MR BD

Duration: 3 days

""",
    """First Line: Oral Trimethoprim 4mg/kg BD (max 200mg per dose)

OR 

3-5 months: 25mg BD 
6 months-5 years: 50mg BD
6-11 years: 100mg BD
12-17 years: 200mg BD

Duration 3 days

OR 

Oral Nitrofurantoin (eGFR > 45)

3 months - 11 years 750 micrograms/kg QDS
12-17 years 100mg MR BD

Duration: 3 days

""",
    """First Line: Oral Trimethoprim 4mg/kg BD (max 200mg per dose)

OR 

3-5 months: 25mg BD 
6 months-5 years: 50mg BD
6-11 years: 100mg BD
12-17 years: 200mg BD

Duration 3 days

OR 

Oral Nitrofurantoin (eGFR > 45)

3 months - 11 years 750 micrograms/kg QDS
12-17 years 100mg MR BD

Duration: 3 days

""",
    """Second Line: Oral Nitrofurantoin (eGFR > 45)

3 months - 11 years 750 micrograms/kg QDS
12-17 years 100mg MR BD

Duration: 3 days

OR

Oral Cefalexin  

12.5mg/kg BD

OR 
3-11 months: 125mg BD
1-4 years: 125mg TDS
5-11 years: 250mg TDS
12-17 years: 500mg BD or TDS

Duration 3 days

OR 

Oral Amoxicillin (only if cultures results are available and susceptible)

3-11 months: 125mg TDS
1-4 years: 250mg TDS
5-15 years: 500mg TDS

Duration: 3 days

""",
    """Second Line: Oral Nitrofurantoin (eGFR > 45)

3 months - 11 years 750 micrograms/kg QDS
12-17 years 100mg MR BD

Duration: 3 days

OR

Oral Cefalexin  

12.5mg/kg BD

OR 
3-11 months: 125mg BD
1-4 years: 125mg TDS
5-11 years: 250mg TDS
12-17 years: 500mg BD or TDS

Duration 3 days

""",
    """Second Line: Oral Nitrofurantoin (eGFR > 45)

3 months - 11 years 750 micrograms/kg QDS
12-17 years 100mg MR BD

Duration: 3 days""",
    """Discuss with Consultant Microbiologist""",
    """Discuss with Consultant Microbiologist""",
    """Discuss with Consultant Microbiologist""",
  ];


  notifyParent()
  {
    if(category == 0)
      {
        if(isFirstLine == 0)
          {
            if(penicillinAllergic ==  0)
              {
                antibioticTextOutput = adultMaleInput[0];
              }
            else
              {
                if(allergyType == 1)
                  {
                    antibioticTextOutput = adultMaleInput[1];
                  }
                else
                  {
                    antibioticTextOutput = adultMaleInput[2];
                  }
              }

          }
        else if (isFirstLine == 1)
          {
            if(penicillinAllergic ==  0)
            {
              antibioticTextOutput = adultMaleInput[3];
            }
            else
            {
              if(allergyType == 1)
              {
                antibioticTextOutput = adultMaleInput[4];
              }
              else
              {
                antibioticTextOutput = adultMaleInput[5];
              }
            }
          }
        else
          {
            if(penicillinAllergic ==  0)
            {
              antibioticTextOutput = adultMaleInput[6];
            }
            else
            {
              if(allergyType == 1)
              {
                antibioticTextOutput = adultMaleInput[7];
              }
              else
              {
                antibioticTextOutput = adultMaleInput[8];
              }
            }
          }
      }
    else if (category == 1)
      {
        if(isFirstLine == 0)
        {
          if(penicillinAllergic ==  0)
          {
            antibioticTextOutput = adultFemaleInput[0];
          }
          else
          {
            if(allergyType == 1)
            {
              antibioticTextOutput = adultFemaleInput[1];
            }
            else
            {
              antibioticTextOutput = adultFemaleInput[2];
            }
          }

        }
        else if (isFirstLine == 1)
        {
          if(penicillinAllergic ==  0)
          {
            antibioticTextOutput = adultFemaleInput[3];
          }
          else
          {
            if(allergyType == 1)
            {
              antibioticTextOutput = adultFemaleInput[4];
            }
            else
            {
              antibioticTextOutput = adultFemaleInput[5];
            }
          }
        }
        else
        {
          if(penicillinAllergic ==  0)
          {
            antibioticTextOutput = adultFemaleInput[6];
          }
          else
          {
            if(allergyType == 1)
            {
              antibioticTextOutput = adultFemaleInput[7];
            }
            else
            {
              antibioticTextOutput = adultFemaleInput[8];
            }
          }
        }
      }
    else if (category == 2)
      {
        if(isFirstLine == 0)
        {
          if(penicillinAllergic ==  0)
          {
            antibioticTextOutput = pregnantInput[0];
          }
          else
          {
            if(allergyType == 1)
            {
              antibioticTextOutput = pregnantInput[1];
            }
            else
            {
              antibioticTextOutput = pregnantInput[2];
            }
          }

        }
        else if (isFirstLine == 1)
        {
          if(penicillinAllergic ==  0)
          {
            antibioticTextOutput = pregnantInput[3];
          }
          else
          {
            if(allergyType == 1)
            {
              antibioticTextOutput = pregnantInput[4];
            }
            else
            {
              antibioticTextOutput = pregnantInput[5];
            }
          }
        }
        else
        {
          if(penicillinAllergic ==  0)
          {
            antibioticTextOutput = pregnantInput[6];
          }
          else
          {
            if(allergyType == 1)
            {
              antibioticTextOutput = pregnantInput[7];
            }
            else
            {
              antibioticTextOutput = pregnantInput[8];
            }
          }
        }
      }
    else if (category == 3)
      {
        if(isFirstLine == 0)
        {
          if(penicillinAllergic ==  0)
          {
            antibioticTextOutput = childInput[0];
          }
          else
          {
            if(allergyType == 1)
            {
              antibioticTextOutput = childInput[1];
            }
            else
            {
              antibioticTextOutput = childInput[2];
            }
          }

        }
        else if (isFirstLine == 1)
        {
          if(penicillinAllergic ==  0)
          {
            antibioticTextOutput = childInput[3];
          }
          else
          {
            if(allergyType == 1)
            {
              antibioticTextOutput = childInput[4];
            }
            else
            {
              antibioticTextOutput = childInput[5];
            }
          }
        }
        else
        {
          if(penicillinAllergic ==  0)
          {
            antibioticTextOutput = childInput[6];
          }
          else
          {
            if(allergyType == 1)
            {
              antibioticTextOutput = childInput[7];
            }
            else
            {
              antibioticTextOutput = childInput[8];
            }
          }
        }
      }
    else
      {

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
      pageTitle: "Lower Urinary Tract Infection",
      antibioticTextOutput: antibioticTextOutput,

      topRedBox: TopRedInfoBox(
        boxColour: kPaedsDropDownBlue,
        textInput: 'When considering antibiotics take account of the severity of symptoms, risk of complications, previous urine culture and susceptibility results, previous antibiotic use which may be led to resistant bacteria and local antimicrobial resistance data',
      ),

      
      
      toggleBox1: QuadSwtichFullWidth(
          firstText: 'Adult Man',
          secondText: 'Adult Woman',
          thirdText: 'Pregnant',
          fourthText: 'Child >3/12',
          indexPosition: category,
          onValueChanged: (index)
      {
        setState(() {
          category = index;
          notifyParent();
        });
      }),
      

      toggleBox2: TripleSwitchFullWidth(
          indexPosition: isFirstLine,
          firstText: "First Line",
          secondText: "Second Line",
          thirdText: "Third Line",
          onValueChanged: (index)
        {
          setState(() {
            isFirstLine = index;
            notifyParent();
          });
        },),

      toggleBox3: YesNoToggleBasic(
        switchColour: kHighlightedToggleYellow,
        title: 'Allergic to Penicillin?',
        indexPosition: penicillinAllergic,

        onValueChanged: (index)
        {

          setState(()
          {
            penicillinAllergic = index;
            penicillinAllergic == 1?allergyType = 0:allergyType = null;
            notifyParent();
          });

        },
      ),
      penicillinToggle: PenicillinSlider(
        boxColour: kPaedsDropDownBlue,
        switchColour: kHighlightedToggleYellow,
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
            notifyParent();
          });


        },
      ),


    );
  }
}
