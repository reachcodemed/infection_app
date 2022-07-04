import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';

class CoAdministrationCheck extends StatefulWidget {
  @override
  _CoAdministrationCheckState createState() => _CoAdministrationCheckState();
}

class _CoAdministrationCheckState extends State<CoAdministrationCheck> {

  List<Widget> selectionTitles = [
    TickerTile(title: 'Select an antibiotic'),
    TickerTile(title: 'Amikacin'),
    TickerTile(title: 'Amoxicillin'),
    TickerTile(title: 'Benzylpenicillin'),
    TickerTile(title: 'Cefuroxime'),
    TickerTile(title: 'Ceftazifime'),
    TickerTile(title: 'Ceftriaxone'),
    TickerTile(title: 'Clindamycin'),
    TickerTile(title: 'Ciprofloxacin'),
    TickerTile(title: 'Co-amoxiclav'),
    TickerTile(title: 'Ertapenem'),
    TickerTile(title: 'Flucloxacillin'),
    TickerTile(title: 'Gentamicin'),
    TickerTile(title: 'Linezolid'),
    TickerTile(title: 'Meropenem'),
    TickerTile(title: 'Tazocin'),
    TickerTile(title: 'Teicoplanin'),
    TickerTile(title: 'Tigecycline'),
    TickerTile(title: 'Vancomycin'),
  ];

  int indexTicker1 = 0;
  int indexTicker2 = 0;

  String outputText = "Select antibiotics";

  List<String> indexOfOutputs = [
    "Co-administration of the same antibiotic must be avoided",//0
    "Can be given together. Mainly used in chest or urinary sepsis",//1
    "Can be given together. Likely to be used in chest sepsis, but could also be used in skin/soft-tissue infections",//2
    "Can be given together. Can be used for a wide variety of indications",//3
    "Unusual to be given in combination, unless being used in the treatment of necrotising fasciitis",//4
    "Can be given together. Mainly used in abdominal or urinary sepsis",//5
    "Unusual for these antibiotics to be given together. Please discussed with an antimicrobial pharmacist/consultant microbiologist",//6
    "They are both aminoglycosides and MUST NOT be given together. Severe risk of nephrotoxicity and ototoxicity",//7
    "Can be given together. Mainly used for the treatment of resistant infections",//8
    "Can be given together. Broad spectrum of activity in combination. Combination increases the risk of nephrotoxicity",//9
    "Should not be given together as they have cross spectrum activity. There may be exceptions. Please discuss with an antimicrobial pharmacist/consultant microbiologist",//10
    "Can be given together. Mainly used for the treatment of necrotising fasciitis",//11
    "Can be given together. Mainly used in the treatment of endocarditis or diabetic foot infections",//12
    "Can be given together. Mainly used in the treatment of endocarditis, chest or urinary sepsis",//13
    "Can be given together. Mainly used in treatment of diabetic foot infections but can be used in other indications",//14
    "Should not be given together as they have a cross spectrum of activity. There may be exceptions - ceftazidime has Pseudomonal cover. Please discuss with antimicrobial pharmacist/consultant microbiologist",//15
    "Can be given together. Mainly used in treatment of skin/soft-tissue infections, necrotising fasciitis and occasionally in chest infections",//16
    "Can be given together but this is unusual. Please discuss with antimicrobial pharmacist/consultant microbiologist",//17
    "Can be given together. Mainly used in the treatment of endocarditis, skin/soft-tissue infections as well as bone and joint infections",//18
    "Can be given together",//19
    "Can be given together. This combination should be used on discussion with a consultant microbiologist",//20
    "Can be given together. Mainly used in urinary sepsis",//21
    "Should not be given together as they have a cross spectrum of activity. There may be exceptions - ceftazidime has Pseudomonal cover. Please discuss with antimicrobial pharmacist/consultant microbiologist",//22
    "Can be given together. Mainly used in chest sepsis",//23
    "Can be given together. Mainly in used in the treatment of skin/soft-tissue infections, necrotising fasciitis and Group A Streptococcal sepsis",//24
    "Can be given together. Can be used for a wide variety of indications. High risk of Clostridium difficile infection",//25
    "Can be given together. Clindamycin is often used in this context as an anti-toxin agent in conditions such as necrotising fasciitis and group A Streptococcal sepsis",//26
    "Can be given together. Mainly used in the treatment of severe skin/soft-tissue infections or Staphylococcus aureus endocarditis",//27
  ];


  List<List<int>> codedOutputs = [
    [0,1,2,1,1,3,4,5,3,3,6,7,8,3,3,9,5,9],//amikacin
    [0,10,10,10,10,11,1,10,10,12,13,14,10,10,14,14,14],//amoxicillin
    [0,10,15,10,16,17,10,10,18,3,10,10,10,10,17,10],//Benzylpenicillin
    [0,10,10,19,20,10,10,10,21,17,10,10,20,10,20],//cefuroxime
    [0,15,20,15,15,15,15,19,20,10,10,23,15,23],//ceftazidime
    [0,24,10,10,10,10,1,3,10,10,3,10,3],//ceftriaxone
    [0,25,26,26,26,26,10,26,26,26,20,26],//clindamycin
    [0,10,10,20,1,20,10,10,20,10,20,],//ciprofloxacin
    [0,10,10,1,1,10,10,20,10,20],//co-amoxiclav
    [0,10,1,20,10,10,20,10,20,],//Ertapenem
    [0,27,10,10,10,10,10,10],//flucloxacillin
    [0,20,19,19,20,19,9],//gentamicin
    [0,20,20,10,10,10],//Linezolid
    [0,10,20,10,20],//meropenem
    [0,20,10,20],//tazocin
    [0,20,10],//teicoplanin
    [0,20],//tigecycline
    [0],//vancomycin
  ];

  void notifyParent()
  {
    if(indexTicker1 == 0 || indexTicker2 == 0)
      {
        outputText = "Select two antibiotics to compare";
      }
    else if (indexTicker1 == indexTicker2)
      {
        outputText = indexOfOutputs[codedOutputs[indexTicker1-1][indexTicker2-indexTicker1]];
      }

    else if (indexTicker1 < indexTicker2)
      {
        outputText =   indexOfOutputs[codedOutputs[indexTicker1-1][indexTicker2-indexTicker1]];
        print("${indexTicker1-1} and ${indexTicker2-indexTicker1}");
      }
    else if (indexTicker1 > indexTicker2)
      {

        outputText = indexOfOutputs[codedOutputs[indexTicker2-1][indexTicker1-indexTicker2]];

        print("${indexTicker2-1} and ${indexTicker1-indexTicker2}");
      }
    else
      {
        print("There has been an error");
      }
  }

  @override
  Widget build(BuildContext context) {
    return BloodCulturesEndPage(
        title: "Antibiotic Co-Administration Check",
        titleBoxColour: kAntimicrobialMaroon,
        selectionTitles: selectionTitles,
        onSelectedItemChanged: (index)
          {

            setState(() {
              indexTicker1 = index;
              notifyParent();
            });
          },

        notifyParent: notifyParent,

          extraWidget: SizedBox(
            width: double.infinity,
            height: 25,
            child:
            Container(
              alignment: Alignment.centerLeft,
              color: kAntimicrobialPastelBrown,
              child: const Padding(
                padding: EdgeInsets.fromLTRB(8,0,0,0),
                child: Text('Antibiotic 1',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 15.0,

                  ),),
              ),
            ),
          ),


          firstTextArea:
          Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 25,
                child:
                Container(
                  alignment: Alignment.centerLeft,
                  color: kAntimicrobialPastelBrown,
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(8,0,0,0),
                    child: Text('Antibiotic 2',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 15.0,

                      ),),
                  ),
                ),
              ),

              Container(
                color: kAntimicrobialMaroon,
                child: Container(
                  color: Colors.white,
                  margin: const EdgeInsets.all(1),
                  child: SizedBox(
                    width: double.infinity,
                    height: 130,
                    child:
                    ListWheelScrollView(
                      controller: FixedExtentScrollController(initialItem: 0,),
                      physics: const FixedExtentScrollPhysics(),
                      //perspective: 0.01,
                      overAndUnderCenterOpacity: 0.3,
                      diameterRatio: 1.0,
                      magnification: 1.2,
                      clipBehavior: Clip.none,
                      onSelectedItemChanged: (index)
                      {
                        setState(() {
                          indexTicker2 = index;
                          notifyParent();
                        });
                      },
                      itemExtent: 30,
                      squeeze: 2,
                      children:selectionTitles,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
          secondTextArea: SubBarAndText(
            lowerTitle: "Duration",
            outputText: outputText,
            barColour: kIconLightGrey),


    );

  }
}
