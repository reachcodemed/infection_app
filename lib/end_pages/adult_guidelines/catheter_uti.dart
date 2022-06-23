import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infection/constants.dart';

import '../../functions.dart';

class CatheterUTI extends StatelessWidget {

  String antibioticTextOutput = """Antimicrobial therapy is not indicated unless the patient has evidence of systemic infection and the urinary tract is the likely source.

Remove or change catheter with Amikacin STAT IV (see local dosing guidelines).

Further treatment may not be necessary. If further treatment is required see urosepsis guidelines.

Duration:

7 days (if prompt resolution of symptoms)

10-14 days (if delayed clinical response) - consider prostate involvement if recent traumatic catheterisation
""";

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
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child:
                  Container(
                    color: kAdultGuidelinesGreen,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,


                      children:  [
                        const Padding(
                          padding: EdgeInsets.fromLTRB(8,0,0,0),
                          child: Text('Catheter-associated UTI',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 19.0,

                            ),),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(10,0,0,0),
                          color:Colors.white,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Icon(CupertinoIcons.phone_circle_fill,
                                color: kAdultGuidelinesGreen,),
                              SizedBox(width: 10.0,),
                              Icon(CupertinoIcons.doc_text_fill,
                                color: kAdultGuidelinesGreen,),
                            ],
                          ),
                        ),


                      ],

                    ),
                  ),
                ),

                const SizedBox(height: 20.0,),

                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8,0,0,0),
                      child: RichText
                        (text: TextSpan(
                        children: Functions().antibioticHighlighter(antibioticTextOutput,13),
                      ),
                      ),
                    ),
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
