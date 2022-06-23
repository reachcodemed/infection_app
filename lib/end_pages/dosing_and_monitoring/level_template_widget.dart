import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';

class LevelInterpretationWidget extends StatefulWidget {
  LevelInterpretationWidget({Key? key,
    this.topRedBox,
    this.bottomRedBox,
    this.topBox,
    this.bottomBox,
    required this.pageTitle,
    this.screenSizeAdjustmentValue = 130,
  }) : super(key: key);

  Widget? topRedBox;
  Widget? bottomRedBox;

  Widget? topBox;
  Widget? bottomBox;

  String pageTitle;
  double screenSizeAdjustmentValue;


  @override
  _LevelInterpretationWidgetState createState() => _LevelInterpretationWidgetState();
}

class _LevelInterpretationWidgetState extends State<LevelInterpretationWidget> {
  @override



  int? heightOrWeight = 0;
  int? heightUnitsTop = 0;
  int? weightUnitsTop = 0;
  int? heightUnitsBottom = 0;
  int? weightUnitsBottom = 0;
  String inputValue = '';
  String inputFt = '';
  String inputIn = '';
  String inputSt = '';
  String inputLb = '';
  String outputValue = '';
  final fieldTextTopField = TextEditingController();
  final fieldTextft = TextEditingController();
  final fieldTextin = TextEditingController();
  final fieldTextSt = TextEditingController();
  final fieldTextLb = TextEditingController();




  void resetText()
  {
    fieldTextTopField.clear();
    fieldTextin.clear();
    fieldTextft.clear();
    fieldTextSt.clear();
    fieldTextLb.clear();
    outputValue = '';
    // heightUnitsTop = 0;
    // heightUnitsBottom = 0;
    // weightUnitsTop = 0;
    // weightUnitsBottom = 0;
    // heightOrWeight = 0;

    notifyParent();

  }


  notifyParent()
  {
    setState(() {

    });
  }

  Widget build(BuildContext context) {

    return
      Scaffold(
        resizeToAvoidBottomInset: true,
        body: 
            LayoutBuilder(
              builder: (context, constraints) =>
                  SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minHeight: constraints.maxHeight,minWidth: constraints.maxWidth),
                    child: IntrinsicHeight(
                      child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal:20.0,vertical: 10.0,),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children:[

                                      Container(
                                        width: double.infinity,
                                        height: 30,
                                        alignment: Alignment.centerLeft,
                                        padding: const EdgeInsets.only(left: 8),
                                        margin: const EdgeInsets.only(bottom: 10),
                                        color: kDosingGreen,
                                        child: Text(widget.pageTitle,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                          ),),
                                      ),

                                      Container(child: widget.topRedBox),

                                      Container(child: widget.topBox),

                                      Container(child:widget.bottomBox),

                                      Container(child:widget.bottomRedBox),

                                    ],
                                  ),),
                    ),
                  ),
              ),
            ),
      );
  }
}

class LevelPageBuildingBlock extends StatelessWidget {
  LevelPageBuildingBlock({
    Key? key,
    this.line1,
    this.line2,
    this.line3,
    this.line4,
    required this.topBarTitle,

  }) : super(key: key);

  Widget? line1;
  Widget? line2;
  Widget? line3;
  Widget? line4;
  String topBarTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: double.infinity,
          height: 25,
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 8),
          margin: const EdgeInsets.only(bottom: 10),
          color: kDosingLightOrange,
          child:  Text(topBarTitle,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),),
        ),
        Container(child: line1),
        Container(child: line2),
        Container(child: line3),
        Container(child: line4),
      ],
    );
  }
}

class LevelsRedTextBox extends StatelessWidget {
  LevelsRedTextBox({
    Key? key,
    required this.topBoldText,
    required this.bottomMainText,
  }) : super(key: key);

  String topBoldText;
  String bottomMainText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Container(
          color: kVeryLightPinkToggleHighlight,

          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0,),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(topBoldText,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),),
              const SizedBox(height: 5),
              Text(bottomMainText,
                style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
              ),
            ],
          ),
        ),
    );
  }
}

class InterpretationTextFieldAndButton extends StatelessWidget {
  InterpretationTextFieldAndButton({Key? key,
  required this.onChanged,
  required this.onPressed,
  required this.text, this.extraUnits,}) : super(key: key);

  Function()onPressed;
  Function(String)onChanged;
  String text;
  Widget? extraUnits;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
          ),
          Row(
            children:
            [
              SizedBox(
                width: 60,
                height: 30,
                child: TextField(
                  keyboardType: TextInputType.number,
                  onChanged: onChanged,
                  style: const TextStyle(
                    fontSize: 12.5,
                  ),
                  textAlign: TextAlign.center,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),

                  ),
                  maxLines: 1,
                ),
              ),

              const SizedBox(width:5),
              Container(
                child: extraUnits,
              ),
              const SizedBox(width:5),

              MaterialButton(
                  color: kHighlightedToggleRed,
                  height: 30,
                  minWidth: 50,
                  onPressed: onPressed,
                  elevation: 0,
                  highlightElevation: 1.5,

                  child: const Text('Interpret',
                      style: TextStyle(color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 13,))
              ),
            ],),



        ],

      ),
    );
  }
}


