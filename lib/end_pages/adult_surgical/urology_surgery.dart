import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infection/custom_widgets.dart';

class UrologySurgery extends StatefulWidget {
  @override
  _UrologySurgeryState createState() => _UrologySurgeryState();
}

class _UrologySurgeryState extends State<UrologySurgery> {

  List<Widget> selectionTitles = [
    TickerTile(title: 'Select and operation'),
    TickerTile(title: 'Catheterisation (short-term)'),
    TickerTile(title: 'Catheterisation (long-term)'),
    TickerTile(title: 'Clean contaminated (use bowel)'),
    TickerTile(title: 'Cystoscopy (complicated)'),
    TickerTile(title: 'Cystoscopy (uncomplicated)'),
    TickerTile(title: 'ESWL'),
    TickerTile(title: 'Nephrectomy'),
    TickerTile(title: 'Nephrostomy'),
    TickerTile(title: 'Prostatectomy'),
    TickerTile(title: 'Radical cystectomy'),
    TickerTile(title: 'Total cystectomy'),
    TickerTile(title: 'TRUS biopsy'),
    TickerTile(title: 'TURBT'),
    TickerTile(title: 'TURP'),
    TickerTile(title: 'Ureteroscopy'),
    TickerTile(title: 'Urethroplasty'),
    TickerTile(title: 'Urethrotomy'),

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
      title: 'Urology Surgery',
      selectionTitles: selectionTitles,
      indexTicker: indexTicker,
      abxSelection: abxSelection,
      notifyParent: notifyParent,

    );
  }
}
