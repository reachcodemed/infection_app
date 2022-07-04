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
import 'package:infection/end_pages/antimicrobials/allergies.dart';
import 'package:infection/end_pages/antimicrobials/antibiotic_spectra.dart';
import 'package:infection/end_pages/antimicrobials/co_administration.dart';
import 'package:infection/end_pages/antimicrobials/duration.dart';
import 'package:infection/end_pages/antimicrobials/information.dart';
import 'package:infection/end_pages/antimicrobials/iv_oral_switch.dart';
import 'package:infection/end_pages/antimicrobials/renal_dosing.dart';
import 'package:infection/end_pages/antimicrobials/will_this_cover.dart';
import 'package:infection/end_pages/primary_care/dermatophyte_nail.dart';
import 'package:infection/end_pages/primary_care/dermatophyte_skin.dart';
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
import 'package:infection/end_pages/results_interpretation/csf.dart';
import 'package:infection/end_pages/results_interpretation/measles.dart';
import 'opening_page.dart';
import 'package:infection/end_pages/adult_surgical/endocarditis_prophylaxis.dart';
import 'package:infection/end_pages/adult_surgical/endoscopy.dart';
import 'package:infection/end_pages/adult_surgical/lower_gi_prophylaxis.dart';
import 'package:infection/end_pages/adult_surgical/o_and_g.dart';
import 'package:infection/end_pages/adult_surgical/orthopaedic_surgery.dart';
import 'package:infection/end_pages/adult_surgical/upper_gi_surgery.dart';
import 'package:infection/end_pages/adult_surgical/urology_surgery.dart';
import 'package:infection/end_pages/adult_surgical/vascular_surgery.dart';
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
import 'package:infection/end_pages/adult_surgical/cardiac.dart';
import 'package:infection/end_pages/dosing_and_monitoring/amikacin.dart';
import 'package:infection/end_pages/dosing_and_monitoring/creatinine_clearance_calculator.dart';
import 'package:infection/end_pages/dosing_and_monitoring/gentamicin.dart';
import 'package:infection/end_pages/dosing_and_monitoring/height_weight_converter_page.dart';
import 'package:infection/end_pages/dosing_and_monitoring/other_antimicrobials.dart';
import 'package:infection/end_pages/dosing_and_monitoring/teicoplanin.dart';
import 'package:infection/end_pages/dosing_and_monitoring/vancomycin.dart';
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
import 'package:infection/end_pages/paediatrics/pyelonephritis.dart';
import 'package:infection/end_pages/paediatrics/sepsis_early.dart';
import 'package:infection/end_pages/paediatrics/sepsis_normal.dart';
import 'package:infection/end_pages/paediatrics/tonsillitis.dart';
import 'package:infection/end_pages/paediatrics/uti.dart';
import 'package:infection/end_pages/paediatrics/vp_shunt.dart';
import 'package:infection/end_pages/primary_care/pid.dart';
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
import 'package:infection/end_pages/results_interpretation/cmv.dart';
import 'package:infection/end_pages/results_interpretation/ebv.dart';
import 'package:infection/end_pages/results_interpretation/gram_stains.dart';
import 'package:infection/end_pages/results_interpretation/hepatitis_a.dart';
import 'package:infection/end_pages/results_interpretation/hepatitis_b.dart';
import 'package:infection/end_pages/results_interpretation/hepatitis_c.dart';
import 'package:infection/end_pages/results_interpretation/mumps.dart';
import 'package:infection/end_pages/results_interpretation/mycoplasma.dart';
import 'package:infection/end_pages/results_interpretation/organisms.dart';
import 'package:infection/end_pages/results_interpretation/parvovirus.dart';
import 'package:infection/end_pages/results_interpretation/procalcitonin.dart';
import 'package:infection/end_pages/results_interpretation/rubella.dart';
import 'package:infection/end_pages/results_interpretation/syphilis.dart';


class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final searchFieldController = TextEditingController();

  Map <String,Widget> mapLocations = {
    'Osteomyelitis (Adult)': Osteomyelitis(),
    'Septic Arthritis (Adult)': SepticArthritis(),
    'Bacterial Meningitis (Adult)': Meningitis(),
    'Viral Encephalitis (Adult)': Encephalitis(),
    'Clostridiodes difficile (Adult)': Clostridiodes(),
    'Decompensated Liver Disease (Adult)': DecompensatedLiver(),
    'Intra-abdominal Sepsis (Adult)': IntraAbdominalSepsis(),
    'Liver Abscess (Adult)': LiverAbscess(),
    'Pancreatitis (Adult)': Pancreatitis(),
    'Spontaneous Bacterial Peritonitis (Adult)': SBP(),
    'Variceal Bleed (Adult)': VaricealBleed(),
    'Aspiration Pneumonia (Adult)': AspirationPneumonia(),
    'Community Acquired Pneumonia (Adult)': CAP(),
    'Empyema (Adult)': Empyema(),
    'Hospital Acquired Pneumonia (Adult)': HAP(),
    'Infective Exacerbation of COPD (Adult)': IECOPD(),
    'Neutropenic Sepsis (Adult)': NeutropenicSepsis(),
    'Sepsis of Unknown Origin (Adult)': SepsisOfUnknownOrigin(),
    'Animal/Human Bite (Adult)': AnimalBite(),
    'Cellulitis/Phlebitis (Adult)': AdultCellulitis(),
    'Diabetic Foot (Adult)': OpeningPage(),
    'Necrotising Fascitis (Adult)': NecFasc(),
    'Perianal Abscess (Adult)': PerianalAbscess(),
    'Asymptomatic Bacteriuria (Adult)': AsymptomaticUTI(),
    'Uncomplicated UTI (Adult)': UncomplicatedUTI(),
    'Urosepsis/Pyelonephritis (Adult)': Urosepsis(),
    'UTI Catheter-Related (Adult)': CatheterUTI(),
    'UTI Pregnancy (Adult)': PregnantUTI(),
    'Epididymo-Orchitis (Adult)': Epididymoorchitis(),
    'Pelvic Inflammatory Disease (Adult)': PID(),
    'Prostatitis (Adult)': Prostatitis(),
    'General Guidelines (Surgery)':OpeningPage(),
    'Cardiac Procedures (Surgery)':CardiacSurgery(),
    'Endocarditis Prophylaxis (Surgery)':EndocarditisProphylaxis(),
    'Gastrointestinal Endoscopy (Surgery)':GastrointestinalEndoscopy(),
    'Obstetrics & Gynaecology (Surgery)':GynaecologyAndObstetrics(),
    'Lower GI Surgery (Surgery)':LowerGISurgery(),
    'Orthopaedic Surgery (Surgery)':OrthopaedicSurgery(),
    'Upper GI & Hepatobiliary Surgery (Surgery)':UpperGISurgery(),
    'Urology (Surgery)':UrologySurgery(),
    'Vascular Surgery (Surgery)':VascularSurgery(),
    'Antimicrobial Guidance (Covid)':OpeningPage(),
    'Doffing (Covid)':OpeningPage(),
    'Donning (Covid)':OpeningPage(),
    'Community Acquired Pneumonia (Critical Care)':ICUCAP(),
    'Hospital Acquired Pneumonia (Critical Care)':ICUHAP(),
    'Ventilator Associated Pneumonia (Critical Care)':ICUVAP(),
    'Abdominal (Critical Care)':ICUIntraAbdominalSepsis(),
    'Biliary (Critical Care)':ICUBiliarySepsis(),
    'Urinary (Critical Care)':ICUUrinary(),
    'Encephalitis (Critical Care)':ICUEncephalitis(),
    'Meningitis (Critical Care)':ICUMeningitis(),
    'Necrotising Fasciitis (Critical Care)':ICUNecFasc(),
    'Long-Line (Critical Care)':ICULongLine(),
    'Amikacin - Dosing and Monioring' :Amikacin(),
    'Gentamicin - Dosing and Monioring' :Gentamicin(),
    'Teicoplanin - Dosing and Monioring' :Teicoplanin(),
    'Vancomycin - Dosing and Monioring' : Vancomycin(),
    'Creatinine Clearance Calculator - Dosing and Monioring' :  CreatinineClearanceCalculator(),
    'Other Antimicrobials - Dosing and Monioring' : OtherAntimicrobials(),
    'Height/Weight Converter - Dosing and Monioring' :HeightAndWeightConverterPage(),
    'Clostridioides difficile - Infection Control': OpeningPage(),
    'Influenza - Infection Control': OpeningPage(),
    'Middle East Respiratory Syndrome (MERS) - Infection Control': OpeningPage(),
    'Sideroom Prioritisation  - Infection Control': OpeningPage(),
    'Ambulatory Pathways - OPAT & Ambulatory':OpeningPage(),
    'OPAT Pathway - OPAT & Ambulatory':OpeningPage(),
    'OPAT Referral Checker - OPAT & Ambulatory':OpeningPage(),
    'Bone and Joint (Paediatrics)': PaedsBone(),
    'Cardiovascular (Paediatrics)': PaedsEndocarditis(),
    'Meningitis (Paediatrics)': PaedsMeningitis(),
    'Meningo-Encephalitis (Paediatrics)': PaedsMeningoencephalitis(),
    'Brain Abscess/Empyema (Paediatrics)': PaedsBrainAbscess(),
    'VP-Shunt Infection (Paediatrics)': PaedsVPShunt(),
    'Tonsilitis (Paediatrics)': PaedsTonsillitis(),
    'Epiglottitis (Paediatrics)': PaedsEpiglottitis(),
    'Acute Otitis Media (Paediatrics)': PaedsOtitisMedia(),
    'Mastoiditis (Paediatrics)': PaedsMastoiditis(),
    'Lymphadenitis (Paediatrics)': PaedsLymphadenitis(),
    'Bloody Diarrhoea & Septic (Paediatrics)': PaedsBloodyDiarrhoea(),
    'Peritonitis Healthy Child (Paediatrics)':PaedsHealthyPeritonitis(),
    'Peritonitis GI disease/Immunosuppressed (Paediatrics)':PaedsDiseasePeritonitis(),
    'Conjunctivitis (Paediatrics)': PaedsConjunctivitis(),
    'Cellulitis (Peri/Orbital/Pre & Post Septal) (Paediatrics)': PaedsOphthCellulitis(),
    'Ophthalmia Neonatorum (Paediatrics)': PaedsOphthalmia(),
    'Orbital Cellulitis (Paediatrics)': PaedsOrbitalCellulitis(),
    'Cellulitis (Paediatrics)': PaedsDermCellulitis(),
    'Impetigo/Infection Eczema (Paediatrics)': PaedsImpetigo(),
    'Bites (Paediatrics)': PaedsBites(),
    'Upper Tract UTI/Pyelonephritis (Paediatrics)': PaedsPyelonephritis(),
    'Lower Tract UTI with Temperature (Paediatrics)': PaedsUTI(),
    'Early Onset Sepsis within 72 hours (Paediatrics)': PaedsEarlySepsis(),
    'Late Onset Sepsis > 72 hours (Paediatrics)': PaedsLateSepsis(),
    'Sepsis > 1 month (Paediatrics)': PaedsSepsisOlder(),
    'Febrile Neurtopenia (Paediatrics)': PaedsFebrileNeutropaenia(),
    'Acute Necrotising Ulcerative Gingivitis': GPUlcerativeGingivitis(),
    'Dental Abscess (GP)': GPDentalAbscess(),
    'Mucosal Ulceration & Inflammation (GP)': GPMucosalInflammation(),
    'Pericoronitis (GP)': GPPericoronitis(),
    'Blepharitis (GP)': GPBlepharitis(),
    'Conjunctivitis (GP)': GPConjunctivitis(),
    'Clostridium difficile (GP)': GPCDiff(),
    'Cellulitis/Phlebitis (GP)': GPCellulitis(),
    'Helicobacter pylori (GP)': GPHPylori(),
    'Infectious diarrhoea (GP)': GPInfectiousDiarrhoea(),
    'Oral candidiasis (GP)': GPOralCandidiasis(),
    'Threadworm (GP)': GPThreadworm(),
    "Traveller's Diarrhoea (GP)": GPTravellersDiarrhoea(),
    'Bacterial Vaginosis (GP)': GPBV(),
    'Chlamydia (GP)':GPChlamydia(),
    'Epididymitis (GP)':GPEpididymitis(),
    'Genital Herpes (GP)': GPGenitalHerpes(),
    'Gonorrhoea (GP)': GPGonorrhoea(),
    'Pelvic Inflammatory Disease (GP)': GPPID(),
    'Trichomoniasis (GP)': GPTrichomoniasis(),
    'Vaginal Candidiasis (GP)': GPVaginalCandidiasis(),
    'Acute Cough or Bronchitis (GP)': GPBronchitis(),
    'Acute Exacerbation of COPD (GP)': GPcopd(),
    'Acute Exacebation of Bronchiectasis (GP)': GPBronchiectasis(),
    'Community Acquired Pneumonia (GP)': GPCAP(),
    'Acne Vulgaris (GP)': GPAcne(),
    'Bites (Human & Animal) (GP)': GPBites(),
    //'Cellulitis/Erysipelas (GP)': GPCellulitis(),
    'Cold Sores (GP)': GPColdSore(),
    'Dermatophyte Nail (GP)': GPDermatophyteNail(),
    'Dermatophyte Skin (GP)': GPDermatophyteSkin(),
    'Diabetic Foot/Leg Ulcer (GP)': GPDiabeticFoot(),
    'Eczema (GP)': GPEczema(),
    'Impetigo (GP)': GPImpetigo(),
    'Leg Ulcers (GP)': GPLegUlcers(),
    'Lyme Disease (GP)':GPLymeDisease(),
    'Mastitis (GP)': GPMastitis(),
    'MRSA Decolonisation (GP)': GPMRSADecolonisation(),
    'MRSA Treatment (GP)': GPMRSATreatment(),
    'PVL-Staphylococcus aureus (GP)': GPPVLsAureus(),
    'Scabies (GP)': GPScabies(),
    "Varicella & Herpes Zoster (GP)": GPVaricella(),
    'Acute Otitis Externa (GP)': GPOtitisExterna(),
    'Acute Otitis Media (GP)': GPOtitisMedia(),
    'Acute Sinusitis (GP)': GPSinusitis(),
    'Acute Sore Throat (GP)': GPSoreThroat(),
    'Chronic Sinusitis (GP)': GPChronicSinusitis(),
    'Influenza (GP)': GPInfluenza(),
    'Scarlet Fever (GP)': GPScarletFever(),
    'Acute Prostatitis (GP)': GPAcuteProstatitis(),
    'Acute Pyelonephritis (GP)': GPPyelonephritis(),
    'Catheter-Associated Infection (GP)': GPCatheterAssociated(),
    'Lower Urinary Tract Infection (GP)': GPLowerUTI(),
    'Recent UTI prophylaxis (GP)': GPRecurrentUTI(),
    'Blood Culture Gram Stains':GramStains(),
    'Blood Culture Organisms':Organisms(),
    'Cerebrospinal Fluid (CSF)':RIcsf(),
    'Cytomegalovirus (CMV)':RIcmv(),
    'Epstein Barr Virus (EBV)': RIebv(),
    'Hepatitis A':RIhepA(),
    'Hepatitis B': RIhepB(),
    'Hepatitis C': RIhepC(),
    'Measles': RImeasles(),'Mumps':RImumps(),
    'Mycoplasma':RImycoplasma(),
    'Parvovirus':RIparvovirus(),
    'Procalcitonin':RIprocalcitonin(),
    'Rubella': RIrubella(),
    'Syphllis':RIsyphilis(),
    'Allergies (Antimicrobials)': Allergies(),
    'Antibiotic Spectra (Antimicrobials)':AbxSpectra(),
    'Antimicrobial Information (Antimicrobials)': AntimicrobialInformation(),
    'Antimicrobial Therapy Duration (Antimicrobials)':AntimicrobialDuration(),
    'Co-Administration Check (Antimicrobials)':CoAdministrationCheck(),
    'IV to PO Switch (Antimicrobials)':IVOralSwitch(),
    'Renal Dosing (Antimicrobials)':RenalDosing(),
    'Will This Antibiotic Cover (Antimicrobials)': WillThisCover(),






  };

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
            leading: IconButton(
              icon: const Icon(
                CupertinoIcons.chevron_left,
                size: 22.0,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: SizedBox.expand(
            child: Column(
              children: [
                const TopColourBox(
                    boxColour: kOpeningPageBlue, boxText: 'Search'),
                Container(
                  padding: const EdgeInsets.all(8),
                  width: double.infinity,
                  color: Colors.white,
                  height: 50,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: kBackgroundToggleGrey,
                    ),

                    child: TextField(
                      onChanged: (input)
                      {
                        setState(() {

                        });
                      },
                      controller: searchFieldController,
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration: InputDecoration(
                        hintText: 'Search',
                        prefixIcon: const Icon(Icons.search, color: Colors.grey),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: kBackgroundToggleGrey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: kBackgroundToggleGrey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: kBackgroundToggleGrey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: mapLocations.length,
                    itemBuilder: (context, index)
                    {

                        var sortedKeys = mapLocations.keys.toList()..sort();

                        if(searchFieldController.text.isEmpty)
                          {
                            return MenuTile(
                                leadingPadding: 20,
                                tileTitle: sortedKeys[index],
                                navigateTo: Container(child:
                                  mapLocations[sortedKeys[index]],),
                            );
                          }
                        else if(sortedKeys[index].toLowerCase().contains(searchFieldController.text.toLowerCase()))
                          {
                            return MenuTile(
                              leadingPadding: 20,
                              tileTitle: sortedKeys[index],
                              navigateTo: Container(child:
                              mapLocations[sortedKeys[index]],),
                            );
                          }
                        else
                          {
                            return Container();
                          }


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
