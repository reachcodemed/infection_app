import "package:flutter/material.dart";
import 'package:flutter/cupertino.dart';
import 'package:infection/custom_widgets.dart';
import 'package:infection/constants.dart';
import 'package:infection/functions.dart';


class Allergies extends StatelessWidget {

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
                  colour: kCovidMaroon,
                  barText: 'Allergy - Penicillin',
                  boxHeight: boxHeight,
                  boxFontSize: boxFontSize,
                  topSpacerHeight: 0,),

                Padding(
                  padding: const EdgeInsets.fromLTRB(8,0,0,0),
                  child: Text("Throughout this app, antibiotics have been colour coded to help you identify which antibiotics you can use in a Penicillin allergy; those that you cannot use in a Penicillin allergy and those that you can use depending on the nature of the allergy.",
                    style: TextStyle(
                      fontSize: mainTextSize,
                    ),),
                ),

                ColourTitleBar(
                    boxHeight: boxHeight,
                    boxFontSize: boxFontSize,
                    colour: kIconLightGrey,
                    barText: 'Red Antibiotics'),

                Padding(
                  padding:const  EdgeInsets.fromLTRB(8,0,0,0),
                  child: RichText(
                    text:TextSpan(
                      children: Functions().antibioticHighlighter("RED colour denotes a Penicillin, which cannot be used in a patient with a Penicillin allergy, irrespective of the nature of the reaction.",
                          mainTextSize),
                    ),),
                ),

                ColourTitleBar(
                    boxHeight: boxHeight,
                    boxFontSize: boxFontSize,
                    colour: kIconLightGrey,
                    barTextColour: Colors.white,
                    barText: "Amber Antibiotics"),

                Padding(
                  padding:const  EdgeInsets.fromLTRB(8,0,0,0),
                  child: RichText(
                    text:TextSpan(
                      children: Functions().antibioticHighlighter("AMBER colour denotes a Cephalosporin or a Carbapenem antibiotic which can be used in patients with a Penicillin allergy as long as it is not anaphylactoid in nature",
                          mainTextSize),
                    ),),
                ),

                ColourTitleBar(
                    boxHeight: boxHeight,
                    boxFontSize: boxFontSize,
                    colour: kIconLightGrey,
                    barTextColour: Colors.white,
                    barText: "Green Antibiotics"),

                Padding(
                  padding:const  EdgeInsets.fromLTRB(8,0,0,0),
                  child: RichText(
                    text:TextSpan(
                      children: Functions().antibioticHighlighter("GREEN colour denotes all antibiotics which can be used in the context of Penicillin allergy, irrespective of the nature of the reaction.",
                          mainTextSize),
                    ),),
                ),

                ColourTitleBar(
                    boxHeight: boxHeight,
                    boxFontSize: boxFontSize,
                    colour: kIconLightGrey,
                    barTextColour: Colors.white,
                    barText: "Nature of the Allergy"),

                Padding(
                  padding:const  EdgeInsets.fromLTRB(8,0,0,0),
                  child: RichText(
                    text:TextSpan(
                      children: Functions().antibioticHighlighter("If a patient has an allergy to Penicillin, ensure that you ask about the nature of the Penicillin allergy as this makes a difference of treatment regimes",
                          mainTextSize),
                    ),),
                ),


              ],

            ),
          ),
        ),
      ),
    );
  }
}

