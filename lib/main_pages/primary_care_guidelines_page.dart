import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';
import 'package:infection/end_pages/primary_care/dermatophyte_nail.dart';
import 'package:infection/end_pages/primary_care/dermatophyte_skin.dart';
import '../end_pages/primary_care/pid.dart';
import 'package:infection/end_pages/primary_care/acne.dart';
import 'package:infection/end_pages/primary_care/bites.dart';
import 'package:infection/end_pages/primary_care/bronchiectasis.dart';
import 'package:infection/end_pages/primary_care/bronchitis.dart';
import 'package:infection/end_pages/primary_care/cap.dart';
import 'package:infection/end_pages/primary_care/catheter_associated.dart';
import 'package:infection/end_pages/primary_care/cellulitis.dart';
import 'package:infection/end_pages/primary_care/chronic_sinusitis.dart';
import 'package:infection/end_pages/primary_care/cold_sore.dart';
import 'package:infection/end_pages/primary_care/copd.dart';
import 'package:infection/end_pages/primary_care/diabetic_foot.dart';
import 'package:infection/end_pages/primary_care/eczema.dart';
import 'package:infection/end_pages/primary_care/impetigo.dart';
import 'package:infection/end_pages/primary_care/influenza.dart';
import 'package:infection/end_pages/primary_care/leg_ulcers.dart';
import 'package:infection/end_pages/primary_care/lower_uti.dart';
import 'package:infection/end_pages/primary_care/lyme_disease.dart';
import 'package:infection/end_pages/primary_care/mastitis.dart';
import 'package:infection/end_pages/primary_care/meningitis.dart';
import 'package:infection/end_pages/primary_care/mrsa_decolonisation.dart';
import 'package:infection/end_pages/primary_care/mrsa_treatment.dart';
import 'package:infection/end_pages/primary_care/otitis_externa.dart';
import 'package:infection/end_pages/primary_care/otitis_media.dart';
import 'package:infection/end_pages/primary_care/prostatis.dart';
import 'package:infection/end_pages/primary_care/pvl_staph_aureus.dart';
import 'package:infection/end_pages/primary_care/pyelonephritis.dart';
import 'package:infection/end_pages/primary_care/recurrent_uti.dart';
import 'package:infection/end_pages/primary_care/scabies.dart';
import 'package:infection/end_pages/primary_care/scarlet_fever.dart';
import 'package:infection/end_pages/primary_care/sinusitis.dart';
import 'package:infection/end_pages/primary_care/sore_throat.dart';
import 'package:infection/end_pages/primary_care/trichomoniasis.dart';
import 'package:infection/end_pages/primary_care/blepharitis.dart';
import 'package:infection/end_pages/primary_care/bv.dart';
import 'package:infection/end_pages/primary_care/c_diff.dart';
import 'package:infection/end_pages/primary_care/chlamydia.dart';
import 'package:infection/end_pages/primary_care/conjunctivitis.dart';
import 'package:infection/end_pages/primary_care/dental_abscess.dart';
import 'package:infection/end_pages/primary_care/epididymitis.dart';
import 'package:infection/end_pages/primary_care/genital_herpes.dart';
import 'package:infection/end_pages/primary_care/gonorrhoea.dart';
import 'package:infection/end_pages/primary_care/h_pylori.dart';
import 'package:infection/end_pages/primary_care/infectious_diarrhoea.dart';
import 'package:infection/end_pages/primary_care/mucosal_inflammation.dart';
import 'package:infection/end_pages/primary_care/oral_candidiasis.dart';
import 'package:infection/end_pages/primary_care/pericoronitis.dart';
import 'package:infection/end_pages/primary_care/threadworm.dart';
import 'package:infection/end_pages/primary_care/travellers_diarrhoea.dart';
import 'package:infection/end_pages/primary_care/ulcerative_gingivitis.dart';
import 'package:infection/end_pages/primary_care/vaginal_candidiasis.dart';
import 'package:infection/end_pages/primary_care/varicella.dart';

class PrimaryCare extends StatelessWidget {
  PrimaryCare({Key? key}) : super(key: key);

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
                    boxColour: kPrimaryCareOrange,
                    boxText: 'Primary Care Guidelines'),

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
    'Dental Infections',
    <SubTileText>[
      SubTileText('Acute Necrotising Ulcerative Gingivitis'),
      SubTileText('Dental Abscess'),
      SubTileText('Mucosal Ulceration & Inflammation'),
      SubTileText('Pericoronitis'),
    ],
  ),
  SubTileText(
      'Eye Infections',
          <SubTileText>[
        SubTileText('Blepharitis'),
        SubTileText('Conjunctivitis'),
      ],

  ),
  SubTileText(
    'Gastrointestinal Infections',
    <SubTileText>[
      SubTileText('Clostridium difficile'),
      SubTileText('Helicobacter pylori'),
      SubTileText('Infectious diarrhoea'),
      SubTileText('Oral candidiasis'),
      SubTileText('Threadworm'),
      SubTileText("Traveller's Diarrhoea"),
    ],
  ),
  SubTileText(
    'Genital Tract Infections',
    <SubTileText>[
      SubTileText('Bacterial Vaginosis'),
      SubTileText('Chlamydia'),
      SubTileText('Epididymitis'),
      SubTileText('Genital Herpes'),
      SubTileText('Gonorrhoea'),
      SubTileText('Pelvic Inflammatory Disease'),
      SubTileText('Trichomoniasis'),
      SubTileText('Vaginal Candidiasis'),
    ],
  ),
  SubTileText(
    'Lower Respiratory Tract Infections',
    <SubTileText>[
      SubTileText('Acute Cough or Bronchitis'),
      SubTileText('Acute Exacerbation of COPD'),
      SubTileText('Acute Exacebation of Bronchiectasis'),
      SubTileText('Community Acquired Pneumonia'),
    ],
  ),
  SubTileText(
    'Meningitis',
  ),
  SubTileText(
    'Skin Infections',
    <SubTileText>[
      SubTileText('Acne Vulgaris'),
      SubTileText('Bites (Human & Animal)'),
      SubTileText('Cellulitis/Erysipelas'),
      SubTileText('Cold Sores'),
      SubTileText('Dermatophyte Nail'),
      SubTileText('Dermatophyte Skin'),
      SubTileText('Diabetic Foot/Leg Ulcer'),
      SubTileText('Eczema'),
      SubTileText('Impetigo'),
      SubTileText('Leg Ulcers'),
      SubTileText('Lyme Disease'),
      SubTileText('Mastitis'),
      SubTileText('MRSA Decolonisation'),
      SubTileText('MRSA Treatment'),
      SubTileText('PVL-Staphylococcus aureus'),
      SubTileText('Scabies'),
      SubTileText('Varicella & Herpes Zoster'),

    ],
  ),
  SubTileText(
    'Upper Respiratory Tract Infections',
    <SubTileText>[
      SubTileText('Acute Otitis Externa'),
      SubTileText('Acute Otitis Media'),
      SubTileText('Acute Sinusitis',),
      SubTileText('Acute Sore Throat'),
      SubTileText('Chronic Sinusitis'),
      SubTileText('Influenza'),
      SubTileText('Scarlet Fever'),
    ],
  ),
  SubTileText(
    'Urinary Tract Infections',
    <SubTileText>[
      SubTileText('Acute Prostatitis'),
      SubTileText('Acute Pyelonephritis'),
      SubTileText('Catheter-Associated Infection'),
      SubTileText('Lower Urinary Tract Infection'),
      SubTileText('Recent UTI prophylaxis'),
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
      'Acute Necrotising Ulcerative Gingivitis': GPUlcerativeGingivitis(),
      'Dental Abscess': GPDentalAbscess(),
      'Mucosal Ulceration & Inflammation': GPMucosalInflammation(),
      'Pericoronitis': GPPericoronitis(),
      'Blepharitis': GPBlepharitis(),
      'Conjunctivitis': GPConjunctivitis(),
      'Clostridium difficile': GPCDiff(),
      'Helicobacter pylori': GPHPylori(),
      'Infectious diarrhoea': GPInfectiousDiarrhoea(),
      'Oral candidiasis': GPOralCandidiasis(),
      'Threadworm': GPThreadworm(),
      "Traveller's Diarrhoea": GPTravellersDiarrhoea(),
      'Bacterial Vaginosis': GPBV(),
      'Chlamydia':GPChlamydia(),
      'Epididymitis':GPEpididymitis(),
      'Genital Herpes': GPGenitalHerpes(),
      'Gonorrhoea': GPGonorrhoea(),
      'Pelvic Inflammatory Disease': GPPID(),
      'Trichomoniasis': GPTrichomoniasis(),
      'Vaginal Candidiasis': GPVaginalCandidiasis(),
      'Acute Cough or Bronchitis': GPBronchitis(),
      'Acute Exacerbation of COPD': GPcopd(),
      'Acute Exacebation of Bronchiectasis': GPBronchiectasis(),
      'Community Acquired Pneumonia': GPCAP(),
      'Acne Vulgaris': GPAcne(),
      'Bites (Human & Animal)': GPBites(),
      'Cellulitis/Erysipelas': GPCellulitis(),
      'Cold Sores': GPColdSore(),
      'Dermatophyte Nail': GPDermatophyteNail(),
      'Dermatophyte Skin': GPDermatophyteSkin(),
      'Diabetic Foot/Leg Ulcer': GPDiabeticFoot(),
      'Eczema': GPEczema(),
      'Impetigo': GPImpetigo(),
      'Leg Ulcers': GPLegUlcers(),
      'Lyme Disease':GPLymeDisease(),
      'Mastitis': GPMastitis(),
      'MRSA Decolonisation': GPMRSADecolonisation(),
      'MRSA Treatment': GPMRSATreatment(),
      'PVL-Staphylococcus aureus': GPPVLsAureus(),
      'Scabies': GPScabies(),
      "Varicella & Herpes Zoster": GPVaricella(),
      'Acute Otitis Externa': GPOtitisExterna(),
      'Acute Otitis Media': GPOtitisMedia(),
      'Acute Sinusitis': GPSinusitis(),
      'Acute Sore Throat': GPSoreThroat(),
      'Chronic Sinusitis': GPChronicSinusitis(),
      'Influenza': GPInfluenza(),
      'Scarlet Fever': GPScarletFever(),
      'Acute Prostatitis': GPAcuteProstatitis(),
      'Acute Pyelonephritis': GPPyelonephritis(),
      'Catheter-Associated Infection': GPCatheterAssociated(),
      'Lower Urinary Tract Infection': GPLowerUTI(),
      'Recent UTI prophylaxis': GPRecurrentUTI(),
    };

    

    if (root.title == "Meningitis")
    {
      return MenuTile(
        tileTitle: root.title,
        navigateTo: GPMeningitis(),
        leadingPadding: 20,
        tileIsDense: false,
      );
    }

    else if (root.children.isEmpty) {
      return MenuTile(
        trailingIconColour: Colors.white,
        tileTitle: root.title,
        titleTextColour: Colors.white,
        tileColour: kPaedsPenicillinPurple,
        leadingPadding: 20,
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
      style: TextStyle(
        fontSize: 14,
      )),
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