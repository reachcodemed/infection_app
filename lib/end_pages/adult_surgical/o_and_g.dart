import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';

class GynaecologyAndObstetrics extends StatefulWidget {
  const GynaecologyAndObstetrics({Key? key}) : super(key: key);

  @override
  _GynaecologyAndObstetricsState createState() => _GynaecologyAndObstetricsState();
}

class _GynaecologyAndObstetricsState extends State<GynaecologyAndObstetrics> {

  List<Widget> selectionTitles = [
    TickerTile(title: 'Select and operation'),
    TickerTile(title: 'Ceasarean section'),
    TickerTile(title: 'ERPC'),
    TickerTile(title: 'Hysterectomy'),
    TickerTile(title: 'Insertion of IUD'),
    TickerTile(title: 'Myomectomy'),
    TickerTile(title: 'Perineal tear (3/4th degree'),
    TickerTile(title: 'Vaginal termination of pregnancy',),
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
      title: 'Gynaecology & Obstetrics',
      selectionTitles: selectionTitles,
      indexTicker: indexTicker,
      abxSelection: abxSelection,
      notifyParent: notifyParent,

    );
  }
}
