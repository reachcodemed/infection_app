import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infection/constants.dart';


class GPChronicSinusitis extends StatelessWidget {
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
                          child: Text('Chronic Sinusitis',
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

                const Padding(
                  padding: EdgeInsets.fromLTRB(8,0,0,0),
                  child: Text("""Discourage the use of long-term antibiotics for chronic sinusitis, however, there may be a place for their use for acute exacerbations in a person with chronic sinusitis (for example, purulent discharge or pain).

Seek specialist advice before long-term antibiotics are initiated because of the potential for adverse effects, the concern of increasing bacterial resistance, the low specificity of a symptomatic primary care diagnosis, and the lack of evidence of efficacy other than in selected groups.

"""),

                ),
              ],

            ),
          ),
        ),
      ),
    );
  }
}
