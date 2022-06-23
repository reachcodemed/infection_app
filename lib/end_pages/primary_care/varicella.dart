import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';

import '../../functions.dart';

class GPVaricella extends StatelessWidget {

  String antibioticTextOutput = """First line: 

Adults: oral Aciclovir 800mg five times a day

Children: please refer to BNFC

Duration: 7 days

Second line for shingles if poor compliance: oral Famciclovir (not suitable for children) 500mg TDS or 750mg BD (high cost drug)

Duration: 7 days

OR 

Oral Valaciclovir (high cost drug): Adults: 1g TDS

Children: please refer to BNFC

Duration: 7 days
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
                    color: kPrimaryCareOrange,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children:  [
                        const Padding(
                          padding: EdgeInsets.fromLTRB(8,0,0,0),
                          child: Text('Varicella & Herpes Zoster',
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
                                color: kPrimaryCareOrange,),
                              SizedBox(width: 10.0,),
                              Icon(CupertinoIcons.doc_text_fill,
                                color: kPrimaryCareOrange,),
                            ],
                          ),
                        ),


                      ],

                    ),
                  ),
                ),
                const SizedBox(height: 20.0,),

                Padding(
                  padding: EdgeInsets.fromLTRB(8,0,0,0),
                  child:  RichText
                    (text: TextSpan(
                    children: Functions().antibioticHighlighter(antibioticTextOutput,13),
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
