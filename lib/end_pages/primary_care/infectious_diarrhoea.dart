import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';

class GPInfectiousDiarrhoea extends StatefulWidget {
  const GPInfectiousDiarrhoea({Key? key}) : super(key: key);

  @override
  _GPInfectiousDiarrhoeaState createState() => _GPInfectiousDiarrhoeaState();
}

class _GPInfectiousDiarrhoeaState extends State<GPInfectiousDiarrhoea> {

  String antibioticTextOutput = """If systemically unwell and Campylobacter suspected (such as undercooked meat and abdominal pain), consider Clarithromycin 250-500mg BD for 5-7 days, if treated early (within 3 days)

If Giardia is suspected or confirmed - Tinidazole 2g single dose is the treatment of choice
""";


  @override
  Widget build(BuildContext context) {
    return ClassicEndPage(
      topPanelColour: kPrimaryCareOrange,
      pageTitle: "Infectious Diarrhoea",
      antibioticTextOutput: antibioticTextOutput,

      topRedBox: TopRedInfoBox(
        boxColour: kPaedsDropDownBlue,
        textInput: 'Refer previously healthy children with acute painful or bloody diarrhoea, to exclude E.coli O157 infection. Antibiotic therapy is not usually indicated unless patient is systemically unwell',
      ),


    );
  }
}
