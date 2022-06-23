import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infection/constants.dart';

import '../../functions.dart';



class Encephalitis extends StatelessWidget {

  String antibioticTextOutput = """Signs of Viral Encephalitis (i.e. seizures, altered mental status or other focal neurology)

 Aciclovir 10mg/kg IV TDS (consider 15mg/kg TDS in varicella zoster associated encephalitis) for 14 days N.B 21 days if immunocompromised or repeat LP is PCR positive (oral not recommended)

*** Risk of AKI, discuss with Microbiologist if severe AKI ***

Valaciclovir is an oral alternative however not considered gold standard treatment, please discuss with microbiology.

Enteroviruses are the commonest cause of viral meningitis. Antivirals are not indicated and no antibiotics necessary, remember to take stool sample and viral throat swab to aid diagnosis
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
                          child: Text('Encephalitis',
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
