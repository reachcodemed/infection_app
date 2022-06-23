import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';
import 'package:infection/end_pages/results_interpretation/cmv.dart';
import 'package:infection/end_pages/results_interpretation/csf.dart';
import 'package:infection/end_pages/results_interpretation/ebv.dart';
import 'package:infection/end_pages/results_interpretation/gram_stains.dart';
import 'package:infection/end_pages/results_interpretation/hepatitis_a.dart';
import 'package:infection/end_pages/results_interpretation/hepatitis_b.dart';
import 'package:infection/end_pages/results_interpretation/hepatitis_c.dart';
import 'package:infection/end_pages/results_interpretation/measles.dart';
import 'package:infection/end_pages/results_interpretation/mumps.dart';
import 'package:infection/end_pages/results_interpretation/mycoplasma.dart';
import 'package:infection/end_pages/results_interpretation/organisms.dart';
import 'package:infection/end_pages/results_interpretation/parvovirus.dart';
import 'package:infection/end_pages/results_interpretation/procalcitonin.dart';
import 'package:infection/end_pages/results_interpretation/rubella.dart';
import 'package:infection/end_pages/results_interpretation/syphilis.dart';


class ResultsInterpretation extends StatelessWidget {
  ResultsInterpretation({Key? key}) : super(key: key);

  final List<String> resultsInterpretationTileTitles = ['Blood Culture Gram Stains','Blood Culture Organisms','Cerebrospinal Fluid (CSF)', 'Cytomegalovirus (CMV)','Epstein Barr Virus (EBV)','Hepatitis A','Hepatitis B','Hepatitis C','Measles','Mumps','Mycoplasma','Parvovirus','Procalcitonin','Rubella','Syphllis',];
  final List<Widget> resultsInterpretationNavigation= [
    GramStains(),
    Organisms(),
    RIcsf(),
    RIcmv(),
    RIebv(),
    RIhepA(),
    RIhepB(),
    RIhepC(),
    RImeasles(),
    RImumps(),
    RImycoplasma(),
    RIparvovirus(),
    RIprocalcitonin(),
    RIrubella(),
    RIsyphilis(),
  ];


  @override
  Widget build(BuildContext context) {
    return SubMenuModule(
        tileTitles: resultsInterpretationTileTitles,
        tileNavigation: resultsInterpretationNavigation,
        topBoxColour: kResultsInterpretationPink,
        topBoxText: 'Results Interpretation');
  }
}


