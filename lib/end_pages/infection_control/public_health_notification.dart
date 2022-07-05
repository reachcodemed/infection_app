import 'package:flutter/material.dart';
import 'package:infection/custom_widgets.dart';
import 'package:infection/constants.dart';

class ICpublicHealthNotification extends StatefulWidget {
  @override
  _ICpublicHealthNotificationState createState() =>
      _ICpublicHealthNotificationState();
}

class _ICpublicHealthNotificationState
    extends State<ICpublicHealthNotification> {
  String antibioticTextOutput = '';
  int? ugiBleed = 0;
  int? ngFeed = 0;
  int? laxatives = 0;
  int? prokinetics = 0;
  int? iaPathology = 0;
  int? ppi = 0;
  double minWidth = 60;
  bool tb3isActive = true;

  List<Widget> selectionTitles = [
    TickerTile(title: 'Select a disease'),
    TickerTile(title: 'Anthrax'),
    TickerTile(title: 'Botulism'),
    TickerTile(title: 'Brucellosis'),
    TickerTile(title: 'Cholera'),
    TickerTile(title: 'COVID-19'),
    TickerTile(title: 'Diphtheria'),
    TickerTile(title: 'Encephalitis (Acute)'),
    TickerTile(title: 'Enteric Fever (Typhoid/Paratyphoid)'),
    TickerTile(title: 'Food Poisoning'),
    TickerTile(title: 'Haemolytic uraemic syndrome (HUS)'),
    TickerTile(title: 'Hepatitis (Acute Infectious)'),
    TickerTile(title: 'Infectious Bloody Diarrhoea'),
    TickerTile(title: 'Invasive Group A Streptococcus'),
    TickerTile(title: 'Legionnaires’ disease'),
    TickerTile(title: 'Leprosy'),
    TickerTile(title: 'Malaria'),
    TickerTile(title: 'Measles'),
    TickerTile(title: 'Meningitis (Acute)'),
    TickerTile(title: 'Meningococcal septicaemia'),
    TickerTile(title: 'Monkeypox'),
    TickerTile(title: 'Mumps'),
    TickerTile(title: 'Plague'),
    TickerTile(title: 'Poliomyelitis (Acute)'),
    TickerTile(title: 'Rabies'),
    TickerTile(title: 'Rubella'),
    TickerTile(title: 'Severe Acute Respiratory Syndrome (SARS)'),
    TickerTile(title: 'Scarlet Fever'),
    TickerTile(title: 'Smallpox'),
    TickerTile(title: 'Tetanus'),
    TickerTile(title: 'Tuberculosis'),
    TickerTile(title: 'Typhus'),
    TickerTile(title: 'Viral Haemorrhagic Fever (VHF)'),
    TickerTile(title: 'Whooping Cough'),
    TickerTile(title: 'Yellow Fever'),
  ];

  List<Widget> selectionTitles2 = [
    TickerTile(title: 'Select an organisms'),
    TickerTile(title: 'Bacillus anthracis'),
    TickerTile(title: 'Bacillus cereus (food poisoning)'),
    TickerTile(title: 'Bordetella pertussis'),
    TickerTile(title: 'Borrelia spp'),
    TickerTile(title: 'Brucella spp'),
    TickerTile(title: 'Burkholderia mallei'),
    TickerTile(title: 'Burkholderia pseudomallei'),
    TickerTile(title: 'Campylobacter spp'),
    TickerTile(title: 'Carbapenemase-producing bacteria'),
    TickerTile(title: 'Chikungunya virus'),
    TickerTile(title: 'Chlamydophila psittaci'),
    TickerTile(title: 'Clostridium botulinum'),
    TickerTile(title: 'Clostridium perfringens (food poisoning)'),
    TickerTile(title: 'Clostridium tetani'),
    TickerTile(title: 'Corynebacterium diphtheriae'),
    TickerTile(title: 'Corynebacterium ulcerans'),
    TickerTile(title: 'Coxiella burnetii'),
    TickerTile(title: 'Crimean-Congo haemorrhagic fever virus'),
    TickerTile(title: 'Cryptosporidium spp'),
    TickerTile(title: 'Dengue virus'),
    TickerTile(title: 'Ebola virus'),
    TickerTile(title: 'Entamoeba histolytica'),
    TickerTile(title: 'Francisella tularensis'),
    TickerTile(title: 'Giardia lamblia'),
    TickerTile(title: 'Guanarito virus'),
    TickerTile(title: 'Haemophilus influenzae (invasive)'),
    TickerTile(title: 'Hanta virus'),
    TickerTile(title: 'Hepatitis A, B, C, D and E viruses'),
    TickerTile(title: 'Influenza virus'),
    TickerTile(title: 'Junin virus'),
    TickerTile(title: 'Kyasanur Forest disease virus'),
    TickerTile(title: 'Lassa virus'),
    TickerTile(title: 'Legionella spp'),
    TickerTile(title: 'Leptospira interrogans'),
    TickerTile(title: 'Listeria monocytogenes'),
    TickerTile(title: 'Machupo virus'),
    TickerTile(title: 'Marburg virus'),
    TickerTile(title: 'Measles virus'),
    TickerTile(title: 'Mumps virus'),
    TickerTile(title: 'Mycobacterium tuberculosis complex'),
    TickerTile(title: 'Neisseria meningitidis'),
    TickerTile(title: 'Omsk haemorrhagic fever virus'),
    TickerTile(title: 'Plasmodium falciparum'),
    TickerTile(title: 'Plasmodium vivax'),
    TickerTile(title: 'Plasmodium ovale'),
    TickerTile(title: 'Plasmodium malariae'),
    TickerTile(title: 'Plasmodium knowlesi'),
    TickerTile(title: 'Polio virus'),
    TickerTile(title: 'Rabies virus'),
    TickerTile(title: 'Rickettsia spp'),
    TickerTile(title: 'Rift Valley fever virus'),
    TickerTile(title: 'Rubella virus'),
    TickerTile(title: 'Sabia virus'),
    TickerTile(title: 'Salmonella spp'),
    TickerTile(title: 'SARS-COV-2'),
    TickerTile(title: 'Shigella spp'),
    TickerTile(title: 'Streptococcus pneumoniae (invasive)'),
    TickerTile(title: 'Streptococcus pyogenes (invasive)'),
    TickerTile(title: 'Varicella zoster virus'),
    TickerTile(title: 'Variola virus'),
    TickerTile(title: 'Verocytotoxigenic Escherichia coli'),
    TickerTile(title: 'Vibrio cholerae'),
    TickerTile(title: 'West Nile Virus'),
    TickerTile(title: 'Yellow fever virus'),
    TickerTile(title: 'Yersinia pestis'),
  ];

  int indexTicker1 = 0;
  int indexTicker2 = 0;

  notifyParent() {
    setState(() {
      antibioticTextOutput =
          "Complete a notification form  immediately on diagnosis of a suspected notifiable disease. Don’t wait for laboratory confirmation of a suspected infection or contamination before notification.\n\nSend the form to the proper officer within 3 days, or notify them verbally within 24 hours if the case is urgent by phone, letter, encrypted email or secure fax machine.\n\nCall local Public Health Team";
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notifyParent();
  }

  @override
  Widget build(BuildContext context) {
    return InfectionControlWithTwoSubsections2EndPage(
      pageTitle: 'Public Health Notification',
      antibioticTextOutput: antibioticTextOutput,
      subPanel1Text: 'Notifiable Diseases',
      subPanel2Text: 'Notifiable Organisms',
      selectionTitles: selectionTitles,
      selectionTitles2: selectionTitles2,
      scroller1: Container(
        color: kInfectionControlBlue,
        child: Container(
          color: Colors.white,
          margin: const EdgeInsets.all(1),
          child: SizedBox(
            width: double.infinity,
            height: 130,
            child: ListWheelScrollView(
              controller: FixedExtentScrollController(
                initialItem: 0,
              ),
              physics: const FixedExtentScrollPhysics(),
              //perspective: 0.01,
              overAndUnderCenterOpacity: 0.3,
              diameterRatio: 1.0,
              magnification: 1.2,
              clipBehavior: Clip.none,
              onSelectedItemChanged: (index) {
                setState(() {
                  indexTicker1 = index;
                  notifyParent();
                });
              },
              itemExtent: 30,
              squeeze: 2,
              children: selectionTitles,
            ),
          ),
        ),
      ),
      scroller2: Container(
        color: kInfectionControlBlue,
        child: Container(
          color: Colors.white,
          margin: const EdgeInsets.all(1),
          child: SizedBox(
            width: double.infinity,
            height: 130,
            child: ListWheelScrollView(
              controller: FixedExtentScrollController(
                initialItem: 0,
              ),
              physics: const FixedExtentScrollPhysics(),
              //perspective: 0.01,
              overAndUnderCenterOpacity: 0.3,
              diameterRatio: 1.0,
              magnification: 1.2,
              clipBehavior: Clip.none,
              onSelectedItemChanged: (index) {
                setState(() {
                  indexTicker2 = index;
                  notifyParent();
                });
              },
              itemExtent: 30,
              squeeze: 2,
              children: selectionTitles2,
            ),
          ),
        ),
      ),
      outputPanelTitle: 'Notification',
    );
  }
}
