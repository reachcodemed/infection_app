import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';


class AbxSpectra extends StatefulWidget {
  const AbxSpectra({Key? key}) : super(key: key);

  @override
  _AbxSpectraState createState() => _AbxSpectraState();
}

class _AbxSpectraState extends State<AbxSpectra> {

  List<Widget> selectionTitles = [
    TickerTile(title: 'Select an antibiotic'),
    TickerTile(title: 'Amikacin'),
    TickerTile(title: 'Amoxicillin'),
    TickerTile(title: 'Azithromycin'),
    TickerTile(title: 'Benzylpenicillin'),
    TickerTile(title: 'Cefalexin'),
    TickerTile(title: 'Ceftazifime'),
    TickerTile(title: 'Ceftriaxone'),
    TickerTile(title: 'Cefuroxime'),
    TickerTile(title: 'Chloramphenicol'),
    TickerTile(title: 'Ciprofloxacin'),
    TickerTile(title: 'Clarithromycin'),
    TickerTile(title: 'Clindamycin'),
    TickerTile(title: 'Co-amoxiclav'),
    TickerTile(title: 'Co-trimoxazole'),
    TickerTile(title: 'Daptomycin'),
    TickerTile(title: 'Doxycycline'),
    TickerTile(title: 'Ertapenem'),
    TickerTile(title: 'Erythromycin'),
    TickerTile(title: 'Flucloxacillin'),
    TickerTile(title: 'Fosfomycin'),
    TickerTile(title: 'Fusidic acid'),
    TickerTile(title: 'Gentamicin'),
    TickerTile(title: 'Linezolid'),
    TickerTile(title: 'Meropenem'),
    TickerTile(title: 'Metronidazole'),
    TickerTile(title: 'Moxifloxacin'),
    TickerTile(title: 'Nitrofurantoin'),
    TickerTile(title: 'Penicillin V'),
    TickerTile(title: 'Piperacillin-Tazobactam'),
    TickerTile(title: 'Rifampicin'),
    TickerTile(title: 'Teicoplanin'),
    TickerTile(title: 'Temocillin'),
    TickerTile(title: 'Tigecycline'),
    TickerTile(title: 'Trimethoprim'),
    TickerTile(title: 'Vancomycin'),


  ];

  bool canChangeColour = true;
  int indexTicker = 0;

  List <Color> enterococcusColoursList = [
    kIconLightGrey,
    kSpectraAmber,
    kSpectraAmber,
    kSpectraRed,
    kSpectraRed,
    kSpectraRed,
    kSpectraRed,
    kSpectraRed,
    kSpectraRed,
    kSpectraRed,
    kSpectraRed,
    kSpectraRed,
    kSpectraRed,
    kSpectraAmber,
    kSpectraRed,
    kSpectraGreen,
    kSpectraRed,
    kSpectraRed,
    kSpectraRed,
    kSpectraRed,
    kSpectraAmber,
    kSpectraRed,
    kSpectraAmber,
    kSpectraGreen,
    kSpectraRed,
    kSpectraRed,
    kSpectraRed,
    kSpectraGreen,
    kSpectraRed,
    kSpectraAmber,
    kSpectraAmber,
    kSpectraGreen,
    kSpectraAmber,
    kSpectraGreen,
    kSpectraRed,
    kSpectraGreen,
  ];

  List <Color> mrsaColoursList = [
    kIconLightGrey, //Select abx
    kSpectraGreen, //Amikacin
    kSpectraRed, //Amoxicillin
    kSpectraAmber, //Azithromycin
    kSpectraRed, //Benzylpenicillin
    kSpectraRed, //Cefalexin
    kSpectraRed, //Ceftazidime
    kSpectraRed, //Ceftriaxone
    kSpectraRed, //Cefuroxime
    kSpectraGreen, //Chloramphenicol
    kSpectraGreen, //Ciprofloxacin
    kSpectraAmber, //Clarithromycin
    kSpectraGreen, //Clindamycin
    kSpectraRed, //Co-amoxiclav
    kSpectraGreen, //Clotrimoxazole
    kSpectraGreen, //Daptomycin
    kSpectraGreen, //Doxycycline
    kSpectraRed, //Ertapenem
    kSpectraAmber, //Erythromycin
    kSpectraRed, //Flucloxacillin
    kSpectraAmber, //Fosfomycin
    kSpectraGreen, //Fusidic Acid
    kSpectraGreen, //Gentamicin
    kSpectraGreen, //Linezolid
    kSpectraRed, //Meropenem
    kSpectraRed, //Metronidazole
    kSpectraGreen, //Moxifloxacin
    kSpectraRed, //Nitrofurantoin
    kSpectraRed, //Penicillin V
    kSpectraGreen, //Rifampicin
    kSpectraRed, //Tazocin
    kSpectraGreen, //Teicoplanin
    kSpectraAmber, //Temocillin
    kSpectraGreen,//Tigecycline
    kSpectraGreen, //Trimethoprim
    kSpectraGreen, //Vancomycin
  ];

  List <Color> staphAureusColoursList = [
    kIconLightGrey, //Select abx
    kSpectraGreen, //Amikacin
    kSpectraRed, //Amoxicillin
    kSpectraGreen, //Azithromycin
    kSpectraRed, //Benzylpenicillin
    kSpectraGreen, //Cefalexin
    kSpectraAmber, //Ceftazidime
    kSpectraGreen, //Ceftriaxone
    kSpectraGreen, //Cefuroxime
    kSpectraGreen, //Chloramphenicol
    kSpectraGreen, //Ciprofloxacin
    kSpectraGreen, //Clarithromycin
    kSpectraGreen, //Clindamycin
    kSpectraGreen, //Co-amoxiclav
    kSpectraGreen, //Clotrimoxazole
    kSpectraGreen, //Daptomycin
    kSpectraGreen, //Doxycycline
    kSpectraGreen, //Ertapenem
    kSpectraGreen, //Erythromycin
    kSpectraGreen, //Flucloxacillin
    kSpectraAmber, //Fosfomycin
    kSpectraGreen, //Fusidic Acid
    kSpectraGreen, //Gentamicin
    kSpectraGreen, //Linezolid
    kSpectraGreen, //Meropenem
    kSpectraRed, //Metronidazole
    kSpectraGreen, //Moxifloxacin
    kSpectraRed, //Nitrofurantoin
    kSpectraRed, //Penicillin V
    kSpectraGreen, //Rifampicin
    kSpectraGreen, //Tazocin
    kSpectraGreen, //Teicoplanin
    kSpectraRed, //Temocillin
    kSpectraGreen,//Tigecycline
    kSpectraGreen, //Trimethoprim
    kSpectraGreen, //Vancomycin
  ];

  List <Color> streptococciColoursList = [
    kIconLightGrey, //Select abx
    kSpectraGreen, //Amikacin
    kSpectraGreen, //Amoxicillin
    kSpectraAmber, //Azithromycin
    kSpectraGreen, //Benzylpenicillin
    kSpectraGreen, //Cefalexin
    kSpectraGreen, //Ceftazidime
    kSpectraGreen, //Ceftriaxone
    kSpectraGreen, //Cefuroxime
    kSpectraGreen, //Chloramphenicol
    kSpectraAmber, //Ciprofloxacin
    kSpectraAmber, //Clarithromycin
    kSpectraGreen, //Clindamycin
    kSpectraGreen, //Co-amoxiclav
    kSpectraAmber, //Clotrimoxazole
    kSpectraGreen, //Daptomycin
    kSpectraGreen, //Doxycycline
    kSpectraGreen, //Ertapenem
    kSpectraAmber, //Erythromycin
    kSpectraAmber, //Flucloxacillin
    kSpectraGreen, //Fosfomycin
    kSpectraRed, //Fusidic Acid
    kSpectraGreen, //Gentamicin
    kSpectraGreen, //Linezolid
    kSpectraGreen, //Meropenem
    kSpectraRed, //Metronidazole
    kSpectraAmber, //Moxifloxacin
    kSpectraRed, //Nitrofurantoin
    kSpectraGreen, //Penicillin V
    kSpectraGreen, //Rifampicin
    kSpectraGreen, //Tazocin
    kSpectraGreen, //Teicoplanin
    kSpectraGreen, //Temocillin
    kSpectraGreen,//Tigecycline
    kSpectraGreen, //Trimethoprim
    kSpectraGreen, //Vancomycin
  ];

  List <Color> eColiColoursList = [
    kIconLightGrey, //Select abx
    kSpectraGreen, //Amikacin
    kSpectraAmber, //Amoxicillin
    kSpectraRed, //Azithromycin
    kSpectraRed, //Benzylpenicillin
    kSpectraAmber, //Cefalexin
    kSpectraGreen, //Ceftazidime
    kSpectraGreen, //Ceftriaxone
    kSpectraGreen, //Cefuroxime
    kSpectraGreen, //Chloramphenicol
    kSpectraGreen, //Ciprofloxacin
    kSpectraRed, //Clarithromycin
    kSpectraRed, //Clindamycin
    kSpectraGreen, //Co-amoxiclav
    kSpectraGreen, //Clotrimoxazole
    kSpectraRed, //Daptomycin
    kSpectraAmber, //Doxycycline
    kSpectraGreen, //Ertapenem
    kSpectraRed, //Erythromycin
    kSpectraRed, //Flucloxacillin
    kSpectraGreen, //Fosfomycin
    kSpectraRed, //Fusidic Acid
    kSpectraGreen, //Gentamicin
    kSpectraRed, //Linezolid
    kSpectraGreen, //Meropenem
    kSpectraRed, //Metronidazole
    kSpectraGreen, //Moxifloxacin
    kSpectraGreen, //Nitrofurantoin
    kSpectraRed, //Penicillin V
    kSpectraAmber, //Rifampicin
    kSpectraGreen, //Tazocin
    kSpectraRed, //Teicoplanin
    kSpectraAmber, //Temocillin
    kSpectraGreen,//Tigecycline
    kSpectraGreen, //Trimethoprim
    kSpectraRed, //Vancomycin
  ];

  List <Color> klebsiellaColoursList = [
    kIconLightGrey, //Select abx
    kSpectraGreen, //Amikacin
    kSpectraRed, //Amoxicillin
    kSpectraRed, //Azithromycin
    kSpectraRed, //Benzylpenicillin
    kSpectraGreen, //Cefalexin
    kSpectraGreen, //Ceftazidime
    kSpectraGreen, //Ceftriaxone
    kSpectraGreen, //Cefuroxime
    kSpectraGreen, //Chloramphenicol
    kSpectraGreen, //Ciprofloxacin
    kSpectraRed, //Clarithromycin
    kSpectraRed, //Clindamycin
    kSpectraGreen, //Co-amoxiclav
    kSpectraGreen, //Clotrimoxazole
    kSpectraRed, //Daptomycin
    kSpectraRed, //Doxycycline
    kSpectraGreen, //Ertapenem
    kSpectraRed, //Erythromycin
    kSpectraRed, //Flucloxacillin
    kSpectraGreen, //Fosfomycin
    kSpectraRed, //Fusidic Acid
    kSpectraGreen, //Gentamicin
    kSpectraRed, //Linezolid
    kSpectraGreen, //Meropenem
    kSpectraRed, //Metronidazole
    kSpectraGreen, //Moxifloxacin
    kSpectraGreen, //Nitrofurantoin
    kSpectraRed, //Penicillin V
    kSpectraRed, //Rifampicin
    kSpectraGreen, //Tazocin
    kSpectraRed, //Teicoplanin
    kSpectraRed, //Temocillin
    kSpectraGreen,//Tigecycline
    kSpectraGreen, //Trimethoprim
    kSpectraRed, //Vancomycin
  ];


  List <Color> proteusColoursList = [
    kIconLightGrey, //Select abx
    kSpectraGreen, //Amikacin
    kSpectraGreen, //Amoxicillin
    kSpectraRed, //Azithromycin
    kSpectraRed, //Benzylpenicillin
    kSpectraGreen, //Cefalexin
    kSpectraGreen, //Ceftazidime
    kSpectraGreen, //Ceftriaxone
    kSpectraGreen, //Cefuroxime
    kSpectraGreen, //Chloramphenicol
    kSpectraGreen, //Ciprofloxacin
    kSpectraRed, //Clarithromycin
    kSpectraRed, //Clindamycin
    kSpectraGreen, //Co-amoxiclav
    kSpectraGreen, //Clotrimoxazole
    kSpectraRed, //Daptomycin
    kSpectraRed, //Doxycycline
    kSpectraGreen, //Ertapenem
    kSpectraRed, //Erythromycin
    kSpectraRed, //Flucloxacillin
    kSpectraGreen, //Fosfomycin
    kSpectraRed, //Fusidic Acid
    kSpectraGreen, //Gentamicin
    kSpectraRed, //Linezolid
    kSpectraGreen, //Meropenem
    kSpectraRed, //Metronidazole
    kSpectraGreen, //Moxifloxacin
    kSpectraRed, //Nitrofurantoin
    kSpectraRed, //Penicillin V
    kSpectraRed, //Rifampicin
    kSpectraGreen, //Tazocin
    kSpectraRed, //Teicoplanin
    kSpectraGreen, //Temocillin
    kSpectraGreen,//Tigecycline
    kSpectraGreen, //Trimethoprim
    kSpectraRed, //Vancomycin
  ];


  List <Color> pseudomonasColoursList = [
    kIconLightGrey, //Select abx
    kSpectraGreen, //Amikacin
    kSpectraRed, //Amoxicillin
    kSpectraRed, //Azithromycin
    kSpectraRed, //Benzylpenicillin
    kSpectraRed, //Cefalexin
    kSpectraGreen, //Ceftazidime
    kSpectraRed, //Ceftriaxone
    kSpectraRed, //Cefuroxime
    kSpectraRed, //Chloramphenicol
    kSpectraGreen, //Ciprofloxacin
    kSpectraRed, //Clarithromycin
    kSpectraRed, //Clindamycin
    kSpectraRed, //Co-amoxiclav
    kSpectraRed, //Clotrimoxazole
    kSpectraRed, //Daptomycin
    kSpectraRed, //Doxycycline
    kSpectraRed, //Ertapenem
    kSpectraRed, //Erythromycin
    kSpectraRed, //Flucloxacillin
    kSpectraRed, //Fosfomycin
    kSpectraRed, //Fusidic Acid
    kSpectraGreen, //Gentamicin
    kSpectraRed, //Linezolid
    kSpectraGreen, //Meropenem
    kSpectraRed, //Metronidazole
    kSpectraGreen, //Moxifloxacin
    kSpectraRed, //Nitrofurantoin
    kSpectraRed, //Penicillin V
    kSpectraRed, //Rifampicin
    kSpectraGreen, //Tazocin
    kSpectraRed, //Teicoplanin
    kSpectraRed, //Temocillin
    kSpectraRed,//Tigecycline
    kSpectraRed, //Trimethoprim
    kSpectraRed, //Vancomycin
  ];


  List <Color> escappmColoursList = [
    kIconLightGrey, //Select abx
    kSpectraGreen, //Amikacin
    kSpectraRed, //Amoxicillin
    kSpectraRed, //Azithromycin
    kSpectraRed, //Benzylpenicillin
    kSpectraRed, //Cefalexin
    kSpectraRed, //Ceftazidime
    kSpectraRed, //Ceftriaxone
    kSpectraRed, //Cefuroxime
    kSpectraAmber, //Chloramphenicol
    kSpectraGreen, //Ciprofloxacin
    kSpectraRed, //Clarithromycin
    kSpectraRed, //Clindamycin
    kSpectraRed, //Co-amoxiclav
    kSpectraGreen, //Clotrimoxazole
    kSpectraRed, //Daptomycin
    kSpectraRed, //Doxycycline
    kSpectraGreen, //Ertapenem
    kSpectraRed, //Erythromycin
    kSpectraRed, //Flucloxacillin
    kSpectraAmber, //Fosfomycin
    kSpectraRed, //Fusidic Acid
    kSpectraGreen, //Gentamicin
    kSpectraRed, //Linezolid
    kSpectraGreen, //Meropenem
    kSpectraRed, //Metronidazole
    kSpectraGreen, //Moxifloxacin
    kSpectraGreen, //Nitrofurantoin
    kSpectraRed, //Penicillin V
    kSpectraRed, //Rifampicin
    kSpectraGreen, //Tazocin
    kSpectraRed, //Teicoplanin
    kSpectraRed, //Temocillin
    kSpectraGreen,//Tigecycline
    kSpectraGreen, //Trimethoprim
    kSpectraRed, //Vancomycin
  ];


  List <Color> anaerobesColoursList = [
    kIconLightGrey, //Select abx
    kSpectraRed, //Amikacin
    kSpectraRed, //Amoxicillin
    kSpectraAmber, //Azithromycin
    kSpectraAmber, //Benzylpenicillin
    kSpectraRed, //Cefalexin
    kSpectraRed, //Ceftazidime
    kSpectraRed, //Ceftriaxone
    kSpectraRed, //Cefuroxime
    kSpectraAmber, //Chloramphenicol
    kSpectraRed, //Ciprofloxacin
    kSpectraAmber, //Clarithromycin
    kSpectraGreen, //Clindamycin
    kSpectraGreen, //Co-amoxiclav
    kSpectraRed, //Clotrimoxazole
    kSpectraRed, //Daptomycin
    kSpectraRed, //Doxycycline
    kSpectraGreen, //Ertapenem
    kSpectraAmber, //Erythromycin
    kSpectraRed, //Flucloxacillin
    kSpectraRed, //Fosfomycin
    kSpectraRed, //Fusidic Acid
    kSpectraRed, //Gentamicin
    kSpectraRed, //Linezolid
    kSpectraGreen, //Meropenem
    kSpectraGreen, //Metronidazole
    kSpectraAmber, //Moxifloxacin
    kSpectraRed, //Nitrofurantoin
    kSpectraAmber, //Penicillin V
    kSpectraRed, //Rifampicin
    kSpectraGreen, //Tazocin
    kSpectraRed, //Teicoplanin
    kSpectraRed, //Temocillin
    kSpectraAmber,//Tigecycline
    kSpectraRed, //Trimethoprim
    kSpectraRed, //Vancomycin
  ];

  void notifyParent()
  {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return 
      SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
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
        body:
        SizedBox.expand(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:20.0,vertical: 20.0,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children:[
                SizedBox(
                  width: double.infinity,
                  height: 35,
                  child:
                  Container(
                    alignment: Alignment.centerLeft,
                    color: kAntimicrobialMaroon,
                    child: const Padding(
                      padding:  EdgeInsets.fromLTRB(8,0,0,0),
                      child: Text('Antibiotic Spectra',
                        style:  TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 15.0,

                        ),),
                    ),
                  ),
                ),

                const SizedBox(height: 15.0,),

                Container(

                ),

                Column(
                  children: [
                    Container(
                      color: kAntimicrobialMaroon,
                      child: Container(
                        color: Colors.white,
                        margin: const EdgeInsets.all(1),
                        child: SizedBox(
                          width: double.infinity,
                          height: 100,
                          child:
                          ListWheelScrollView(
                            controller: FixedExtentScrollController(initialItem: 0, ),
                            physics: const FixedExtentScrollPhysics(),
                            //perspective: 0.01,
                            overAndUnderCenterOpacity: 0.3,
                            diameterRatio: 1.0,
                            magnification: 1.2,
                            clipBehavior: Clip.none,
                            onSelectedItemChanged: (index)
                            {
                              setState(() {
                                indexTicker = index;
                              });

                              //notifyParent;
                            },
                            itemExtent: 30,
                            squeeze: 2,
                            children:selectionTitles,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0,),

                Row(
                  children: [
                    Expanded(
                      child: Container(
                      color: kSpectraGreen,
                      child: const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text("Covers",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    ),
                    const SizedBox(width: 10,),
                    Expanded(child: Container(
                      color: kSpectraAmber,
                      child: const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text("May Cover",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    ),
                    const SizedBox(width: 10,),

                    Expanded(
                      child: Container(
                        color: kSpectraRed,
                        child: const Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Text("No Cover",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),),


                  ],
                ),

                const SizedBox(height: 10.0,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        flex: 2,
                        child:
                        Container(
                          color: kGramPositiveCocciDarkPurple,
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical:2.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Gram Positive Cocci',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SpectraColoringTile(
                          title: 'Enterococcus',
                          tileColour: kGramPositiveCocciPurple,
                          variableColour: enterococcusColoursList[indexTicker],),
                      SpectraColoringTile(
                          title: 'MRSA',
                          tileColour: kGramPositiveCocciPurple,
                          variableColour: mrsaColoursList[indexTicker]),
                      SpectraColoringTile(
                          title: 'Staphylococcus aureus',
                          tileColour: kGramPositiveCocciPurple,
                          variableColour: staphAureusColoursList[indexTicker]),
                      SpectraColoringTile(
                          title: 'Streptococci',
                          tileColour: kGramPositiveCocciPurple,
                          variableColour: streptococciColoursList[indexTicker]),
                      Expanded(
                        flex: 2,
                        child:
                        Container(
                        color: kGramNegativeRodsDarkOrange,
                          child: const Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Gram Negative Rods',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),),
                            ),
                          ),
                      ),
                      ),
                      SpectraColoringTile(
                          title: 'Escherichia coli (E. coli)',
                          tileColour: kGramNegativeRodsOrange,
                          variableColour: eColiColoursList[indexTicker]),
                      SpectraColoringTile(
                          title: 'Klebsiella',
                          tileColour: kGramNegativeRodsOrange,
                          variableColour: klebsiellaColoursList[indexTicker]),
                      SpectraColoringTile(
                          title: 'Proteus',
                          tileColour: kGramNegativeRodsOrange,
                          variableColour: proteusColoursList[indexTicker]),
                      SpectraColoringTile(
                          title: 'Pseudomonas',
                          tileColour: kGramNegativeRodsOrange,
                          variableColour: pseudomonasColoursList[indexTicker]),
                      SpectraColoringTile(
                          flex: 6,
                          title: 'ESCAPPM (Enterobacter, Serratia, Citrobacter freundii, Aeromonas, Providencia, Proteus vulagaris, Morganella)',
                          tileColour: kGramNegativeRodsOrange,
                          variableColour: escappmColoursList[indexTicker]),
                      SpectraColoringTile(
                          flex: 3,
                          title: 'Anaerobes',
                          tileColour: kAnaerobesGreen,
                          variableColour: anaerobesColoursList[indexTicker],
                          fontWeight: FontWeight.w500,
                          customTextColour: Colors.white,
                      ),
                    ],
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
