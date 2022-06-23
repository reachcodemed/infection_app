import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';
import 'package:infection/end_pages/antimicrobials/allergies.dart';
import 'package:infection/end_pages/antimicrobials/antibiotic_spectra.dart';
import 'package:infection/end_pages/antimicrobials/co_administration.dart';
import 'package:infection/end_pages/antimicrobials/duration.dart';
import 'package:infection/end_pages/antimicrobials/information.dart';
import 'package:infection/end_pages/antimicrobials/iv_oral_switch.dart';
import 'package:infection/end_pages/antimicrobials/renal_dosing.dart';
import 'package:infection/end_pages/antimicrobials/will_this_cover.dart';
import 'package:infection/main_pages/opening_page.dart';

class Antimicrobials extends StatelessWidget {
  Antimicrobials({Key? key}) : super(key: key);

  final List<String> antimicrobialTileTitles = [
    'Allergies',
    'Antibiotic Spectra',
    'Antimicrobial Information',
    'Antimicrobial Therapy Duration',
    'Co-Administration Check',
    'IV to PO Switch',
    'Renal Dosing',
    'Will This Antibiotic Cover',];

  final List<Widget> antimicrobialTileNavigation= [
    Allergies(),
    AbxSpectra(),
    AntimicrobialInformation(),
    AntimicrobialDuration(),
    CoAdministrationCheck(),
    IVOralSwitch(),
    RenalDosing(),
    WillThisCover()];


  @override
  Widget build(BuildContext context) {
    return SubMenuModule(
        tileTitles: antimicrobialTileTitles,
        tileNavigation: antimicrobialTileNavigation,
        topBoxColour: kAntimicrobialsRed,
        topBoxText: 'Antimicrobials');
  }
}
