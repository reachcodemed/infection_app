import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infection/custom_widgets.dart';

class UpperGISurgery extends StatefulWidget {
  @override
  _UpperGISurgeryState createState() => _UpperGISurgeryState();
}

class _UpperGISurgeryState extends State<UpperGISurgery> {

  List<Widget> selectionTitles = [
    TickerTile(title: 'Select and operation'),
    TickerTile(title: 'Cholecystectomy (laparoscopic)'),
    TickerTile(title: 'Cholecystectomy (open)'),
    TickerTile(title: 'Gastroduodenal surgery'),
  ];

  int indexTicker = 0;

  int? abxSelection = 0;

  void notifyParent()
  {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return SurgicalProphylaxisEndPage(
      title: 'Gastrointestinal Endoscopy',
      selectionTitles: selectionTitles,
      indexTicker: indexTicker,
      abxSelection: abxSelection,
      notifyParent: notifyParent,

    );
  }
}
