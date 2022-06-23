import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/constants.dart';
import 'package:infection/functions.dart';
import 'package:infection/custom_widgets.dart';





class Endocarditis extends StatefulWidget {
  Endocarditis({Key? key}) : super(key: key);

  @override
  State<Endocarditis> createState() => _EndocarditisState();
}


class _EndocarditisState extends State<Endocarditis> {

  double widgetSpacing = 15;
  int? isProstheticValve = 0;
  int? isMRSA = 0;
  int? isPenicillinAllergic = 0;
  int? allergyType = null;
  List <String> antibioticTextInput =
      [
        """ Native valve: 
 Amoxicillin 2g IV 4 hourly plus 
 Flucloxacillin 2g 4 hourly plus 
 Gentamicin 3mg/kg IV 24 hourly
 Discuss with micro pharmacist if CrCl <20ml/min

48-72h review:  Review regime with blood culture results and discussion with a Consultant Microbiologist

Duration of therapy: should be discussed with a Consultant Microbiologist minimum 2 weeks IV therapy.

BD Gentamicin – it may be appropriate to use Gentamicin 1mg/kg BD upon positive microbiology on consultant Microbiologist advice.
""",
       """ Prosthetic valve:
 Vancomycin IV, modified according to renal function plus
 Gentamicin 3mg/kg IV 24 hourly
 Discuss with micro pharmacist if CrCl <20ml/min
 Rifampicin 600mg PO 12 hourly starting day 3 of therapy

48-72h review:  Review regime with blood culture results and discussion with a Consultant Microbiologist

Duration of therapy: should be discussed with a Consultant Microbiologist minimum 2 weeks IV therapy.

BD Gentamicin – it may be appropriate to use Gentamicin 1mg/kg BD upon positive microbiology on consultant Microbiologist advice.
""",
        """ Vancomycin IV, modified according to renal function plus Gentamicin 3mg/kg IV 24 hourly.
        
Discuss with micro pharmacist if CrCl <20ml/min

48-72h review:  Review regime with blood culture results and discussion with a Consultant Microbiologist

Duration of therapy: should be discussed with a Consultant Microbiologist minimum 2 weeks IV therapy.

BD Gentamicin – it may be appropriate to use Gentamicin 1mg/kg BD upon positive microbiology on consultant Microbiologist advice.
""",
        """ Vancomycin IV, modified according to renal function plus Gentamicin 3mg/kg IV 24 hourly.
        
Discuss with micro pharmacist if CrCl <20ml/min

48-72h review:  Review regime with blood culture results and discussion with a Consultant Microbiologist

Duration of therapy: should be discussed with a Consultant Microbiologist minimum 2 weeks IV therapy.

BD Gentamicin – it may be appropriate to use Gentamicin 1mg/kg BD upon positive microbiology on consultant Microbiologist advice.
""",
        """ Vancomycin IV, modified according to renal function plus Gentamicin 3mg/kg IV 24 hourly.
        
Discuss with micro pharmacist if CrCl <20ml/min

48-72h review:  Review regime with blood culture results and discussion with a Consultant Microbiologist

Duration of therapy: should be discussed with a Consultant Microbiologist minimum 2 weeks IV therapy.

BD Gentamicin – it may be appropriate to use Gentamicin 1mg/kg BD upon positive microbiology on consultant Microbiologist advice.
""",
      ];

  String antibioticTextOutput = "Select Options";


  notifyParent()
  {

    setState(() {
      if(isProstheticValve==0&&isMRSA==0&&isPenicillinAllergic==0)
      {
        antibioticTextOutput = antibioticTextInput[0];
      }
      else if(isProstheticValve == 1)
      {
        antibioticTextOutput = antibioticTextInput[1];
      }
      else if(isProstheticValve == 0 && isMRSA == 1)
      {
        antibioticTextOutput = antibioticTextInput[2];
      }

      else if(isProstheticValve == 0 && isMRSA == 0 && isPenicillinAllergic == 1 && allergyType == 1)
      {
        antibioticTextOutput = antibioticTextInput[3];
      }

      else if (isProstheticValve == 0 && isMRSA == 0 && isPenicillinAllergic == 1 && allergyType == 0)
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
        pageTitle: "Endocarditis",
        toggleBox1: YesNoToggleBasic(
                        title: "1. Prosthetic Heart Valves?",
                        indexPosition: isProstheticValve,

                        onValueChanged: (index)
                        {

                          setState(()
                          {
                            isProstheticValve = index;
                            isProstheticValve==1?isMRSA=null:isMRSA = 0;
                            isProstheticValve==1?isPenicillinAllergic=null:isPenicillinAllergic = 0;
                            isProstheticValve==1?allergyType=null:isProstheticValve = isProstheticValve;
                          });

                          notifyParent();


                        },
                    ),

        toggleBox2: YesNoToggleBasic(
                        title: "2. Known MRSA?",
                        indexPosition: isMRSA,

                        onValueChanged: (index)
                        {

                          setState(()
                          {
                            isMRSA = index;

                            isProstheticValve==1?isMRSA=null:isMRSA = index;

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
                      title: "3. Allergic to Penicillin?",
                      indexPosition: isPenicillinAllergic,

                      onValueChanged: (index)
                      {

                        setState(()
                        {
                          isPenicillinAllergic = index;

                          if(isProstheticValve == 1 || isMRSA == 1)
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
                          if(isProstheticValve == 1)
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
                      },
                      ),

        antibioticTextOutput: antibioticTextOutput);
  }
}




