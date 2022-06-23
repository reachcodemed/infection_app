import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';

class OtherAntimicrobials extends StatefulWidget {
  @override
  _OtherAntimicrobialsState createState() => _OtherAntimicrobialsState();
}

class _OtherAntimicrobialsState extends State<OtherAntimicrobials> {

  List<Widget> selectionTitles = [
    TickerTile(title: 'Select an antibiotic'),
    TickerTile(title: 'Chloramphenicol'),
    TickerTile(title: 'Coliston'),
    TickerTile(title: 'Cycloserine'),
    TickerTile(title: 'Daptomycin'),
    TickerTile(title: 'Ethambutol'),
    TickerTile(title: 'Flucytosine'),
    TickerTile(title: 'Ganciclovir'),
    TickerTile(title: 'Isavuconazole'),
    TickerTile(title: 'Itraconazole'),
    TickerTile(title: 'Levofloxacin'),
    TickerTile(title: 'Linezolid'),
    TickerTile(title: 'Moxifloxacin'),
    TickerTile(title: 'Posaconazole'),
    TickerTile(title: 'Rifampicin'),
    TickerTile(title: 'Streptomycin'),
    TickerTile(title: 'Tobramycin (OD)'),
    TickerTile(title: 'Tobramycin (BD/TDS)'),
    TickerTile(title: 'Voriconazole'),
  ];

  int indexTicker1 = 0;

  void notifyParent()
  {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return BloodCulturesEndPage(
      title: "Other Antimicrobials",
      titleBoxColour: kDosingGreen,
      selectionTitles: selectionTitles,
      onSelectedItemChanged: (index)
        {

        },

      notifyParent: notifyParent,

      extraWidget: SizedBox(
        width: double.infinity,
        height: 25,
        child:
        Container(
          alignment: Alignment.centerLeft,
          color: kDosingLightOrange,
          child: const Padding(
            padding: EdgeInsets.fromLTRB(8,0,0,0),
            child: Text('Choose antibiotic',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 15.0,

              ),),
          ),
        ),
      ),


      firstTextArea:
      const SubBarAndText(
          lowerTitle: "Advice",
          outputText: "Hello",
          barColour: kDosingLightOrange),


    );

  }
}
