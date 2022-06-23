import 'package:flutter/material.dart';
import 'package:infection/custom_widgets.dart';
import 'package:infection/constants.dart';

class RIprocalcitonin extends StatefulWidget {
  @override
  _RIprocalcitoninState createState() => _RIprocalcitoninState();
}

class _RIprocalcitoninState extends State<RIprocalcitonin> {

  String antibioticTextOutput = '';
  List<bool> parvovirusIgM = [true,false,false];
  List<bool> parvovirusIgG= [true,false,false];
  List<bool> pregnant = [true,false,];
  String procalcitoninLevel = '';

  double minWidth = 80;


  notifyParent()
  {
    setState(() {

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notifyParent();
  }



  @override
  Widget build(BuildContext context) {
    return ResultsInterpretationEndPage(
      pageTitle: 'Procalcitonin',
      antibioticTextOutput: antibioticTextOutput,
      toggleBox1: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
            const SizedBox(
                //width: 80,
                child: Text('Level (ng/mL)',
                style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                    ),
                    ),
                    ),
            Row(

              children:
              [
              SizedBox(
                  width: 80,
                  height: 30,
                  child: TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (input){
                    setState(() {
                      procalcitoninLevel = input;
                    });
                  },
                  style: const TextStyle(
                  fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: const InputDecoration(
                  border: OutlineInputBorder(),

                  ),
                  maxLines: 1,
                  ),
                  ),
                const SizedBox(width: 30,),
                MaterialButton(
                    color: kButtonLightGreen,
                    height: 30,
                    minWidth: 60,
                    onPressed:(){},
                    elevation: 0,
                    highlightElevation: 1.5,

                    child: const Text('Interpret',
                        style: TextStyle(color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,))
                ),
              ],),



          ],

          ),
    );
  }
}
