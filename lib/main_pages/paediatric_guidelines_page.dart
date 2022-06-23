import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';
import 'package:infection/end_pages/paediatrics/bites.dart';
import 'package:infection/end_pages/paediatrics/bloody_diarrhoea.dart';
import 'package:infection/end_pages/paediatrics/bone.dart';
import 'package:infection/end_pages/paediatrics/brain_abscess.dart';
import 'package:infection/end_pages/paediatrics/cardiovascular.dart';
import 'package:infection/end_pages/paediatrics/derm_cellulitis.dart';
import 'package:infection/end_pages/paediatrics/febrile_neutropaenia.dart';
import 'package:infection/end_pages/paediatrics/impetigo.dart';
import 'package:infection/end_pages/paediatrics/sepsis_late.dart';
import 'package:infection/end_pages/paediatrics/ophth_cellulitis.dart';
import 'package:infection/end_pages/paediatrics/conjunctivitis.dart';
import 'package:infection/end_pages/paediatrics/epiglottitis.dart';
import 'package:infection/end_pages/paediatrics/healthy_peritonitis.dart';
import 'package:infection/end_pages/paediatrics/lymphadenitis.dart';
import 'package:infection/end_pages/paediatrics/mastoiditis.dart';
import 'package:infection/end_pages/paediatrics/meningioencephalitis.dart';
import 'package:infection/end_pages/paediatrics/meningitis.dart';
import 'package:infection/end_pages/paediatrics/opthalmia.dart';
import 'package:infection/end_pages/paediatrics/orbital_cellulitis.dart';
import 'package:infection/end_pages/paediatrics/otitis_media.dart';
import 'package:infection/end_pages/paediatrics/peritonitis_disease.dart';
import 'package:infection/end_pages/paediatrics/pneumonia.dart';
import 'package:infection/end_pages/paediatrics/pyelonephritis.dart';
import 'package:infection/end_pages/paediatrics/sepsis_early.dart';
import 'package:infection/end_pages/paediatrics/sepsis_normal.dart';
import 'package:infection/end_pages/paediatrics/tonsillitis.dart';
import 'package:infection/end_pages/paediatrics/uti.dart';
import 'package:infection/end_pages/paediatrics/vp_shunt.dart';

class Paediatric extends StatelessWidget {
  Paediatric({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            toolbarHeight: 45.0,
            backgroundColor: Colors.white,
            leading:
            IconButton(
              icon: const Icon(CupertinoIcons.chevron_left,
                size: 22.0,
                color: Colors.black,),
              onPressed: ()
              {
                Navigator.pop(context);
              },
            ),

          ),
          body: SizedBox.expand(
            child:
            Column(
              children: [

                const TopColourBox(
                    boxColour: kPaediatricOrange,
                    boxText: 'Paediatric Guidelines'),

                Expanded(
                  child: ListView.separated(
                    itemCount: tabTitles.length,
                    itemBuilder: (context, index)
                    {
                      return ExpandingTile(tabTitles[index],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider(
                        height: 0.0,
                        thickness: 1.5,
                        indent: 20.0,

                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }



}

final List<SubTileText> tabTitles = <SubTileText>[
  SubTileText(
    'Bone and Joint',
  ),
  SubTileText(
      'Cardiovascular'
  ),
  SubTileText(
    'CNS',
    <SubTileText>[
      SubTileText('Meningitis'),
      SubTileText('Meningo-Encephalitis'),
      SubTileText('Brain Abscess/Empyema'),
      SubTileText('VP-Shunt Infection'),
    ],
  ),
  SubTileText(
    'ENT',
    <SubTileText>[
      SubTileText('Tonsilitis'),
      SubTileText('Epiglottitis'),
      SubTileText('Acute Otitis Media'),
      SubTileText('Mastoiditis'),
      SubTileText('Lymphadenitis'),
    ],
  ),
  SubTileText(
    'Gastrointestinal',
    <SubTileText>[
      SubTileText('Bloody Diarrhoea & Septic'),
      SubTileText('Peritonitis Healthy Child'),
      SubTileText('Peritonitis GI disease/Immunosuppressed'),
    ],
  ),
  SubTileText(
    'Ophthalmology',
    <SubTileText>[
      SubTileText('Conjunctivitis'),
      SubTileText('Cellulitis (Peri/Orbital/Pre & Post Septal)'),
      SubTileText('Ophthalmia Neonatorum'),
      SubTileText('Orbital Cellulitis')
    ],
  ),
  SubTileText(
    'Respiratory',
  ),
  SubTileText(
    'Skin and Soft Tissue',
    <SubTileText>[
      SubTileText('Cellulitis'),
      SubTileText('Impetigo/Infection Eczema'),
      SubTileText('Bites',),
    ],
  ),
  SubTileText(
    'Urinary Tract',
    <SubTileText>[
      SubTileText('Upper Tract UTI/Pyelonephritis'),
      SubTileText('Lower Tract UTI with Temperature'),
    ],
  ),
  SubTileText(
    'Sepsis & Febrile Neutropenia',
    <SubTileText>[
      SubTileText('Early Onset Sepsis within 72 hours'),
      SubTileText('Late Onset Sepsis > 72 hours'),
      SubTileText('Sepsis > 1 month'),
      SubTileText('Febrile Neurtopenia'),

    ],
  ),
];





class SubTileText {
  SubTileText(this.title, [this.children = const <SubTileText>[]]);

  final String title;
  final List<SubTileText> children;
}


class ExpandingTile extends StatelessWidget {

  const ExpandingTile(this.entry, {Key? key}) : super(key: key);

  final SubTileText entry;



  Widget _buildTiles(SubTileText root) {

    Map <String,Widget> mapLocations = {
      'Bone and Joint': PaedsBone(),
      'Cardiovascular': PaedsEndocarditis(),
      'Meningitis': PaedsMeningitis(),
      'Meningo-Encephalitis': PaedsMeningoencephalitis(),
      'Brain Abscess/Empyema': PaedsBrainAbscess(),
      'VP-Shunt Infection': PaedsVPShunt(),
      'Tonsilitis': PaedsTonsillitis(),
      'Epiglottitis': PaedsEpiglottitis(),
      'Acute Otitis Media': PaedsOtitisMedia(),
      'Mastoiditis': PaedsMastoiditis(),
      'Lymphadenitis': PaedsLymphadenitis(),
      'Bloody Diarrhoea & Septic': PaedsBloodyDiarrhoea(),
      'Peritonitis Healthy Child':PaedsHealthyPeritonitis(),
      'Peritonitis GI disease/Immunosuppressed':PaedsDiseasePeritonitis(),
      'Conjunctivitis': PaedsConjunctivitis(),
      'Cellulitis (Peri/Orbital/Pre & Post Septal)': PaedsOphthCellulitis(),
      'Ophthalmia Neonatorum': PaedsOphthalmia(),
      'Orbital Cellulitis': PaedsOrbitalCellulitis(),
      'Cellulitis': PaedsDermCellulitis(),
      'Impetigo/Infection Eczema': PaedsImpetigo(),
      'Bites': PaedsBites(),
      'Upper Tract UTI/Pyelonephritis': PaedsPyelonephritis(),
      'Lower Tract UTI with Temperature': PaedsUTI(),
      'Early Onset Sepsis within 72 hours': PaedsEarlySepsis(),
      'Late Onset Sepsis > 72 hours': PaedsLateSepsis(),
      'Sepsis > 1 month': PaedsSepsisOlder(),
      'Febrile Neurtopenia': PaedsFebrileNeutropaenia(),
    };


    if (root.title == "Cardiovascular")
    {
      return MenuTile(
        tileTitle: root.title,
        navigateTo: PaedsEndocarditis(),
        leadingPadding: 20,
        tileIsDense: false,

      );
    }
    else if (root.title == "Bone and Joint")
    {
      return MenuTile(
        tileTitle: root.title,
        navigateTo: PaedsBone(),
        leadingPadding: 20,
        tileIsDense: false,
      );
    }
    else if (root.title == "Respiratory")
    {
      return MenuTile(
        tileTitle: root.title,
        navigateTo: PaedsPneumonia(),
        leadingPadding: 20,
        tileIsDense: false,
      );
    }
    else if (root.children.isEmpty) {
      return MenuTile(
        trailingIconColour: Colors.white,
        tileTitle: root.title,
        titleTextColour: Colors.white,
        leadingPadding: 20,
        tileColour: kPaedsDropDownBlue,
        navigateTo: Container(child: mapLocations[root.title]),
      );
    }

    return ExpansionTile(
      tilePadding: const EdgeInsets.fromLTRB(20,0,15,0),
      //backgroundColor: kAdultGuidelinesPink,
      collapsedBackgroundColor: Colors.white,
      textColor: Colors.black,

      childrenPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),

      collapsedTextColor: Colors.black,

      key: PageStorageKey<SubTileText>(root),
      title: Text(root.title,
      style: const TextStyle(
        fontSize: 14,
      ),),
      children: root.children.map(_buildTiles).toList(),

      trailing: const Icon(CupertinoIcons.chevron_right,
          size: 20,
          color: kIconLightGrey),


    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}