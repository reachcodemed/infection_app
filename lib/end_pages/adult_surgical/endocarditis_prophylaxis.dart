import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';

class EndocarditisProphylaxis extends StatefulWidget {
  @override
  _EndocarditisProphylaxisState createState() => _EndocarditisProphylaxisState();
}

class _EndocarditisProphylaxisState extends State<EndocarditisProphylaxis> {

  List<Widget> selectionTitles = [
    TickerTile(title: 'Select and operation'),
    TickerTile(title: 'Dental procedures'),
    TickerTile(title: 'Dermatological procedures'),
    TickerTile(title: 'Gastrointestinal procedures'),
    TickerTile(title: 'Genitourinary procedures'),
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
        notifyParent: notifyParent,
        title: 'Endocarditis Prophylaxis',
        selectionTitles: selectionTitles,
        indexTicker: indexTicker,
        abxSelection: abxSelection);
  }
}
