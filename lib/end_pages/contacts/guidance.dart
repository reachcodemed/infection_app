import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infection/constants.dart';

class Guidance extends StatelessWidget {

  double boxHeight = 30;
  double boxFontSize = 15;
  double mainTextSize = 13;


  @override
  Widget build(BuildContext context) {
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
                    colour: kContactsPageGrey,
                    barText: 'Contact Details',
                    boxHeight: boxHeight,
                    boxFontSize: boxFontSize,
                    topSpacerHeight: 0,),

                Padding(
                  padding: const EdgeInsets.fromLTRB(8,0,0,0),
                  child: Text("The following points are provided as an aid for what information you should have ready when calling for advice. This will help both you and the consultant you are discussing the case with to deal with the query in a speedy and efficient manner - not an exhaustive list",
                  style: TextStyle(
                    fontSize: mainTextSize,
                  ),),
                ),

               ColourTitleBar(
                   boxHeight: boxHeight,
                   boxFontSize: boxFontSize,
                   colour: kBoldRed,
                   barText: 'Patient Details'),

                Padding(
                  padding:const  EdgeInsets.fromLTRB(8,0,0,0),
                  child: Text("""
•Age of patient
•Admission date
•Reason for admission/presenting complaint
• Patient's co-morbidities
• Is the patient immunosuppressed
• Has the patient travelled in the past year
• Any recent procedures
• Any long-lines/prosthetic devices in-situ
• Whether the patient can take oral medications""",
                    style: TextStyle(
                      fontSize: mainTextSize,
                    ),),
                ),

                ColourTitleBar(
                    boxHeight: boxHeight,
                    boxFontSize: boxFontSize,
                    colour: kContactsLightBlue,
                    barTextColour: kContactsTextBlue,
                    barText: "Investigations and Therapy"),

                Padding(
                  padding:const  EdgeInsets.fromLTRB(8,0,0,0),
                  child: Text("""• Current antibiotic therapy
• Antibiotic allergies and their nature
• Current and trends of observations
• Current and trends of blood tests
      - Inflammatory markers
      - Renal and Liver function  
      - Neutrophils and platelets
• Re sults of imaging""",
                    style: TextStyle(
                      fontSize: mainTextSize,
                    ),),
                ),

                const SizedBox(height: 15,),

                Expanded(child:
                Container(
                  padding: EdgeInsets.only(left:10),
                  alignment: Alignment.centerLeft,
                  color: const Color(0xffe1ffee),
                  child: Text("""* What is your diagnosis?
* What is your team's plan?
* What question would you like us to answer?""",
                  style: TextStyle(
                    fontSize: mainTextSize,
                    fontWeight: FontWeight.w600,
                  )),
                ),),




              ],

            ),
          ),
        ),
      ),
    );
  }
}

class ColourTitleBar extends StatelessWidget {
  const ColourTitleBar({
    Key? key,
    required this.boxHeight,
    required this.boxFontSize,
    required this.colour,
    required this.barText,
    this.barTextColour = Colors.white,
    this.topSpacerHeight = 15
  }) : super(key: key);

  final Color colour;
  final double boxHeight;
  final double boxFontSize;
  final String barText;
  final Color barTextColour;
  final double topSpacerHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: topSpacerHeight),

        SizedBox(
          width: double.infinity,
          height: boxHeight,
          child:
          Container(
            alignment: Alignment.centerLeft,
            color: colour,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8,0,0,0),
              child: Text(barText,
                style: TextStyle(
                  color: barTextColour,
                  fontWeight: FontWeight.w500,
                  fontSize: boxFontSize,

                ),),
            ),
          ),
        ),
        const SizedBox(height: 15,),
      ],
    );
  }
}
