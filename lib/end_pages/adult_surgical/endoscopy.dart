import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infection/custom_widgets.dart';

class GastrointestinalEndoscopy extends StatefulWidget {
  @override
  _GastrointestinalEndoscopyState createState() => _GastrointestinalEndoscopyState();
}

class _GastrointestinalEndoscopyState extends State<GastrointestinalEndoscopy> {

  List<Widget> selectionTitles = [
    TickerTile(title: 'Select and operation'),
    TickerTile(title: 'ERCP'),
    TickerTile(title: 'FNA - solid lesions'),
    TickerTile(title: 'FNA - cystic lesions'),
    TickerTile(title: 'PEG insertion'),
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

