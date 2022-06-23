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
    TickerTile(title: 'Ceftazifime'),
    TickerTile(title: 'Ceftriaxone'),
    TickerTile(title: 'Cefuroxime'),
    TickerTile(title: 'Ciprofloxacin'),
    TickerTile(title: 'Clindamycin'),
    TickerTile(title: 'Co-amoxiclav'),
    TickerTile(title: 'Ertapenem'),
    TickerTile(title: 'Erythromycin'),
    TickerTile(title: 'Flucloxacillin'),
    TickerTile(title: 'Gentamicin'),
    TickerTile(title: 'Linezolid'),
    TickerTile(title: 'Meropenem'),
    TickerTile(title: 'Teicoplanin'),
    TickerTile(title: 'Temocillin'),
    TickerTile(title: 'Tigecycline'),
    TickerTile(title: 'Vancomycin'),
  ];

  int indexTicker1 = 0;
  int indexTicker2 = 0;

  void notifyParent()
  {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return BloodCulturesEndPage(
        title: "Antibiotic Co-Administration Check",
        titleBoxColour: kAntimicrobialMaroon,
        selectionTitles: selectionTitles,
        onSelectedItemChanged: (index)
          {

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
                        indexTicker2 = index;
                        notifyParent();

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
          secondTextArea: const SubBarAndText(
            lowerTitle: "Duration",
            outputText: "Hello",
            barColour: kIconLightGrey),


    );

  }
}
