import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infection/custom_widgets.dart';

class VascularSurgery extends StatefulWidget {
  @override
  _VascularSurgeryState createState() => _VascularSurgeryState();
}

class _VascularSurgeryState extends State<VascularSurgery> {

  List<Widget> selectionTitles = [
    TickerTile(title: 'Select and operation'),
    TickerTile(title: 'Amputation(infected ± diabetic)'),
    TickerTile(title: 'Amputation (ischaemia not infected)'),
    TickerTile(title: 'Amputation (major trauma'),
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
      title: 'Vascular Surgery',
      selectionTitles: selectionTitles,
      indexTicker: indexTicker,
      abxSelection: abxSelection,
      notifyParent: notifyParent,

    );
  }
}
