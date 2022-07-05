import 'package:flutter/material.dart';
import 'package:infection/custom_widgets.dart';
import 'package:infection/constants.dart';

class RIprocalcitonin extends StatefulWidget {
  @override
  _RIprocalcitoninState createState() => _RIprocalcitoninState();
}

class _RIprocalcitoninState extends State<RIprocalcitonin> {
  String antibioticTextOutput = '';
  String procalcitoninLevel = '';
  double procL = 0.0;
  double minWidth = 80;

  notifyParent() {
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
      pageTitle: 'Procalcitonin',
      antibioticTextOutput: antibioticTextOutput,
      toggleBox1: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            //width: 80,
            child: Text(
              'Level (ng/mL)',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: 80,
                height: 30,
                child: TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (input) {
                    setState(() {
                      procalcitoninLevel = input;
                    });
                  },
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 1,
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              MaterialButton(
                  color: kButtonLightGreen,
                  height: 30,
                  minWidth: 60,
                  onPressed: () {
                    procL = double.parse(procalcitoninLevel);
                    procOutput(procL);
                  },
                  elevation: 0,
                  highlightElevation: 1.5,
                  child: const Text('Interpret',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ))),
            ],
          ),
        ],
      ),
    );
  }

  void procOutput(double level) {
    //level = Double(levelTF.text!) ?? 0.0
    setState(() {
      if (level <= 0.25) {
        antibioticTextOutput =
            "Unlikely bacterial infection, antibiotic therapy not indicated\n\nIf the patient is already on antibiotic therapy, advise stopping it";
      } else if (level > 0.25 && level <= 0.5) {
        antibioticTextOutput =
            "Low likelihood of bacterial infection, consider the need for antibiotic therapy. Correlate with clinical findings";
      } else {
        antibioticTextOutput =
            "Likely bacterial infection, consider antibiotic therapy\n\nSituations where the PCT elevation may be due to a non-bacterial cause:\n\n• Newborns (<48-72 hours; after 72 interpret levels as usual)\n\n• Massive stress (severe trauma, surgery, cardiac shock, burns) In absence of infection PCT levels trend down after inciting event\n\n• Treatment with agents which stimulate cytokines (OKT3, anti-lymphocyte globulins, alemtuzumab, IL-2, granulocyte transfusion)\n\n• Malaria and some fungal infections\n\n• Prolonged, severe cardiogenic shock or organ perfusion abnormalities\n\n• Some forms of vasculitis and acute graft vs. host disease\n\n• Paraneoplastic syndromes due to medullary thyroid and small cell lung cancer\n\n• Significantly compromised renal function, especially ESRD/hemodialysis";
      }
    });
  }
}
