import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';

class GPColdSore extends StatelessWidget {
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
                          child: Text('Cold Sores',
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


                TopRedInfoBox(
                  boxColour: kPaedsDropDownBlue,
                  textInput: 'Most resolve after 5 days without treatment, Topical antivirals applied prodromally can reduce duration by 12-18h. If frequent, severe, and predictable triggers: consider oral prophylaxis: Aciclovir 400mg BD for 5-7 days',
                ),

              ],

            ),
          ),
        ),
      ),
    );
  }
}
