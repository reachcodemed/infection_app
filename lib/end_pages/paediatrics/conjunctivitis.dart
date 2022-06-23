import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infection/constants.dart';

class PaedsConjunctivitis extends StatelessWidget {
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
                    color: kPaediatricOrange,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,


                      children:  [
                        const Padding(
                          padding: EdgeInsets.fromLTRB(8,0,0,0),
                          child: Text('Conjunctivitis',
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
                                color: kPaediatricOrange,),
                              SizedBox(width: 10.0,),
                              Icon(CupertinoIcons.doc_text_fill,
                                color: kPaediatricOrange,),
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
                  child: Text("Ususally no treatment required\n\nConsider cholramphernicol drops topically QDS for 7 days"),

                ),

              ],

            ),
          ),
        ),
      ),
    );
  }
}
