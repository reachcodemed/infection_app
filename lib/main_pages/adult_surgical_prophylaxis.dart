import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';
import 'package:infection/end_pages/adult_surgical/endocarditis_prophylaxis.dart';
import 'package:infection/end_pages/adult_surgical/endoscopy.dart';
import 'package:infection/end_pages/adult_surgical/general_guidelines.dart';
import 'package:infection/end_pages/adult_surgical/lower_gi_prophylaxis.dart';
import 'package:infection/end_pages/adult_surgical/o_and_g.dart';
import 'package:infection/end_pages/adult_surgical/orthopaedic_surgery.dart';
import 'package:infection/end_pages/adult_surgical/upper_gi_surgery.dart';
import 'package:infection/end_pages/adult_surgical/urology_surgery.dart';
import 'package:infection/end_pages/adult_surgical/vascular_surgery.dart';
import 'opening_page.dart';
import 'package:infection/end_pages/adult_surgical/cardiac.dart';

class SurgicalProphylaxis extends StatelessWidget {

  final List<String> surgicalProphylaxisTileTitles = ['General Guidelines','Cardiac Procedures', 'Endocarditis Prophylaxis', 'Gastrointestinal Endoscopy','Obstetrics & Gynaecology','Lower GI Surgery','Orthopaedic Surgery','Upper GI & Hepatobiliary Surgery', 'Urology', 'Vascular Surgery'];
  final List<Widget> surgicalProphylaxisTileNavigation= [GeneralGuidelines(),CardiacSurgery(),EndocarditisProphylaxis(),GastrointestinalEndoscopy(),GynaecologyAndObstetrics(),LowerGISurgery(),OrthopaedicSurgery(),UpperGISurgery(),UrologySurgery(),VascularSurgery(),];

  SurgicalProphylaxis({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SubMenuModule(
        tileTitles: surgicalProphylaxisTileTitles,
        tileNavigation: surgicalProphylaxisTileNavigation,
        topBoxColour: kSurgicalProphylaxisOrange,
        topBoxText: "Surgical Prophylaxis",
    );
  }
}
