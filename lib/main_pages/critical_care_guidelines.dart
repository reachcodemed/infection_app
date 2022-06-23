import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';
import 'package:infection/end_pages/critical_care/abdominal.dart';
import 'package:infection/end_pages/critical_care/biliary.dart';
import 'package:infection/end_pages/critical_care/cap.dart';
import 'package:infection/end_pages/critical_care/encephalitis.dart';
import 'package:infection/end_pages/critical_care/hap.dart';
import 'package:infection/end_pages/critical_care/long_line.dart';
import 'package:infection/end_pages/critical_care/meningitis.dart';
import 'package:infection/end_pages/critical_care/necrotising_fasciitis.dart';
import 'package:infection/end_pages/critical_care/urinary.dart';
import 'package:infection/end_pages/critical_care/vap.dart';

class CriticalCare extends StatelessWidget {
  CriticalCare({Key? key}) : super(key: key);

  final List<String> criticalCareTileTitles = ['Community Acquired Pneumonia','Hospital Acquired Pneumonia', 'Ventilator Associated Pneumonia', 'Abdominal', 'Biliary', 'Urinary', 'Encephalitis', 'Meningitis', 'Necrotising Fasciitis','Long-Line'];
  final List<Widget> criticalCareTileNavigation= [ICUCAP(),ICUHAP(),ICUVAP(),ICUIntraAbdominalSepsis(),ICUBiliarySepsis(),ICUUrinary(),ICUEncephalitis(),ICUMeningitis(),ICUNecFasc(),ICULongLine()];

  @override
  Widget build(BuildContext context) {
    return SubMenuModule(
      tileTitles: criticalCareTileTitles,
      tileNavigation: criticalCareTileNavigation,
      topBoxColour: kCriticalCareBlue,
      topBoxText: 'Critical Care Guidelines',
    );

  }
}

