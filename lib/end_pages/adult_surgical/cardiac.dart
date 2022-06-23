import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';

class CardiacSurgery extends StatefulWidget {
  @override
  State<CardiacSurgery> createState() => _CardiacSurgeryState();
}

class _CardiacSurgeryState extends State<CardiacSurgery> {

  void notifyParent()
  {
    setState(() {

    });
  }

  int? abxSelection = 0;
  List<Widget> selectionTitles = [
    TickerTile(title:'Select an operation'),
    TickerTile(title:'Cardiac pacemaker insertion'),

  ];

  int indexTicker = 0;

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
                  height: 35,
                  child:
                  Container(
                    alignment: Alignment.centerLeft,
                    color: kSurgicalProphylaxisOrange,
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(8,0,0,0),
                      child: Text('Cardiac Prophylaxis',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 18.0,

                        ),),
                    ),
                  ),
                ),

                const SizedBox(height: 20.0,),

               Container(
                 color: kSurgicalProphylaxisOrange,
                 child: Container(
                   color: Colors.white,
                   margin: EdgeInsets.all(1),
                   child: SizedBox(
                     width: double.infinity,
                     height: 150,
                     child:
                       ListWheelScrollView(
                         controller: FixedExtentScrollController(initialItem: 0, ),
                         physics: FixedExtentScrollPhysics(),
                         //perspective: 0.01,
                         overAndUnderCenterOpacity: 0.3,
                         diameterRatio: 1.0,
                         magnification: 1.2,
                         clipBehavior: Clip.none,
                         onSelectedItemChanged: (index)
                         {
                           indexTicker = index;
                         },
                         itemExtent: 30,
                         squeeze: 2,
                         children:selectionTitles,
                   ),
                   ),
                 ),
               ),
                const SizedBox(height: 20.0,),
                TripleSwitchFullWidth(
                    onValueChanged: (index)
                    {
                      setState(() {
                        abxSelection = index;
                      });
                    },
                    indexPosition: abxSelection,
                    ),

                const SizedBox(height: 20.0,),

                SizedBox(
                  width: double.infinity,
                  height: 35,
                  child:
                  Container(
                    alignment: Alignment.centerLeft,
                    color: kSurgicalLightOrange,
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(8,0,0,0),
                      child: Text('Cardiac Prophylaxis',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 18.0,

                        ),),
                    ),
                  ),
                ),

                const SizedBox(height: 20.0,),

                const Padding(
                  padding: EdgeInsets.fromLTRB(8,0,0,0),
                  child: Text("Output Text here"),
                ),
              ],

            ),
          ),
        ),
      ),
    );
  }
}


