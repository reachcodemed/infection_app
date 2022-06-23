import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infection/constants.dart';
import 'package:infection/functions.dart';


class GPInfluenza extends StatelessWidget {

  String antibioticTextOutput = """Annual vaccination is essential for all those at risk of influenza. Antivirals are not recommended for healthy adults.

Treat at risk patients with 5 days Oseltamivir 75mg BD, when influenza is circulating in the community, and ideally within 48 hours of onset (36 hours for zanamivir treatment in children), or in a care home where influenza is likely.

At risk: pregnant (and up to 2 weeks post-partum); children under 6 months; adults 65 years or older; chronic respiratory disease (including COPD and asthma); significant cardiovascular disease (not hvpertension): severe immunosuppression; chronic neurological, renal or liver disease; diabetes mellitus; morbid obesity (BMI>40).

See the PHE Influenza quidance for the treatment of patients under 13 vears.

In severe immunosuppression, or oseltamivir resistance, use zanamivir 10mg BD (2 inhalations by diskhaler for up to 10 days) and seek advice.
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
                          child: Text('Influenza',
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
child: RichText
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
