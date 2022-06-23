import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';

class GPTravellersDiarrhoea extends StatefulWidget {
  const GPTravellersDiarrhoea({Key? key}) : super(key: key);

  @override
  _GPTravellersDiarrhoeaState createState() => _GPTravellersDiarrhoeaState();
}

class _GPTravellersDiarrhoeaState extends State<GPTravellersDiarrhoea> {

  String antibioticTextOutput = """Travellers may become colonized with extended-spectrum β-lactamse (ESBL) producing bacteria, and this risk is increased by exposure to antibiotics whilst abroad. 

Consider standby antimicrobial treatment only for patients at high risk of severe illness, or visiting high risk areas

Standby: Azithromycin 500mg OD

Duration: 1-3 days

Prophylaxis/Treatment: Bismuth Subsalicylate 2 tablets QDS 

Duration: 2 days
""";


  @override
  Widget build(BuildContext context) {
    return ClassicEndPage(
      topPanelColour: kPrimaryCareOrange,
      pageTitle: "Traveller's Diarrhoea",
      antibioticTextOutput: antibioticTextOutput,

      topRedBox: TopRedInfoBox(
        boxColour: kPaedsDropDownBlue,
        textInput: 'Prophylaxis rarely, if ever, indicated. Prophylactic antibiotics should not be recommended for most travellers.',
      ),


    );
  }
}
