import "package:flutter/material.dart";
import 'package:flutter/cupertino.dart';
import 'package:infection/custom_widgets.dart';
import 'package:infection/constants.dart';
import 'package:infection/functions.dart';


class GeneralGuidelines extends StatelessWidget {
  const GeneralGuidelines({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    double boxHeight = 25;
    double boxFontSize = 15;
    double mainTextSize = 13.5;

    return       SafeArea(
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
                ColourTitleBar(
                  colour: kSurgicalProphylaxisOrange,
                  barText: 'General Prophylaxis Guidelines',
                  boxHeight: boxHeight,
                  boxFontSize: boxFontSize,
                  topSpacerHeight: 0,),

                Padding(
                  padding: const EdgeInsets.fromLTRB(8,0,0,0),
                  child: Text
                    ("""A single pre-operative dose given at induction of anaesthesia is sufficient for the majority of uncomplicated surgery.

An additional INTRA-OPERATIVE DOSE should be given if there is blood loss of >1.5L OR if duration of surgery is prolonged.

The need for repeat doses DURING SURGERY will depend on the half-life of the antibiotic(s) used.
""",
                    style: TextStyle(
                      fontSize: mainTextSize,
                    ),),
                ),

                ColourTitleBar(
                    boxHeight: boxHeight,
                    boxFontSize: boxFontSize,
                    colour: kSurgicalLightOrange,
                    barText: 'Antibiotic Re-dosing'),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10,),
                  child: Column(
                    children: [
                      ColourTitleBar(
                          boxHeight: boxHeight,
                          boxFontSize: 13,
                          colour: kHighlightedToggleYellow,
                          topSpacerHeight: 0,
                          barText: "Antibiotic        Re-dose if incision to skin close time is",
                          barTextColour: kSurgicalLightOrange

                      ),

                      const Text("""Gentamicin        Intra-operative re-dosing NOT indicated
                      
Teicoplanin        Intra-operative re-dosing NOT indicated

All other abx        >4 hours

The dose of an antibiotic may need adjusting depending on a patient's weight, age and/or renal function

Monitor Gentamicin levels if given for >24 hours

If Gentamicin 5mg/kg is given the dose should not be >480mg

If repeat dose are administered intra-operatively susequent doses must be timed appropriately""",
                      style: TextStyle(
                        fontSize: 13,
                      ),),

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

