import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infection/custom_widgets.dart';

class OrthopaedicSurgery extends StatefulWidget {
  const OrthopaedicSurgery({Key? key}) : super(key: key);

  @override
  _OrthopaedicSurgeryState createState() => _OrthopaedicSurgeryState();
}

class _OrthopaedicSurgeryState extends State<OrthopaedicSurgery> {

  List<Widget> selectionTitles = [
    TickerTile(title: 'Select and operation'),
    TickerTile(title: 'Amputation (major trauma)'),
    TickerTile(title: 'Arthroscopy'),
    TickerTile(title: 'First joint replacement'),
    TickerTile(title: 'Neck of femur surgery'),
    TickerTile(title: 'Open/compound fractures'),
    TickerTile(title: 'ORIF closed fractures'),
    TickerTile(title: 'Revision joint replacement'),
    TickerTile(title: 'Spinal surgery'),
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
      title: 'Orthopaedic surgery',
      selectionTitles: selectionTitles,
      indexTicker: indexTicker,
      abxSelection: abxSelection,
      notifyParent: notifyParent,

    );
  }
}
