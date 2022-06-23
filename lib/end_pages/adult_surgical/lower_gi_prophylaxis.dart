import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infection/custom_widgets.dart';

class LowerGISurgery extends StatefulWidget {
  const LowerGISurgery({Key? key}) : super(key: key);

  @override
  _LowerGISurgeryState createState() => _LowerGISurgeryState();
}

class _LowerGISurgeryState extends State<LowerGISurgery> {

  List<Widget> selectionTitles = [
    TickerTile(title: 'Select and operation'),
    TickerTile(title: 'Appendicectomy'),
    TickerTile(title: 'Colorectal (uncomplicated)'),
    TickerTile(title: 'Hernia repair (laparoscopic)'),
    TickerTile(title: 'Hernia repair (open)'),
    TickerTile(title: 'Perforation/faecal peritonitis'),
    TickerTile(title: 'Resections in IBD'),
    TickerTile(title: 'Small bowel (uncomplicated)'),
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
      title: 'Lower GI Surgery',
      selectionTitles: selectionTitles,
      indexTicker: indexTicker,
      abxSelection: abxSelection,
      notifyParent: notifyParent,

    );
  }
}
