import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';

class GramStains extends StatefulWidget {
  @override
  _GramStainsState createState() => _GramStainsState();
}

class _GramStainsState extends State<GramStains> {

  List<Widget> selectionTitles = [
    TickerTile(title: 'Select a Gram stain'),
    TickerTile(title: 'Gram negative cocci'),
    TickerTile(title: 'Gram negative cocci'),
    TickerTile(title: 'Gram negative cocco-bacilli'),
    TickerTile(title: 'Gram negative diplococci'),
    TickerTile(title: 'Gram negative bacilli (rods)'),
    TickerTile(title: 'Gram positive cocci (clusters)'),
    TickerTile(title: 'Gram positive cocci (chains)'),
    TickerTile(title: 'Gram positive diplococci'),
    TickerTile(title: 'Gram positive rods'),
    TickerTile(title: 'Yeasts'),
  ];

  int indexTicker = 0;

  List<bool> abxSelection = [true,false,false];

  void notifyParent()
  {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return BloodCulturesEndPage(
        title: "Gram Stain",
        selectionTitles: selectionTitles,
        onSelectedItemChanged: (index)
          {

          },
        notifyParent: notifyParent,

        firstTextArea: const SubBarAndText(
            lowerTitle: "Information",
            outputText: "outputText",
            barColour: kSubTitleDarkerYellow),
    );

  }
}

