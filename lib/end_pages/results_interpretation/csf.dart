import 'package:flutter/material.dart';
import 'package:infection/custom_widgets.dart';
import 'package:infection/constants.dart';

class RIcsf extends StatefulWidget {
  @override
  _RIcsfState createState() => _RIcsfState();
}

class _RIcsfState extends State<RIcsf> {
  String antibioticTextOutput = '';
  int? isAbxBeforeLP = 0;
  int? isWCCRaised = 0;
  int? differential = 0;
  int? protein = 0;
  int? glucose = 0;
  double minWidth = 60;
  bool tb3isActive = true;

  notifyParent() {
    csfOutput();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notifyParent();
  }

  @override
  Widget build(BuildContext context) {
    return ResultsInterpretationEndPage(
      pageTitle: 'Cerebrospinal Fluid (CSF)',
      antibioticTextOutput: antibioticTextOutput,
      toggleBox1: CustomTextDoubleSwitch(
          title: 'Antibiotics given before LP',
          indexPosition: isAbxBeforeLP,
          onValueChanged: (index) {
            setState(() {
              isAbxBeforeLP = index;
              csfOutput();
            });
          },
          minWidth: minWidth,
          switchColour: kHighlightedToggleYellow,
          firstText: 'No',
          secondText: 'Yes'),
      toggleBox2: CustomTextDoubleSwitch(
          title: 'White Cell Count',
          indexPosition: isWCCRaised,
          onValueChanged: (index) {
            setState(() {
              isWCCRaised = index;
              csfOutput();
            });
          },
          switchColour: kHighlightedToggleYellow,
          minWidth: minWidth,
          firstText: '<5',
          secondText: '5-1000+'),
      toggleBox3: CustomTextDoubleSwitch(
          title: 'Differential',
          indexPosition: differential,
          onValueChanged: (index) {
            setState(() {
              differential = index;
              tb3isActive;
              csfOutput();
            });
          },
          switchColour: kHighlightedToggleYellow,
          minWidth: (minWidth * 1.65),
          firstText: 'Neutrophils',
          secondText: 'Lymphocytes'),
      toggleBox4: ToggleSwitchTriple(
        title: 'Protein',
        indexPosition: protein,
        minWidth: minWidth,
        switchColour: kHighlightedToggleYellow,
        onValueChanged: (index) {
          setState(() {
            protein = index;
            csfOutput();
          });
        },
        buttonSpecificFontSize2: 22,
        buttonSpecificFontSize3: 22,
        firstText: 'Normal',
        secondText: '↑',
        thirdText: '↑↑',
      ),
      toggleBox5: ToggleSwitchTriple(
        title: 'Glucose',
        indexPosition: glucose,
        switchColour: kHighlightedToggleYellow,
        minWidth: minWidth,
        onValueChanged: (index) {
          setState(() {
            glucose = index;
            print('Glucose = $glucose');
            csfOutput();
          });
        },
        buttonSpecificFontSize1: 22,
        buttonSpecificFontSize2: 22,
        firstText: '↓↓',
        secondText: '↓',
        thirdText: '2.6 - 4.5',
      ),
    );
  }

  void csfOutput() {
    setState(() {
      if (isWCCRaised == 0) // WBC LESS THAN 5
      {
        tb3isActive = false;

        if (protein == 0) // PROTEIN NORMAL
        {
          if (glucose == 0) // GLUCOSE VERY LOW
          {
            if (isAbxBeforeLP == 0) // NO ANTIBIOTICS BEFORE LP
            {
              antibioticTextOutput =
                  "Note very low CSF glucose. In the context of the normal white cell count and normal protein, consider non-infective pathologies";
            } else // ANTIBIOTICS BEFORE LP
            {
              antibioticTextOutput =
                  "Important to consider the effect that antibiotic therapy will have on the white cell count.\n\nConsider the possibility of a bacterial meningitis – send EDTA blood for Neisseria and Pneumococcal PCR. Clinical correlation advised";
            }
          } else if (glucose == 1) // GLUCOSE LOW
          {
            if (isAbxBeforeLP == 0) // NO ANTIBIOTICS BEFORE LP
            {
              antibioticTextOutput =
                  "Note very low CSF glucose. In the context of the normal white cell count and normal protein, consider non-infective pathologies";
            } else // ANTIBIOTICS BEFORE LP
            {
              antibioticTextOutput =
                  "Important to consider the effect that antibiotic therapy will have on the white cell count.\n\nConsider the possibility of a bacterial meningitis – send EDTA blood for Neisseria and Pneumococcal PCR. Clinical correlation advised\n\nThis result could also be consistent with a viral meningitis.\n\nConsider starting the patient on Aciclovir if they are not already and request a viral PCR on the CSF";
            }
          } else if (glucose == 2) // GLUCOSE NORMAL
          {
            if (isAbxBeforeLP == 0) // NO ANTIBIOTICS BEFORE LP
            {
              antibioticTextOutput = "Negative CSF result";
            } else // ANTIBIOTICS BEFORE LP
            {
              antibioticTextOutput =
                  "Important to consider the effect that antibiotic therapy will have on the white cell count.\n\nConsider the possibility of a bacterial meningitis – send EDTA blood for Neisseria and Pneumococcal PCR. Clinical correlation advised\n\nThis result could also be consistent with a viral meningitis.\n\nConsider starting the patient on Aciclovir if they are not already and request a viral PCR on the CSF";
            }
          }
        } else if (protein == 1) // PROTEIN +
        {
          if (glucose == 0) // GLUCOSE VERY LOW
          {
            if (isAbxBeforeLP == 0) // NO ANTIBIOTICS BEFORE LP
            {
              antibioticTextOutput =
                  "This result could be consistent with TB Meningitis. Request TB PCR and TB microscopy and culture on the CSF. Correlate results with clinical findings and ensure patient is placed in a negative-pressure side room if there are any respiratory concerns around TB\n\nThis result could also be consistent with a viral meningitis. Consider starting the patient on Aciclovir if they are not already and request a viral PCR on the CSF";
            } else // ANTIBIOTICS BEFORE LP
            {
              antibioticTextOutput =
                  "This result could be consistent with TB Meningitis. Request TB PCR and TB microscopy and culture on the CSF. Correlate results with clinical findings and ensure patient is placed in a negative-pressure side room if there are any respiratory concerns around TB\n\nImportant to consider the effect that antibiotic therapy will have on the white cell count. Consider the possibility of a bacterial meningitis – send EDTA blood for Neisseria and Pneumococcal PCR. Clinical correlation advised";
            }
          } else if (glucose == 1) // GLUCOSE LOW
          {
            if (isAbxBeforeLP == 0) // NO ANTIBIOTICS BEFORE LP
            {
              antibioticTextOutput =
                  "This result could be consistent with TB Meningitis. Request TB PCR and TB microscopy and culture on the CSF. Correlate results with clinical findings and ensure patient is placed in a negative-pressure side room if there are any respiratory concerns around TB\n\nThis result could also be consistent with a viral meningitis. Consider starting the patient on Aciclovir if they are not already and request a viral PCR on the CSF";
            } else // ANTIBIOTICS BEFORE LP
            {
              antibioticTextOutput =
                  "This result could be consistent with TB Meningitis. Request TB PCR and TB microscopy and culture on the CSF. Correlate results with clinical findings and ensure patient is placed in a negative-pressure side room if there are any respiratory concerns around TB\n\nImportant to consider the effect that antibiotic therapy will have on the white cell count. Consider the possibility of a bacterial meningitis – send EDTA blood for Neisseria and Pneumococcal PCR. Clinical correlation advised";
            }
          } else if (glucose == 2) // GLUCOSE NORMAL
          {
            if (isAbxBeforeLP == 0) // NO ANTIBIOTICS BEFORE LP
            {
              antibioticTextOutput =
                  "This result could be consistent with a viral meningitis. Consider starting the patient on Aciclovir if they are not already and request a viral PCR on the CSF";
            } else // ANTIBIOTICS BEFORE LP
            {
              antibioticTextOutput =
                  "Important to consider the effect that antibiotic therapy will have on the white cell count. Consider the possibility of a bacterial meningitis – send EDTA blood for Neisseria and Pneumococcal PCR. Clinical correlation advised";
            }
          }
        } else if (protein == 2) // PROTEIN ++
        {
          if (glucose == 0) // GLUCOSE VERY LOW
          {
            if (isAbxBeforeLP == 0) // NO ANTIBIOTICS BEFORE LP
            {
              antibioticTextOutput =
                  "This result could be consistent with TB Meningitis. Request TB PCR and TB microscopy and culture on the CSF. Correlate results with clinical findings and ensure patient is placed in a negative-pressure side room if there are any respiratory concerns around TB";
            } else // ANTIBIOTICS BEFORE LP
            {
              antibioticTextOutput =
                  "This result could be consistent with TB Meningitis. Request TB PCR and TB microscopy and culture on the CSF. Correlate results with clinical findings and ensure patient is placed in a negative-pressure side room if there are any respiratory concerns around TB\n\nImportant to consider the effect that antibiotic therapy will have on the white cell count. Consider the possibility of a bacterial meningitis – send EDTA blood for Neisseria and Pneumococcal PCR. Clinical correlation advised";
            }
          } else if (glucose == 1) // GLUCOSE LOW
          {
            if (isAbxBeforeLP == 0) // NO ANTIBIOTICS BEFORE LP
            {
              antibioticTextOutput =
                  "This result could be consistent with TB Meningitis. Request TB PCR and TB microscopy and culture on the CSF. Correlate results with clinical findings and ensure patient is placed in a negative-pressure side room if there are any respiratory concerns around TB";
            } else // ANTIBIOTICS BEFORE LP
            {
              antibioticTextOutput =
                  "This result could be consistent with TB Meningitis. Request TB PCR and TB microscopy and culture on the CSF. Correlate results with clinical findings and ensure patient is placed in a negative-pressure side room if there are any respiratory concerns around TB\n\nImportant to consider the effect that antibiotic therapy will have on the white cell count. Consider the possibility of a bacterial meningitis – send EDTA blood for Neisseria and Pneumococcal PCR. Clinical correlation advised";
            }
          } else if (glucose == 2) // GLUCOSE NORMAL
          {
            if (isAbxBeforeLP == 0) // NO ANTIBIOTICS BEFORE LP
            {
              antibioticTextOutput =
                  "This result could be consistent with a viral meningitis. Consider starting the patient on Aciclovir if they are not already and request a viral PCR on the CSF";
            } else // ANTIBIOTICS BEFORE LP
            {
              antibioticTextOutput =
                  "Important to consider the effect that antibiotic therapy will have on the white cell count. Consider the possibility of a bacterial meningitis – send EDTA blood for Neisseria and Pneumococcal PCR. Clinical correlation advised";
            }
          }
        }
      } else if (isWCCRaised == 1) // WBC 5-1000+
      {
        tb3isActive = true;

        if (differential == 0) // DIFFERENTIAL NEUTROPHILS
        {
          if (protein == 0) // PROTEIN NORMAL
          {
            if (glucose == 0) // GLUCOSE VERY LOW
            {
              if (isAbxBeforeLP == 0) // NO ANTIBIOTICS BEFORE LP
              {
                antibioticTextOutput =
                    "This result is likely to be consistent with bacterial meningitis. Ensure that the patient is on Ceftriaxone 2g BD. Ensure that blood cultures have been sent, EDTA blood sent for Neisseria and Pneumococcal PCR and that the patient is in a side room";
              } else // ANTIBIOTICS BEFORE LP
              {
                antibioticTextOutput =
                    "This result is likely to be consistent with bacterial meningitis. Ensure that the patient is on Ceftriaxone 2g BD. Ensure that blood cultures have been sent, EDTA blood sent for Neisseria and Pneumococcal PCR and that the patient is in a side room";
              }
            } else if (glucose == 1) // GLUCOSE LOW
            {
              if (isAbxBeforeLP == 0) // NO ANTIBIOTICS BEFORE LP
              {
                antibioticTextOutput =
                    "This result is likely to be consistent with bacterial meningitis. Ensure that the patient is on Ceftriaxone 2g BD. Ensure that blood cultures have been sent, EDTA blood sent for Neisseria and Pneumococcal PCR and that the patient is in a side room";
              } else // ANTIBIOTICS BEFORE LP
              {
                antibioticTextOutput =
                    "This result is likely to be consistent with bacterial meningitis. Ensure that the patient is on Ceftriaxone 2g BD. Ensure that blood cultures have been sent, EDTA blood sent for Neisseria and Pneumococcal PCR and that the patient is in a side room";
              }
            } else if (glucose == 2) // GLUCOSE NORMAL
            {
              if (isAbxBeforeLP == 0) // NO ANTIBIOTICS BEFORE LP
              {
                antibioticTextOutput =
                    "This result does not fit with an established infective pathology, however, clinical correlation is advised";
              } else // ANTIBIOTICS BEFORE LP
              {
                antibioticTextOutput =
                    "This result is likely to be consistent with bacterial meningitis. Ensure that the patient is on Ceftriaxone 2g BD. Ensure that blood cultures have been sent, EDTA blood sent for Neisseria and Pneumococcal PCR and that the patient is in a side room";
              }
            }
          } else if (protein == 1) // PROTEIN +
          {
            if (glucose == 0) // GLUCOSE VERY LOW
            {
              if (isAbxBeforeLP == 0) // NO ANTIBIOTICS BEFORE LP
              {
                antibioticTextOutput =
                    "This result could be consistent with a Bacterial Meningitis. Ensure that the patient is on Ceftriaxone 2g BD. Ensure that blood cultures have been sent, EDTA blood sent for Neisseria and Pneumococcal PCR and that the patient is in a side room";
              } else // ANTIBIOTICS BEFORE LP
              {
                antibioticTextOutput =
                    "This result could be consistent with a Bacterial Meningitis. Ensure that the patient is on Ceftriaxone 2g BD. Ensure that blood cultures have been sent, EDTA blood sent for Neisseria and Pneumococcal PCR and that the patient is in a side room";
              }
            } else if (glucose == 1) // GLUCOSE LOW
            {
              if (isAbxBeforeLP == 0) // NO ANTIBIOTICS BEFORE LP
              {
                antibioticTextOutput =
                    "This result could be consistent with a Bacterial Meningitis. Ensure that the patient is on Ceftriaxone 2g BD. Ensure that blood cultures have been sent, EDTA blood sent for Neisseria and Pneumococcal PCR and that the patient is in a side room";
              } else // ANTIBIOTICS BEFORE LP
              {
                antibioticTextOutput =
                    "This result is likely to be consistent with bacterial meningitis. Ensure that the patient is on Ceftriaxone 2g BD. Ensure that blood cultures have been sent, EDTA blood sent for Neisseria and Pneumococcal PCR and that the patient is in a side room";
              }
            } else if (glucose == 2) // GLUCOSE NORMAL
            {
              if (isAbxBeforeLP == 0) // NO ANTIBIOTICS BEFORE LP
              {
                antibioticTextOutput =
                    "This result could be consistent with a Bacterial Meningitis. Ensure that the patient is on Ceftriaxone 2g BD. Ensure that blood cultures have been sent, EDTA blood sent for Neisseria and Pneumococcal PCR and that the patient is in a side room";
              } else // ANTIBIOTICS BEFORE LP
              {
                antibioticTextOutput =
                    "This result is likely to be consistent with bacterial meningitis. Ensure that the patient is on Ceftriaxone 2g BD. Ensure that blood cultures have been sent, EDTA blood sent for Neisseria and Pneumococcal PCR and that the patient is in a side room";
              }
            }
          } else if (protein == 2) // PROTEIN ++
          {
            if (glucose == 0) // GLUCOSE VERY LOW
            {
              if (isAbxBeforeLP == 0) // NO ANTIBIOTICS BEFORE LP
              {
                antibioticTextOutput =
                    "This result could be consistent with a Bacterial Meningitis. Ensure that the patient is on Ceftriaxone 2g BD. Ensure that blood cultures have been sent, EDTA blood sent for Neisseria and Pneumococcal PCR and that the patient is in a sideroom";
              } else // ANTIBIOTICS BEFORE LP
              {
                antibioticTextOutput =
                    "This result is likely to be consistent with bacterial meningitis. Ensure that the patient is on Ceftriaxone 2g BD. Ensure that blood cultures have been sent, EDTA blood sent for Neisseria and Pneumococcal PCR and that the patient is in a sideroom";
              }
            } else if (glucose == 1) // GLUCOSE LOW
            {
              if (isAbxBeforeLP == 0) // NO ANTIBIOTICS BEFORE LP
              {
                antibioticTextOutput =
                    "This result could be consistent with a Bacterial Meningitis. Ensure that the patient is on Ceftriaxone 2g BD. Ensure that blood cultures have been sent, EDTA blood sent for Neisseria and Pneumococcal PCR and that the patient is in a sideroom";
              } else // ANTIBIOTICS BEFORE LP
              {
                antibioticTextOutput =
                    "This result is likely to be consistent with bacterial meningitis. Ensure that the patient is on Ceftriaxone 2g BD. Ensure that blood cultures have been sent, EDTA blood sent for Neisseria and Pneumococcal PCR and that the patient is in a sideroom";
              }
            } else if (glucose == 2) // GLUCOSE NORMAL
            {
              if (isAbxBeforeLP == 0) // NO ANTIBIOTICS BEFORE LP
              {
                antibioticTextOutput =
                    "This result could be consistent with a Bacterial Meningitis. Ensure that the patient is on Ceftriaxone 2g BD. Ensure that blood cultures have been sent, EDTA blood sent for Neisseria and Pneumococcal PCR and that the patient is in a sideroom";
              } else // ANTIBIOTICS BEFORE LP
              {
                antibioticTextOutput =
                    "This result is likely to be consistent with bacterial meningitis. Ensure that the patient is on Ceftriaxone 2g BD. Ensure that blood cultures have been sent, EDTA blood sent for Neisseria and Pneumococcal PCR and that the patient is in a sideroom";
              }
            }
          }
        } else if (differential == 1) // DIFFERENTIAL LYMPHOCYTES
        {
          if (protein == 0) // PROTEIN NORMAL
          {
            if (glucose == 0) // GLUCOSE VERY LOW
            {
              if (isAbxBeforeLP == 0) // NO ANTIBIOTICS BEFORE LP
              {
                antibioticTextOutput =
                    "This result could be consistent with a fungal infection. Ensure that the patient has an HIV test. Send serum for Cryptococcal antigen and ask the laboratory to undertake Cryptococcal antigen testing on the CSF. If there is clinical correlation, discuss this case with the on-call Consultant Microbiologist";
              } else // ANTIBIOTICS BEFORE LP
              {
                antibioticTextOutput =
                    "This result could be consistent with a fungal infection. Ensure that the patient has an HIV test. Send serum for Cryptococcal antigen and ask the laboratory to undertake Cryptococcal antigen testing on the CSF. If there is clinical correlation, discuss this case with the on-call Consultant Microbiologist\n\nThis result could also be consistent with a viral meningitis. Consider starting the patient on Aciclovir if they are not already and request a viral PCR on the CSF";
              }
            } else if (glucose == 1) // GLUCOSE LOW
            {
              if (isAbxBeforeLP == 0) // NO ANTIBIOTICS BEFORE LP
              {
                antibioticTextOutput =
                    "This result could be consistent with a fungal infection. Ensure that the patient has an HIV test. Send serum for Cryptococcal antigen and ask the laboratory to undertake Cryptococcal antigen testing on the CSF. If there is clinical correlation, discuss this case with the on-call Consultant Microbiologist";
              } else // ANTIBIOTICS BEFORE LP
              {
                antibioticTextOutput =
                    "This result could be consistent with a fungal infection. Ensure that the patient has an HIV test. Send serum for Cryptococcal antigen and ask the laboratory to undertake Cryptococcal antigen testing on the CSF. If there is clinical correlation, discuss this case with the on-call Consultant Microbiologist\n\nThis result could also be consistent with a viral meningitis. Consider starting the patient on Aciclovir if they are not already and request a viral PCR on the CSF";
              }
            } else if (glucose == 2) // GLUCOSE NORMAL
            {
              if (isAbxBeforeLP == 0) // NO ANTIBIOTICS BEFORE LP
              {
                antibioticTextOutput =
                    "This result could be consistent with a fungal infection. Ensure that the patient has an HIV test.\n\nSend serum for Cryptococcal antigen and ask the laboratory to undertake Cryptococcal antigen testing on the CSF.\n\nIf there is clinical correlation, discuss this case with the on-call Consultant Microbiologist\n\nThis result could also be consistent with a viral meningitis. Consider starting the patient on Aciclovir if they are not already and request a viral PCR on the CSF";
              } else // ANTIBIOTICS BEFORE LP
              {
                antibioticTextOutput =
                    "This result could be consistent with a fungal infection. Ensure that the patient has an HIV test. Send serum for Cryptococcal antigen and ask the laboratory to undertake Cryptococcal antigen testing on the CSF. If there is clinical correlation, discuss this case with the on-call Consultant Microbiologist\n\nThis result could also be consistent with a viral meningitis. Consider starting the patient on Aciclovir if they are not already and request a viral PCR on the CSF";
              }
            }
          } else if (protein == 1) // PROTEIN +
          {
            if (glucose == 0) // GLUCOSE VERY LOW
            {
              if (isAbxBeforeLP == 0) // NO ANTIBIOTICS BEFORE LP
              {
                antibioticTextOutput =
                    "This result could also be consistent with TB Meningitis. Request TB PCR and TB microscopy and culture on the CSF. Correlate results with clinical findings and ensure patient is placed in a negative-pressure sideroom if there are any respiratory concerns around TB";
              } else // ANTIBIOTICS BEFORE LP
              {
                antibioticTextOutput =
                    "This result could be consistent with TB Meningitis. Request TB PCR and TB microscopy and culture on the CSF. Correlate results with clinical findings and ensure patient is placed in a negative-pressure side room if there are any respiratory concerns around TB\n\nImportant to consider the effect that antibiotic therapy will have on the differential. Consider the possibility of a bacterial meningitis – send EDTA blood for Neisseria and Pneumococcal PCR. Clinical correlation advised";
              }
            } else if (glucose == 1) // GLUCOSE LOW
            {
              if (isAbxBeforeLP == 0) // NO ANTIBIOTICS BEFORE LP
              {
                antibioticTextOutput =
                    "This result could be consistent with a fungal infection. Ensure that the patient has an HIV test.\n\nSend serum for Cryptococcal antigen and ask the laboratory to undertake Cryptococcal antigen testing on the CSF.\n\nIf there is clinical correlation, discuss this case with the on-call Consultant Microbiologist\n\nThis result could also be consistent with a viral meningitis. Consider starting the patient on Aciclovir if they are not already and request a viral PCR on the CSF\n\nThis result could also be consistent with TB Meningitis. Request TB PCR and TB microscopy and culture on the CSF.\n\nCorrelate results with clinical findings and ensure patient is placed in a negative-pressure side room if there are any respiratory concerns around TB";
              } else // ANTIBIOTICS BEFORE LP
              {
                antibioticTextOutput =
                    "This result could be consistent with a fungal infection. Ensure that the patient has an HIV test. Send serum for Cryptococcal antigen and ask the laboratory to undertake Cryptococcal antigen testing on the CSF. If there is clinical correlation, discuss this case with the on-call Consultant Microbiologist\n\nThis result could also be consistent with a viral meningitis. Consider starting the patient on Aciclovir if they are not already and request a viral PCR on the CSF\n\nImportant to consider the effect that antibiotic therapy will have on the differential. Consider the possibility of a bacterial meningitis – send EDTA blood for Neisseria and Pneumococcal PCR. Clinical correlation advised";
              }
            } else if (glucose == 2) // GLUCOSE NORMAL
            {
              if (isAbxBeforeLP == 0) // NO ANTIBIOTICS BEFORE LP
              {
                antibioticTextOutput =
                    "This result could be consistent with a fungal infection. Ensure that the patient has an HIV test.\n\nSend serum for Cryptococcal antigen and ask the laboratory to undertake Cryptococcal antigen testing on the CSF.\n\nIf there is clinical correlation, discuss this case with the on-call Consultant Microbiologist\n\nThis result could also be consistent with a viral meningitis. Consider starting the patient on Aciclovir if they are not already and request a viral PCR on the CSF\n\nThis result could also be consistent with TB Meningitis. Request TB PCR and TB microscopy and culture on the CSF.\n\nCorrelate results with clinical findings and ensure patient is placed in a negative-pressure side room if there are any respiratory concerns around TB";
              } else // ANTIBIOTICS BEFORE LP
              {
                antibioticTextOutput =
                    "This result could be consistent with a fungal infection. Ensure that the patient has an HIV test. Send serum for Cryptococcal antigen and ask the laboratory to undertake Cryptococcal antigen testing on the CSF. If there is clinical correlation, discuss this case with the on-call Consultant Microbiologist\n\nThis result could also be consistent with a viral meningitis. Consider starting the patient on Aciclovir if they are not already and request a viral PCR on the CSF\n\nImportant to consider the effect that antibiotic therapy will have on the differential. Consider the possibility of a bacterial meningitis – send EDTA blood for Neisseria and Pneumococcal PCR. Clinical correlation advised";
              }
            }
          } else if (protein == 2) // PROTEIN ++
          {
            if (glucose == 0) // GLUCOSE VERY LOW
            {
              if (isAbxBeforeLP == 0) // NO ANTIBIOTICS BEFORE LP
              {
                antibioticTextOutput =
                    "This result could also be consistent with TB Meningitis. Request TB PCR and TB microscopy and culture on the CSF. Correlate results with clinical findings and ensure patient is placed in a negative-pressure side room if there are any respiratory concerns around TB\n\nThis result could also be consistent with a viral meningitis. Consider starting the patient on Aciclovir if they are not already and request a viral PCR on the CSF";
              } else // ANTIBIOTICS BEFORE LP
              {
                antibioticTextOutput =
                    "This result could be consistent with TB Meningitis. Request TB PCR and TB microscopy and culture on the CSF. Correlate results with clinical findings and ensure patient is placed in a negative-pressure side room if there are any respiratory concerns around TB\n\nImportant to consider the effect that antibiotic therapy will have on the differential. Consider the possibility of a bacterial meningitis – send EDTA blood for Neisseria and Pneumococcal PCR. Clinical correlation advised";
              }
            } else if (glucose == 1) // GLUCOSE LOW
            {
              if (isAbxBeforeLP == 0) // NO ANTIBIOTICS BEFORE LP
              {
                antibioticTextOutput =
                    "This result could also be consistent with TB Meningitis. Request TB PCR and TB microscopy and culture on the CSF. Correlate results with clinical findings and ensure patient is placed in a negative-pressure side room if there are any respiratory concerns around TB\n\nThis result could also be consistent with a viral meningitis. Consider starting the patient on Aciclovir if they are not already and request a viral PCR on the CSF";
              } else // ANTIBIOTICS BEFORE LP
              {
                antibioticTextOutput =
                    "This result could be consistent with TB Meningitis. Request TB PCR and TB microscopy and culture on the CSF. Correlate results with clinical findings and ensure patient is placed in a negative-pressure side room if there are any respiratory concerns around TB\n\nImportant to consider the effect that antibiotic therapy will have on the differential. Consider the possibility of a bacterial meningitis – send EDTA blood for Neisseria and Pneumococcal PCR. Clinical correlation advised";
              }
            } else if (glucose == 2) // GLUCOSE NORMAL
            {
              if (isAbxBeforeLP == 0) // NO ANTIBIOTICS BEFORE LP
              {
                antibioticTextOutput =
                    "This result could also be consistent with a viral meningitis. Consider starting the patient on Aciclovir if they are not already and request a viral PCR on the CSF";
              } else // ANTIBIOTICS BEFORE LP
              {
                antibioticTextOutput =
                    "This result could be consistent with TB Meningitis. Request TB PCR and TB microscopy and culture on the CSF. Correlate results with clinical findings and ensure patient is placed in a negative-pressure side room if there are any respiratory concerns around TB\n\nThis result could also be consistent with a viral meningitis. Consider starting the patient on Aciclovir if they are not already and request a viral PCR on the CSF\n\nImportant to consider the effect that antibiotic therapy will have on the differential. Consider the possibility of a bacterial meningitis – send EDTA blood for Neisseria and Pneumococcal PCR. Clinical correlation advised";
              }
            }
          }
        }
      }
      print("These positions are:");
      print('abx = $isAbxBeforeLP');
      print('wbc = $isWCCRaised');
      print('differential = $differential');
      print('protein = $protein');
      print('glucose = $glucose');
      print("");
    });
  }
}
