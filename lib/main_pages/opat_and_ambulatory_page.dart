import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';
import 'opening_page.dart';

class Opat extends StatelessWidget {
  Opat({Key? key}) : super(key: key);

  final List<String> opatTileTitles = ['Ambulatory Pathways', 'OPAT Pathway','OPAT Referral Checker'];
  final List<Widget> opatTileNavigation= [OpeningPage(),OpeningPage(),OpeningPage(),];

  @override
  Widget build(BuildContext context) {
    return SubMenuModule(
      tileTitles: opatTileTitles,
      tileNavigation: opatTileNavigation,
      topBoxColour: kOpatPurple,
      topBoxText: 'OPAT & Ambulatory',
    );

  }
}