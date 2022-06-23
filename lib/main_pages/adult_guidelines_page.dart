import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';
import 'package:infection/end_pages/adult_guidelines/Clostridiodes.dart';
import 'package:infection/end_pages/adult_guidelines/animal_bite.dart';
import 'package:infection/end_pages/adult_guidelines/aspiration_pneumonia.dart';
import 'package:infection/end_pages/adult_guidelines/asymptomatic_uti.dart';
import 'package:infection/end_pages/adult_guidelines/cap.dart';
import 'package:infection/end_pages/adult_guidelines/catheter_uti.dart';
import 'package:infection/end_pages/adult_guidelines/cellulitis.dart';
import 'package:infection/end_pages/adult_guidelines/decompensated_liver.dart';
import 'package:infection/end_pages/adult_guidelines/empyema.dart';
import 'package:infection/end_pages/adult_guidelines/encephalitis.dart';
import 'package:infection/end_pages/adult_guidelines/epididymoorchitis.dart';
import 'package:infection/end_pages/adult_guidelines/hap.dart';
import 'package:infection/end_pages/adult_guidelines/ie_copd.dart';
import 'package:infection/end_pages/adult_guidelines/intraabdominal_sepsis.dart';
import 'package:infection/end_pages/adult_guidelines/liver_abscess.dart';
import 'package:infection/end_pages/adult_guidelines/meningitis.dart';
import 'package:infection/end_pages/adult_guidelines/nec_fasc.dart';
import 'package:infection/end_pages/adult_guidelines/neutropenic_sepsis.dart';
import 'package:infection/end_pages/adult_guidelines/osteomyelitis.dart';
import 'package:infection/end_pages/adult_guidelines/pancreatitis.dart';
import 'package:infection/end_pages/adult_guidelines/perianal_abscess.dart';
import 'package:infection/end_pages/adult_guidelines/pid.dart';
import 'package:infection/end_pages/adult_guidelines/pregnant_uti.dart';
import 'package:infection/end_pages/adult_guidelines/prostatitis.dart';
import 'package:infection/end_pages/adult_guidelines/puo.dart';
import 'package:infection/end_pages/adult_guidelines/sbp.dart';
import 'package:infection/end_pages/adult_guidelines/septic_arthritis.dart';
import 'package:infection/end_pages/adult_guidelines/uncomplicated_uti.dart';
import 'package:infection/end_pages/adult_guidelines/urosepsis.dart';
import 'package:infection/end_pages/adult_guidelines/variceal_bleed.dart';
import 'opening_page.dart';
import 'package:infection/end_pages/adult_guidelines/endocarditis.dart';



class AdultGuidelines extends StatelessWidget {
  AdultGuidelines({Key? key}) : super(key: key);

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
                    boxColour: kAdultGuidelinesGreen,
                    boxText: 'Adult Guidelines'),

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
    <SubTileText>[
      SubTileText('Osteomyelitis'),
      SubTileText('Septic Arthritis'),
    ],
  ),
  SubTileText(
      'Cardiovascular'
  ),
  SubTileText(
    'CNS',
    <SubTileText>[
      SubTileText('Bacterial Meningitis'),
      SubTileText('Viral Encephalitis'),
    ],
  ),
  SubTileText(
    'Gastrointestinal',
    <SubTileText>[
      SubTileText('Clostridiodes difficile'),
      SubTileText('Decompensated Liver Disease'),
      SubTileText('Intra-abdominal Sepsis'),
      SubTileText('Liver Abscess'),
      SubTileText('Pancreatitis'),
      SubTileText('Spontaneous Bacterial Peritonitis'),
      SubTileText('Variceal Bleed'),
    ],
  ),
  SubTileText(
    'Respiratory',
    <SubTileText>[
      SubTileText('Aspiration Pneumonia'),
      SubTileText('Community Acquired Pneumonia'),
      SubTileText('Empyema'),
      SubTileText('Hospital Acquired Pneumonia'),
      SubTileText('Infective Exacerbation of COPD'),
    ],
  ),
  SubTileText(
    'Sepsis',
    <SubTileText>[
      SubTileText('Neutropenic Sepsis'),
      SubTileText('Sepsis of Unknown Origin'),
    ],
  ),
  SubTileText(
    'Skin and Soft Tissue',
    <SubTileText>[
      SubTileText('Animal/Human Bite'),
      SubTileText('Cellulitis/Phlebitis'),
      SubTileText('Diabetic Foot',),
      SubTileText('Necrotising Fascitis'),
      SubTileText('Perianal Abscess'),
    ],
  ),
  SubTileText(
    'Urinary Tract',
    <SubTileText>[
      SubTileText('Asymptomatic Bacteriuria'),
      SubTileText('Uncomplicated UTI'),
      SubTileText('Urosepsis/Pyelonephritis',),
      SubTileText('UTI Catheter-Related'),
      SubTileText('UTI Pregnancy'),
    ],
  ),
  SubTileText(
    'Urogenital',
    <SubTileText>[
      SubTileText('Epididymo-Orchitis'),
      SubTileText('Pelvic Inflammatory Disease'),
      SubTileText('Prostatitis',),
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
     'Osteomyelitis': Osteomyelitis(),
     'Septic Arthritis': SepticArthritis(),
     'Bacterial Meningitis': Meningitis(),
     'Viral Encephalitis': Encephalitis(),
     'Clostridiodes difficile': Clostridiodes(),
     'Decompensated Liver Disease': DecompensatedLiver(),
     'Intra-abdominal Sepsis': IntraAbdominalSepsis(),
     'Liver Abscess': LiverAbscess(),
     'Pancreatitis': Pancreatitis(),
     'Spontaneous Bacterial Peritonitis': SBP(),
     'Variceal Bleed': VaricealBleed(),
     'Aspiration Pneumonia': AspirationPneumonia(),
     'Community Acquired Pneumonia': CAP(),
     'Empyema': Empyema(),
     'Hospital Acquired Pneumonia': HAP(),
     'Infective Exacerbation of COPD': IECOPD(),
     'Neutropenic Sepsis': NeutropenicSepsis(),
     'Sepsis of Unknown Origin': SepsisOfUnknownOrigin(),
     'Animal/Human Bite': AnimalBite(),
     'Cellulitis/Phlebitis': AdultCellulitis(),
     'Diabetic Foot': OpeningPage(),
     'Necrotising Fascitis': NecFasc(),
     'Perianal Abscess': PerianalAbscess(),
     'Asymptomatic Bacteriuria': AsymptomaticUTI(),
     'Uncomplicated UTI': UncomplicatedUTI(),
     'Urosepsis/Pyelonephritis': Urosepsis(),
     'UTI Catheter-Related': CatheterUTI(),
     'UTI Pregnancy': PregnantUTI(),
     'Epididymo-Orchitis': Epididymoorchitis(),
     'Pelvic Inflammatory Disease': PID(),
     'Prostatitis': Prostatitis(),
   };



   if (root.title == "Cardiovascular")
     {
       return MenuTile(
         tileTitle: root.title,
         navigateTo: Endocarditis(),
         leadingPadding: 20,
         tileIsDense: false,
       );
     }
   else if (root.children.isEmpty) {
      return MenuTile(
        trailingIconColour: Colors.white,
        tileTitle: root.title,
        leadingPadding: 20,
        titleTextColour: Colors.white,
        tileColour: kAdultGuidelinesPink,
        tileIsDense: false,
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
      title: Text(root.title,style: const TextStyle(
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