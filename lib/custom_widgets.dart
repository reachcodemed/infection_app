import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'constants.dart';
import 'functions.dart';
import 'package:auto_size_text/auto_size_text.dart';

class AgeToggleSwitchPaeds extends StatefulWidget {
  AgeToggleSwitchPaeds(
      {Key? key,
      required this.title,
      required this.indexPosition,
      this.isActive = true,
      this.upperBoxHeight = 0,
      this.switchColour = kHighlightedToggleRed,
      required this.onChanged,
      required this.onValueChanged})
      : super(key: key);

  Function(int?) onValueChanged;
  String title;
  int? indexPosition;
  bool isActive;
  double upperBoxHeight;
  Color switchColour;
  Function(String) onChanged;

  @override
  _AgeToggleSwitchPaedsState createState() => _AgeToggleSwitchPaedsState();
}

class _AgeToggleSwitchPaedsState extends State<AgeToggleSwitchPaeds> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: widget.upperBoxHeight),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 80,
                  child: Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(
                  width: 90,
                  height: 30,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    onChanged: widget.onChanged,
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 1,
                  ),
                ),
              ],
            ),

            // Container(
            //   decoration: BoxDecoration(
            //     color: kBackgroundToggleGrey,
            //     borderRadius: BorderRadius.circular(10),
            //   ),
            //
            //   child: ToggleButtons(
            //     textStyle: const TextStyle(
            //         fontWeight: FontWeight.w400,
            //         fontSize: 15
            //     ),
            //     constraints: const BoxConstraints(minHeight: 30, minWidth: 70),
            //     borderRadius: BorderRadius.circular(10),
            //     selectedBorderColor: kBackgroundToggleGrey,
            //     borderColor: kBackgroundToggleGrey,
            //     selectedColor: Colors.black,
            //     renderBorder: true,
            //     fillColor: widget.switchColour,
            //     children: const <Widget>[
            //       Text('Months'),
            //       Text('Years'),
            //     ],
            //     onPressed: widget.isActive?(int index)
            //     {
            //
            //       setState(() {
            //         for (int buttonIndex = 0; buttonIndex < widget.isSelected.length; buttonIndex++) {
            //           if (buttonIndex == index) {
            //             widget.isSelected[buttonIndex] = true;
            //           } else {
            //             widget.isSelected[buttonIndex] = false;
            //           }
            //         }
            //       });
            //       widget.notifyParent();
            //     }:null,
            //     isSelected: widget.isSelected,
            //   ),
            // ),
            CupertinoSlidingSegmentedControl<int>(
              groupValue: widget.indexPosition,
              children: const {
                0: Text('Months'),
                1: Text('Years'),
              },
              onValueChanged: widget.onValueChanged,
              thumbColor: widget.switchColour,
              backgroundColor: kBackgroundToggleGrey,
            ),
          ],
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}

class AmiOrGentCalculateScreen extends StatefulWidget {
  AmiOrGentCalculateScreen(
      {Key? key,
      required this.isMale,
      required this.isAKI,
      required this.akiType,
      required this.onValueChangedAKIType,
      required this.inputAge,
      required this.inputCreatinine,
      required this.inputHeight,
      required this.inputWeight,
      required this.title,
      required this.dosePressed,
      required this.onSubmittedHeight,
      required this.onSubmittedWeight,
      required this.onSubmittedAge,
      required this.onSubmittedCreatinine,
      required this.doseOutput,
      required this.creatinineClearanceOutput,
      required this.idealBodyWeightOutput,
      required this.onValueChangedSex,
      required this.onValueChangedAKI,
      required this.resetPressed,
      required this.fieldTextHeight,
      required this.fieldTextWeight,
      required this.fieldTextAge,
      required this.fieldTextCreatinine})
      : super(key: key);

  int? isMale;
  int? isAKI;
  int? akiType;
  Function(int?) onValueChangedSex;
  Function(int?) onValueChangedAKI;
  Function(int?) onValueChangedAKIType;
  String inputWeight;
  String inputHeight;
  String inputAge;
  String inputCreatinine;
  String title;
  Function() dosePressed;
  Function() resetPressed;
  Function(String) onSubmittedHeight;
  Function(String) onSubmittedWeight;
  Function(String) onSubmittedAge;
  Function(String) onSubmittedCreatinine;
  String doseOutput;
  String creatinineClearanceOutput;
  String idealBodyWeightOutput;
  TextEditingController fieldTextHeight;
  TextEditingController fieldTextWeight;
  TextEditingController fieldTextAge;
  TextEditingController fieldTextCreatinine;

  @override
  _AmiOrGentCalculateScreenState createState() =>
      _AmiOrGentCalculateScreenState();
}

class _AmiOrGentCalculateScreenState extends State<AmiOrGentCalculateScreen> {
  @override
  Widget build(BuildContext context) {
    return DosingEndPage(
      pageTitle: widget.title,
      antibioticTextOutput1:
          "Dose of Amikacin\n\nCreatinine Clearance\n\nIdeal Body Weight (IBW)",
      antibioticTextOutput2:
          '= ${widget.doseOutput}\n\n= ${widget.creatinineClearanceOutput}\n\n= ${widget.idealBodyWeightOutput}',
      topPanelColour: kDosingGreen,
      toggleBox1: WeightOrHeightEntryPaeds(
          fieldText: widget.fieldTextHeight,
          title: "1. Height",
          units: "cm",
          onChanged: widget.onSubmittedHeight),
      toggleBox2: WeightOrHeightEntryPaeds(
        fieldText: widget.fieldTextWeight,
        title: "2. Weight",
        units: "kg",
        onChanged: widget.onSubmittedWeight,
      ),
      toggleBox3: WeightOrHeightEntryPaeds(
        fieldText: widget.fieldTextAge,
        title: "3. Age",
        units: "",
        onChanged: widget.onSubmittedAge,
      ),
      toggleBox4: WeightOrHeightEntryPaeds(
        fieldText: widget.fieldTextCreatinine,
        title: "4. Creat",
        units: "",
        onChanged: widget.onSubmittedCreatinine,
      ),
      toggleBox5: DosingDoubleToggle(
        title: "5. Sex",
        firstToggleText: 'Male',
        secondToggleText: 'Female',
        indexPosition: widget.isMale,
        onValueChanged: widget.onValueChangedSex,
      ),
      toggleBox6: DosingDoubleToggle(
        title: "6. AKI",
        firstToggleText: 'No',
        secondToggleText: 'Yes',
        indexPosition: widget.isAKI,
        onValueChanged: widget.onValueChangedAKI,
        button1: MaterialButton(
          height: 30,
          splashColor: Colors.grey,
          highlightColor: Colors.white,
          child: const Text('Reset',
              style: TextStyle(
                color: kIconLightGrey,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              )),
          onPressed: widget.resetPressed,
        ),
        button2: MaterialButton(
          height: 30,
          color: kHighlightedToggleRed,
          splashColor: kIconLightGrey,
          highlightColor: kHighlightedToggleRed,
          elevation: 0,
          highlightElevation: 0,
          child: const Text(
            "Dose",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ),
          onPressed: widget.dosePressed,
        ),
      ),
      toggleBox7: TripleSwitchFullWidth(
        indexPosition: widget.akiType,
        onValueChanged: widget.onValueChangedAKIType,
        firstText: '2nd Sepsis',
        secondText: 'CKD 2nd Sepsis',
        thirdText: 'Not Sepsis',
        switchColour: kHighlightedToggleRed,
        isActive: true,
      ),
    );
  }
}

class BloodCulturesEndPage extends StatelessWidget {
  BloodCulturesEndPage({
    Key? key,
    required this.title,
    this.titleBoxColour = kResultsInterpretationPink,
    this.lowerTitle = 'Information',
    required this.selectionTitles,
    required this.onSelectedItemChanged,
    required this.notifyParent,
    this.subtitleBoxColour = kSurgicalLightOrange,
    this.firstTextArea,
    this.secondTextArea,
    this.thirdTextArea,
    this.extraWidget,
  }) : super(key: key);

  String title;
  Color titleBoxColour;
  Color subtitleBoxColour;
  String lowerTitle;
  List<Widget> selectionTitles;
  Function(int) onSelectedItemChanged;
  Function notifyParent;
  Widget? firstTextArea;
  Widget? secondTextArea;
  Widget? thirdTextArea;
  Widget? extraWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0.0,
            toolbarHeight: 45.0,
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: const Icon(
                CupertinoIcons.chevron_left,
                size: 22.0,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: SizedBox.expand(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 35,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      color: titleBoxColour,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                        child: Text(
                          title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Container(),
                  Column(
                    children: [
                      Container(
                        child: extraWidget,
                      ),
                      Container(
                        color: titleBoxColour,
                        child: Container(
                          color: Colors.white,
                          margin: const EdgeInsets.all(1),
                          child: SizedBox(
                            width: double.infinity,
                            height: 130,
                            child: ListWheelScrollView(
                              controller: FixedExtentScrollController(
                                initialItem: 0,
                              ),
                              physics: const FixedExtentScrollPhysics(),
                              //perspective: 0.01,
                              overAndUnderCenterOpacity: 0.3,
                              diameterRatio: 1.0,
                              magnification: 1.2,
                              clipBehavior: Clip.none,
                              onSelectedItemChanged: onSelectedItemChanged,
                              itemExtent: 30,
                              squeeze: 2,
                              children: selectionTitles,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Container(child: firstTextArea),
                  Container(child: secondTextArea),
                  Container(child: thirdTextArea),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ClassicEndPage extends StatelessWidget {
  ClassicEndPage({
    Key? key,
    required this.pageTitle,
    this.topPanelColour = kAdultGuidelinesGreen,
    this.titleTextColour = Colors.white,
    this.topRedBox,
    this.toggleBox1,
    this.toggleBox2,
    this.toggleBox3,
    this.toggleBox4,
    this.toggleBox5,
    this.toggleBox6,
    this.toggleBox7,
    this.toggleBox8,
    this.toggleBox9,
    this.antibioticSelectionFunction,
    required this.antibioticTextOutput,
    this.penicillinToggle,
    this.widgetSpacing = 15,
  }) : super(key: key);

  String pageTitle;
  Color topPanelColour;
  Color titleTextColour;
  Widget? topRedBox;
  Widget? toggleBox1;
  Widget? toggleBox2;
  Widget? toggleBox3;
  Widget? toggleBox4;
  Widget? toggleBox5;
  Widget? toggleBox6;
  Widget? toggleBox7;
  Widget? toggleBox8;
  Widget? toggleBox9;
  Widget? penicillinToggle;

  Function? antibioticSelectionFunction;
  String antibioticTextOutput;
  double widgetSpacing;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0.0,
            toolbarHeight: 45.0,
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: const Icon(
                CupertinoIcons.chevron_left,
                size: 22.0,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: Container(
                    color: topPanelColour,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                          child: Text(
                            pageTitle,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 15.5,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          color: Colors.white,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                CupertinoIcons.phone_circle_fill,
                                color: topPanelColour,
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Icon(
                                CupertinoIcons.doc_text_fill,
                                color: topPanelColour,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: widgetSpacing,
                ),
                Container(child: topRedBox),
                SizedBox(
                  height: widgetSpacing,
                ),
                Column(
                  children: [
                    Container(
                      child: toggleBox1,
                    ),
                    Container(
                      child: toggleBox2,
                    ),
                    Container(
                      child: toggleBox3,
                    ),
                    Container(
                      child: toggleBox4,
                    ),
                    Container(
                      child: toggleBox5,
                    ),
                    Container(
                      child: toggleBox6,
                    ),
                    Container(
                      child: toggleBox7,
                    ),
                    Container(
                      child: toggleBox8,
                    ),
                    Container(
                      child: toggleBox9,
                    ),
                    Container(child: penicillinToggle),
                  ],
                ),
                SizedBox(
                  height: widgetSpacing,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 30,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    color: topPanelColour,
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                      child: Text(
                        'Regimen',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 15.5,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: widgetSpacing,
                ),
                Expanded(
                  child: Scrollbar(
                    isAlwaysShown: true,
                    radius: const Radius.circular(10),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                        child: RichText(
                          text: TextSpan(
                            children: Functions().antibioticHighlighter(
                                antibioticTextOutput, 13),

                            //isSelected1[0]&&isSelected2[0]?antibioticTextInput[0]:isSelected1[0]&&isSelected2[1]?antibioticTextInput[1]:isSelected1[1]&&isSelected2[1]?antibioticTextInput[2]:antibioticTextInput[3]),
                          ),
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

class ColourTitleBar extends StatelessWidget {
  const ColourTitleBar(
      {Key? key,
      required this.boxHeight,
      required this.boxFontSize,
      required this.colour,
      required this.barText,
      this.barTextColour = Colors.white,
      this.topSpacerHeight = 15})
      : super(key: key);

  final Color colour;
  final double boxHeight;
  final double boxFontSize;
  final String barText;
  final Color barTextColour;
  final double topSpacerHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: topSpacerHeight),
        SizedBox(
          width: double.infinity,
          height: boxHeight,
          child: Container(
            alignment: Alignment.centerLeft,
            color: colour,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
              child: Text(
                barText,
                style: TextStyle(
                  color: barTextColour,
                  fontWeight: FontWeight.w500,
                  fontSize: boxFontSize,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}

class CustomTextDoubleSwitch extends StatefulWidget {
  CustomTextDoubleSwitch(
      {Key? key,
      required this.title,
      required this.indexPosition,
      required this.onValueChanged,
      this.isActive = true,
      this.upperBoxHeight = 0,
      this.switchColour = kHighlightedToggleRed,
      required this.firstText,
      required this.secondText,
      this.minWidth = 40})
      : super(key: key);

  Function(int?) onValueChanged;
  String title;
  int? indexPosition;
  bool isActive;
  double upperBoxHeight;
  Color switchColour;
  String firstText;
  String secondText;
  double minWidth;

  @override
  _CustomTextDoubleSwitchState createState() => _CustomTextDoubleSwitchState();
}

class _CustomTextDoubleSwitchState extends State<CustomTextDoubleSwitch> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: widget.upperBoxHeight),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            CupertinoSlidingSegmentedControl<int>(
              groupValue: widget.indexPosition,
              children: {
                0: Container(
                  alignment: Alignment.center,
                  constraints:
                      BoxConstraints.expand(width: widget.minWidth, height: 30),
                  child: Text(
                    widget.firstText,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 13,
                    ),
                  ),
                ),
                1: Container(
                  alignment: Alignment.center,
                  constraints:
                      BoxConstraints.expand(width: widget.minWidth, height: 30),
                  child: Text(
                    widget.secondText,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 13,
                    ),
                  ),
                ),
              },
              onValueChanged: widget.onValueChanged,
              thumbColor: widget.switchColour,
              backgroundColor: kBackgroundToggleGrey,
            ),
          ],
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}

class DosingDoubleToggle extends StatefulWidget {
  DosingDoubleToggle(
      {Key? key,
      required this.title,
      required this.indexPosition,
      required this.onValueChanged,
      this.isActive = true,
      this.upperBoxHeight = 0,
      this.switchColour = kHighlightedToggleRed,
      this.button1,
      this.button2,
      required this.firstToggleText,
      required this.secondToggleText})
      : super(key: key);

  Function(int?) onValueChanged;
  String title;
  int? indexPosition;
  bool isActive;
  double upperBoxHeight;
  Color switchColour;
  Widget? button1;
  Widget? button2;
  String firstToggleText;
  String secondToggleText;

  @override
  _DosingDoubleToggleState createState() => _DosingDoubleToggleState();
}

class _DosingDoubleToggleState extends State<DosingDoubleToggle> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: widget.upperBoxHeight),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 80,
                      child: Text(
                        widget.title,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    CupertinoSlidingSegmentedControl<int>(
                      groupValue: widget.indexPosition,
                      children: {
                        0: Text(
                          widget.firstToggleText,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        1: Text(
                          widget.secondToggleText,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      },
                      onValueChanged: widget.onValueChanged,
                      thumbColor: widget.switchColour,
                      backgroundColor: kBackgroundToggleGrey,
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Container(child: widget.button1),
                Container(child: widget.button2),
              ],
            ),
          ],
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}

class DosingEndPage extends StatelessWidget {
  DosingEndPage({
    Key? key,
    required this.pageTitle,
    this.topPanelColour = kResultsInterpretationPink,
    this.titleTextColour = Colors.white,
    this.topRedBox,
    this.toggleBox1,
    this.toggleBox2,
    this.toggleBox3,
    this.toggleBox4,
    this.toggleBox5,
    this.toggleBox6,
    this.toggleBox7,
    this.toggleBox8,
    this.toggleBox9,
    this.antibioticSelectionFunction,
    required this.antibioticTextOutput1,
    this.widgetSpacing = 10,
    required this.antibioticTextOutput2,
  }) : super(key: key);

  final String pageTitle;
  final Color topPanelColour;
  final Color titleTextColour;
  final Widget? topRedBox;
  final Widget? toggleBox1;
  final Widget? toggleBox2;
  final Widget? toggleBox3;
  final Widget? toggleBox4;
  final Widget? toggleBox5;
  final Widget? toggleBox6;
  final Widget? toggleBox7;
  final Widget? toggleBox8;
  final Widget? toggleBox9;

  final Function? antibioticSelectionFunction;
  final String antibioticTextOutput1;
  final String antibioticTextOutput2;
  final double widgetSpacing;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: Container(
                    color: topPanelColour,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                          child: Text(
                            pageTitle,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 15.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: widgetSpacing,
                ),
                Container(child: topRedBox),
                SizedBox(
                  height: widgetSpacing,
                ),
                Column(
                  children: [
                    Container(
                      child: toggleBox1,
                    ),
                    Container(
                      child: toggleBox2,
                    ),
                    Container(
                      child: toggleBox3,
                    ),
                    Container(
                      child: toggleBox4,
                    ),
                    Container(
                      child: toggleBox5,
                    ),
                    Container(
                      child: toggleBox6,
                    ),
                    Container(
                      child: toggleBox7,
                    ),
                    Container(
                      child: toggleBox8,
                    ),
                    Container(
                      child: toggleBox9,
                    ),
                  ],
                ),
                SizedBox(
                  height: widgetSpacing,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 30,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    color: kLightRed,
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                      child: Text(
                        'Information',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 15.5,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: widgetSpacing,
                ),
                Container(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                        child: Text(antibioticTextOutput1),

                        //isSelected1[0]&&isSelected2[0]?antibioticTextInput[0]:isSelected1[0]&&isSelected2[1]?antibioticTextInput[1]:isSelected1[1]&&isSelected2[1]?antibioticTextInput[2]:antibioticTextInput[3]),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                        child: Text(
                          antibioticTextOutput2,
                          overflow: TextOverflow.ellipsis,
                        ),

                        //isSelected1[0]&&isSelected2[0]?antibioticTextInput[0]:isSelected1[0]&&isSelected2[1]?antibioticTextInput[1]:isSelected1[1]&&isSelected2[1]?antibioticTextInput[2]:antibioticTextInput[3]),
                      ),
                    ],
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

class DoubleSwitchFullWidth extends StatefulWidget {
  DoubleSwitchFullWidth(
      {Key? key,
      required this.indexPosition,
      required this.onValueChanged,
      this.firstText = "First-Line",
      this.secondText = "Penicillin Allergy",
      this.switchColour = kHighlightedToggleYellow})
      : super(key: key);

  int? indexPosition;
  Function(int?) onValueChanged;
  String firstText;
  String secondText;
  Color switchColour;

  @override
  _DoubleSwitchFullWidthState createState() => _DoubleSwitchFullWidthState();
}

class _DoubleSwitchFullWidthState extends State<DoubleSwitchFullWidth> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LayoutBuilder(
          builder: (context, constraints) =>
              CupertinoSlidingSegmentedControl<int>(
            groupValue: widget.indexPosition,
            children: {
              0: Container(
                alignment: Alignment.center,
                constraints: BoxConstraints.expand(
                    width: constraints.maxWidth / 2.05, height: 30),
                child: Text(
                  widget.firstText,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 13,
                  ),
                ),
              ),
              1: Container(
                alignment: Alignment.center,
                constraints: BoxConstraints.expand(
                    width: constraints.maxWidth / 2.05, height: 30),
                child: Text(
                  widget.secondText,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 13,
                  ),
                ),
              ),
            },
            onValueChanged: widget.onValueChanged,
            thumbColor: widget.switchColour,
            backgroundColor: kBackgroundToggleGrey,
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

class MenuTile extends StatelessWidget {
  const MenuTile(
      {Key? key,
      this.tileTitle = '',
      this.leadingIcon,
      required this.navigateTo,
      this.leadingPadding = 0.0,
      this.minLeadingWidth = 0.0,
      this.tileColour = Colors.white,
      this.trailingIconColour = kIconLightGrey,
      this.titleTextColour = Colors.black,
      this.tileIsDense = true,
      this.iconSize = 0.0})
      : super(key: key);

  final String tileTitle;
  final Widget? leadingIcon;
  final Widget navigateTo;
  final double leadingPadding;
  final double minLeadingWidth;
  final Color tileColour;
  final Color trailingIconColour;
  final Color titleTextColour;
  final bool tileIsDense;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: tileColour,
      contentPadding: EdgeInsets.fromLTRB(leadingPadding, 0, 15, 0),
      //horizontalTitleGap: 30.0,
      minLeadingWidth: minLeadingWidth,
      leading: leadingIcon,
      title: Text(
        tileTitle,
        style: TextStyle(
          color: titleTextColour,
          fontSize: 15.0,
        ),
      ),
      trailing: Icon(
        CupertinoIcons.chevron_right,
        size: 20.0,
        color: trailingIconColour,
      ),

      dense: tileIsDense,
      onTap: () {
        Navigator.push(context, CupertinoPageRoute(builder: (context) {
          return navigateTo;
        }));
      },
    );
  }
}

class QuadSwtichFullWidth extends StatefulWidget {
  QuadSwtichFullWidth(
      {Key? key,
      required this.indexPosition,
      required this.onValueChanged,
      required this.firstText,
      required this.secondText,
      required this.thirdText,
      required this.fourthText,
      this.switchColour = kHighlightedToggleYellow})
      : super(key: key);

  int? indexPosition;
  Function(int?) onValueChanged;
  String firstText, secondText, thirdText, fourthText;
  Color switchColour;

  @override
  _QuadSwtichFullWidthState createState() => _QuadSwtichFullWidthState();
}

class _QuadSwtichFullWidthState extends State<QuadSwtichFullWidth> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LayoutBuilder(
          builder: (context, constraints) =>
              CupertinoSlidingSegmentedControl<int>(
            groupValue: widget.indexPosition,
            children: {
              0: Container(
                alignment: Alignment.center,
                constraints: BoxConstraints.expand(
                    width: constraints.maxWidth / 4.05, height: 30),
                child: Text(
                  widget.firstText,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 13,
                  ),
                ),
              ),
              1: Container(
                alignment: Alignment.center,
                constraints: BoxConstraints.expand(
                    width: constraints.maxWidth / 4.05, height: 30),
                child: Text(
                  widget.secondText,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 13,
                  ),
                ),
              ),
              2: Container(
                alignment: Alignment.center,
                constraints: BoxConstraints.expand(
                    width: constraints.maxWidth / 4.05, height: 30),
                child: Text(
                  widget.thirdText,
                  style: const TextStyle(
                    fontSize: 13,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              3: Container(
                alignment: Alignment.center,
                constraints: BoxConstraints.expand(
                    width: constraints.maxWidth / 4.05, height: 30),
                child: Text(
                  widget.fourthText,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 13,
                  ),
                ),
              ),
            },
            onValueChanged: widget.onValueChanged,
            thumbColor: widget.switchColour,
            backgroundColor: kBackgroundToggleGrey,
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

class TopColourBox extends StatelessWidget {
  const TopColourBox({
    Key? key,
    required this.boxColour,
    required this.boxText,
    this.trailingTopBoxIcon,
  }) : super(key: key);

  final Color boxColour;
  final String boxText;
  final Widget? trailingTopBoxIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130.0,
      child: Container(
          color: boxColour,
          padding: const EdgeInsets.fromLTRB(30.0, 0, 15, 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                boxText,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 28,
                  color: Colors.white,
                ),
              ),
              Container(child: trailingTopBoxIcon),
            ],
          )),
    );
  }
}

class ToggleSwitchQuad extends StatefulWidget {
  ToggleSwitchQuad(
      {Key? key,
      required this.title,
      required this.indexPosition,
      required this.onValueChanged,
      this.isActive = true,
      this.upperBoxHeight = 0,
      required this.firstText,
      required this.secondText,
      required this.thirdText,
      required this.fourthText,
      required this.switchColour,
      this.buttonSpecificFontSize1 = 15,
      this.buttonSpecificFontSize2 = 15,
      this.buttonSpecificFontSize3 = 15,
      this.minWidth = 35})
      : super(key: key);

  Function(int?) onValueChanged;
  String title;
  int? indexPosition;
  bool isActive;
  double upperBoxHeight;
  String firstText;
  String secondText;
  String thirdText;
  String fourthText;
  Color switchColour;
  double buttonSpecificFontSize1;
  double buttonSpecificFontSize2;
  double buttonSpecificFontSize3;
  double minWidth;

  @override
  _ToggleSwitchQuadState createState() => _ToggleSwitchQuadState();
}

class _ToggleSwitchQuadState extends State<ToggleSwitchQuad> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: widget.upperBoxHeight),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
            ),
            CupertinoSlidingSegmentedControl<int>(
              groupValue: widget.indexPosition,
              children: {
                0: Container(
                  alignment: Alignment.center,
                  constraints:
                      BoxConstraints.expand(width: widget.minWidth, height: 30),
                  child: Text(
                    widget.firstText,
                    style: const TextStyle(
                      fontSize: 12.5,
                    ),
                  ),
                ),
                1: Container(
                  alignment: Alignment.center,
                  constraints:
                      BoxConstraints.expand(width: widget.minWidth, height: 30),
                  child: Text(
                    widget.secondText,
                    style: const TextStyle(
                      fontSize: 12.5,
                    ),
                  ),
                ),
                2: Container(
                  alignment: Alignment.center,
                  constraints:
                      BoxConstraints.expand(width: widget.minWidth, height: 30),
                  child: Text(
                    widget.thirdText,
                    style: const TextStyle(
                      fontSize: 12.5,
                    ),
                  ),
                ),
                3: Container(
                  alignment: Alignment.center,
                  constraints:
                      BoxConstraints.expand(width: widget.minWidth, height: 30),
                  child: Text(
                    widget.fourthText,
                    style: const TextStyle(
                      fontSize: 12.5,
                    ),
                  ),
                ),
              },
              onValueChanged: widget.onValueChanged,
              thumbColor: widget.switchColour,
              backgroundColor: kBackgroundToggleGrey,
            ),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

class ToggleSwitchTriple extends StatefulWidget {
  ToggleSwitchTriple(
      {Key? key,
      required this.title,
      required this.indexPosition,
      required this.onValueChanged,
      this.isActive = true,
      this.upperBoxHeight = 0,
      required this.firstText,
      required this.secondText,
      required this.thirdText,
      required this.switchColour,
      this.buttonSpecificFontSize1 = 15,
      this.buttonSpecificFontSize2 = 15,
      this.buttonSpecificFontSize3 = 15,
      this.minWidth = 60})
      : super(key: key);

  Function(int?) onValueChanged;
  String title;
  int? indexPosition;
  bool isActive;
  double upperBoxHeight;
  String firstText;
  String secondText;
  String thirdText;
  Color switchColour;
  double buttonSpecificFontSize1;
  double buttonSpecificFontSize2;
  double buttonSpecificFontSize3;
  double minWidth;

  @override
  _ToggleSwitchTripleState createState() => _ToggleSwitchTripleState();
}

class _ToggleSwitchTripleState extends State<ToggleSwitchTriple> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: widget.upperBoxHeight),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            CupertinoSlidingSegmentedControl<int>(
              groupValue: widget.indexPosition,
              children: {
                0: Container(
                  alignment: Alignment.center,
                  constraints:
                      BoxConstraints.expand(width: widget.minWidth, height: 30),
                  child: Text(
                    widget.firstText,
                    style: const TextStyle(
                      fontSize: 13,
                    ),
                  ),
                ),
                1: Container(
                  alignment: Alignment.center,
                  constraints:
                      BoxConstraints.expand(width: widget.minWidth, height: 30),
                  child: Text(
                    widget.secondText,
                    style: const TextStyle(
                      fontSize: 13,
                    ),
                  ),
                ),
                2: Container(
                  alignment: Alignment.center,
                  constraints:
                      BoxConstraints.expand(width: widget.minWidth, height: 30),
                  child: Text(
                    widget.thirdText,
                    style: const TextStyle(
                      fontSize: 13,
                    ),
                  ),
                ),
              },
              onValueChanged: widget.onValueChanged,
              thumbColor: widget.switchColour,
              backgroundColor: kBackgroundToggleGrey,
            ),
          ],
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}

class TickerTile extends StatelessWidget {
  TickerTile({
    Key? key,
    required this.title,
  }) : super(key: key);

  String title;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 14.0,
        ),
      ),
    );
  }
}

class TripleSwitchFullWidth extends StatefulWidget {
  TripleSwitchFullWidth({
    Key? key,
    required this.indexPosition,
    required this.onValueChanged,
    this.firstText = "First-Line",
    this.secondText = "Penicillin Allergy",
    this.thirdText = "MRSA positive",
    this.switchColour = kHighlightedToggleYellow,
    this.isActive = true,
    this.minSpacerHeight = 10,
  }) : super(key: key);

  int? indexPosition;
  Function(int?) onValueChanged;
  String firstText;
  String secondText;
  String thirdText;
  Color switchColour;
  bool isActive;
  double minSpacerHeight;

  @override
  _TripleSwitchFullWidthState createState() => _TripleSwitchFullWidthState();
}

class _TripleSwitchFullWidthState extends State<TripleSwitchFullWidth> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LayoutBuilder(
          builder: (context, constraints) => CupertinoSlidingSegmentedControl(
            groupValue: widget.indexPosition,
            children: {
              0: Container(
                alignment: Alignment.center,
                constraints: BoxConstraints.expand(
                    width: constraints.maxWidth / 3.05, height: 30),
                child: Text(
                  widget.firstText,
                  style: const TextStyle(
                    fontSize: 13,
                  ),
                ),
              ),
              1: Container(
                alignment: Alignment.center,
                constraints: BoxConstraints.expand(
                    width: constraints.maxWidth / 3.05, height: 30),
                child: Text(
                  widget.secondText,
                  style: const TextStyle(
                    fontSize: 13,
                  ),
                ),
              ),
              2: Container(
                alignment: Alignment.center,
                constraints: BoxConstraints.expand(
                    width: constraints.maxWidth / 3.05, height: 30),
                child: Text(
                  widget.thirdText,
                  style: const TextStyle(
                    fontSize: 13,
                  ),
                ),
              ),
            },
            onValueChanged: widget.onValueChanged,
            thumbColor: widget.switchColour,
            backgroundColor: kBackgroundToggleGrey,
          ),
        ),
        SizedBox(height: widget.minSpacerHeight),
      ],
    );
  }
}

class TopRedInfoBox extends StatelessWidget {
  TopRedInfoBox(
      {Key? key,
      this.height = 100.0,
      this.textInput = '',
      this.textAlignment = Alignment.center,
      this.verticalPadding = 10,
      this.horizontalPadding = 25,
      this.boxColour = kTextBoxRed})
      : super(key: key);

  double height;
  String textInput;
  Alignment textAlignment;
  double verticalPadding;
  double horizontalPadding;
  Color boxColour;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: Container(
        color: boxColour,
        alignment: textAlignment,
        padding: EdgeInsets.symmetric(
            vertical: verticalPadding, horizontal: horizontalPadding),
        child: Text(textInput,
            textAlign: TextAlign.justify,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            )),
      ),
    );
  }
}

class PenicillinToggle extends StatefulWidget {
  PenicillinToggle(
      {Key? key,
      required this.isPenicillinAllergic,
      required this.notifyParent,
      required this.isSelected,
      this.boxColour = kTextBoxRed,
      this.switchColour = kHighlightedToggleRed,
      this.titleText = "Penicillin",
      this.firstText = "Anaphylaxis",
      this.secondText = "Rash",
      this.bottomHeight = 0})
      : super(key: key);

  bool isPenicillinAllergic;
  Function notifyParent;
  List<bool> isSelected;
  Color boxColour;
  Color switchColour;
  String titleText;
  String firstText;
  String secondText;
  double bottomHeight;

  @override
  _PenicillinToggleState createState() => _PenicillinToggleState();
}

class _PenicillinToggleState extends State<PenicillinToggle> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              color: widget.boxColour,
              padding: const EdgeInsets.all(10),
              child: Text(
                widget.titleText,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: kBackgroundToggleGrey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ToggleButtons(
                textStyle:
                    const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                constraints: const BoxConstraints(minHeight: 30, minWidth: 100),
                borderRadius: BorderRadius.circular(10),
                selectedBorderColor: kBackgroundToggleGrey,
                borderColor: kBackgroundToggleGrey,
                selectedColor: Colors.black,
                renderBorder: true,
                fillColor: widget.switchColour,
                children: <Widget>[
                  Text(widget.firstText),
                  Text(widget.secondText),
                ],
                onPressed: widget.isPenicillinAllergic
                    ? (int index) {
                        setState(() {
                          for (int buttonIndex = 0;
                              buttonIndex < widget.isSelected.length;
                              buttonIndex++) {
                            if (buttonIndex == index) {
                              widget.isSelected[buttonIndex] = true;
                            } else {
                              widget.isSelected[buttonIndex] = false;
                            }
                          }
                        });
                        widget.notifyParent();
                      }
                    : null,
                isSelected: widget.isSelected,
              ),
            ),
          ],
        ),
        SizedBox(height: widget.bottomHeight),
      ],
    );
  }
}

class PenicillinSlider extends StatefulWidget {
  PenicillinSlider(
      {Key? key,
      required this.indexPosition,
      this.boxColour = kTextBoxRed,
      this.switchColour = kHighlightedToggleRed,
      this.titleText = "Penicillin",
      this.firstText = "Anaphylaxis",
      this.secondText = "Rash",
      this.bottomHeight = 0,
      required this.onValueChanged})
      : super(key: key);

  int? indexPosition;
  Color boxColour;
  Color switchColour;
  String titleText;
  String firstText;
  String secondText;
  double bottomHeight;
  Function(int?) onValueChanged;

  @override
  _PenicillinSliderState createState() => _PenicillinSliderState();
}

class _PenicillinSliderState extends State<PenicillinSlider> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              color: widget.boxColour,
              padding: const EdgeInsets.all(10),
              child: Text(
                widget.titleText,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            CupertinoSlidingSegmentedControl<int>(
              groupValue: widget.indexPosition,
              children: {
                0: Text(widget.firstText),
                1: Text(widget.secondText),
              },
              thumbColor: widget.switchColour,
              onValueChanged: widget.onValueChanged,
              backgroundColor: kBackgroundToggleGrey,
            ),
          ],
        ),
        SizedBox(height: widget.bottomHeight),
      ],
    );
  }
}

class InfectionControlWithTopBoxEndPage extends StatelessWidget {
  const InfectionControlWithTopBoxEndPage({
    Key? key,
    required this.pageTitle,
    this.topPanelColour = kInfectionControlBlue,
    this.titleTextColour = Colors.white,
    this.topRedBox,
    this.toggleBox1,
    this.toggleBox2,
    this.toggleBox3,
    this.toggleBox4,
    this.toggleBox5,
    this.toggleBox6,
    this.toggleBox7,
    this.toggleBox8,
    this.toggleBox9,
    this.antibioticSelectionFunction,
    required this.antibioticTextOutput,
    required this.outputPanelTitle,
    required this.topPanelText,
    this.widgetSpacing = 15,
  }) : super(key: key);

  final String pageTitle;
  final Color topPanelColour;
  final Color titleTextColour;
  final Widget? topRedBox;
  final Widget? toggleBox1;
  final Widget? toggleBox2;
  final Widget? toggleBox3;
  final Widget? toggleBox4;
  final Widget? toggleBox5;
  final Widget? toggleBox6;
  final Widget? toggleBox7;
  final Widget? toggleBox8;
  final Widget? toggleBox9;

  final Function? antibioticSelectionFunction;
  final String antibioticTextOutput;
  final String outputPanelTitle;
  final String topPanelText;
  final double widgetSpacing;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0.0,
            toolbarHeight: 45.0,
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: const Icon(
                CupertinoIcons.chevron_left,
                size: 22.0,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: SizedBox.expand(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: Container(
                      color: topPanelColour,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                            child: Text(
                              pageTitle,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 15.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: widgetSpacing,
                  ),
                  Container(
                      color: kInfectionControlTopPurplePanel,
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Center(
                          child: AutoSizeText(
                            topPanelText,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )),
                  SizedBox(
                    height: widgetSpacing,
                  ),
                  Column(
                    children: [
                      Container(
                        child: toggleBox1,
                      ),
                      Container(
                        child: toggleBox2,
                      ),
                      Container(
                        child: toggleBox3,
                      ),
                      Container(
                        child: toggleBox4,
                      ),
                      Container(
                        child: toggleBox5,
                      ),
                      Container(
                        child: toggleBox6,
                      ),
                      Container(
                        child: toggleBox7,
                      ),
                      Container(
                        child: toggleBox8,
                      ),
                      Container(
                        child: toggleBox9,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: widgetSpacing,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 30,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      color: kInfectionControlBottomPanelGreen,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                        child: Text(
                          outputPanelTitle,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 15.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: widgetSpacing,
                  ),
                  Expanded(
                    child: Scrollbar(
                      isAlwaysShown: true,
                      radius: const Radius.circular(10),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                          child: Text(antibioticTextOutput),
                        ),
                      ),
                    ),

                    //isSelected1[0]&&isSelected2[0]?antibioticTextInput[0]:isSelected1[0]&&isSelected2[1]?antibioticTextInput[1]:isSelected1[1]&&isSelected2[1]?antibioticTextInput[2]:antibioticTextInput[3]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class InfectionControlWithTwoSubsections1EndPage extends StatelessWidget {
  const InfectionControlWithTwoSubsections1EndPage({
    Key? key,
    required this.pageTitle,
    this.topPanelColour = kInfectionControlBlue,
    this.titleTextColour = Colors.white,
    this.topRedBox,
    this.toggleBox1,
    this.toggleBox2,
    this.toggleBox3,
    this.toggleBox4,
    this.toggleBox5,
    this.toggleBox6,
    this.toggleBox7,
    this.toggleBox8,
    this.toggleBox9,
    this.antibioticSelectionFunction,
    required this.antibioticTextOutput,
    required this.outputPanelTitle,
    required this.subPanel1Text,
    required this.subPanel2Text,
    this.widgetSpacing = 15,
  }) : super(key: key);

  final String pageTitle;
  final Color topPanelColour;
  final Color titleTextColour;
  final Widget? topRedBox;
  final Widget? toggleBox1;
  final Widget? toggleBox2;
  final Widget? toggleBox3;
  final Widget? toggleBox4;
  final Widget? toggleBox5;
  final Widget? toggleBox6;
  final Widget? toggleBox7;
  final Widget? toggleBox8;
  final Widget? toggleBox9;

  final Function? antibioticSelectionFunction;
  final String antibioticTextOutput;
  final String outputPanelTitle;
  final String subPanel1Text;
  final String subPanel2Text;
  final double widgetSpacing;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          toolbarHeight: 45.0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(
              CupertinoIcons.chevron_left,
              size: 22.0,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SizedBox.expand(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: Container(
                    color: topPanelColour,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                          child: Text(
                            pageTitle,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 15.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: widgetSpacing,
                ),
                Container(
                    color: kInfectionControlTopPurplePanel,
                    height: MediaQuery.of(context).size.height * 0.03,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: AutoSizeText(
                        subPanel1Text,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    )),
                SizedBox(
                  height: widgetSpacing,
                ),
                Column(
                  children: [
                    Container(
                      child: toggleBox1,
                    ),
                    Container(
                      child: toggleBox2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.425,
                          height: MediaQuery.of(context).size.height * 0.035,
                          //color: Colors.grey,
                          child: const Center(
                              child: AutoSizeText('For Admission')),

                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(4),
                            ),
                            color: kInfectionControlButtonLightGrey,
                            shape: BoxShape.rectangle,
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.45,
                          height: MediaQuery.of(context).size.height * 0.035,
                          //color: Colors.grey,
                          child: const Center(
                              child: AutoSizeText('Not For Admission')),

                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(4),
                            ),
                            color: kInfectionControlButtonLightGrey,
                            shape: BoxShape.rectangle,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    color: kInfectionControlTopPurplePanel,
                    height: MediaQuery.of(context).size.height * 0.03,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: AutoSizeText(
                        subPanel2Text,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    )),
                SizedBox(
                  height: widgetSpacing,
                ),
                Column(
                  children: [
                    Container(
                      child: toggleBox3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.25,
                          height: MediaQuery.of(context).size.height * 0.035,
                          //color: Colors.grey,
                          child:
                              const Center(child: AutoSizeText('New Positive')),

                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(4),
                            ),
                            color: kInfectionControlButtonLightGrey,
                            shape: BoxShape.rectangle,
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.39,
                          height: MediaQuery.of(context).size.height * 0.035,
                          //color: Colors.grey,
                          child: const Center(
                              child: AutoSizeText('Established Positive')),

                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(4),
                            ),
                            color: kInfectionControlButtonLightGrey,
                            shape: BoxShape.rectangle,
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          height: MediaQuery.of(context).size.height * 0.035,
                          //color: Colors.grey,
                          child: const Center(child: AutoSizeText('At-risk')),

                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(4),
                            ),
                            color: kInfectionControlButtonLightGrey,
                            shape: BoxShape.rectangle,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 30,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    color: kInfectionControlBottomPanelGreen,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                      child: Text(
                        outputPanelTitle,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 15.5,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: widgetSpacing,
                ),
                Expanded(
                  child: Scrollbar(
                    isAlwaysShown: true,
                    radius: const Radius.circular(10),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                        child: Text(antibioticTextOutput),
                      ),
                    ),
                  ),
                  //isSelected1[0]&&isSelected2[0]?antibioticTextInput[0]:isSelected1[0]&&isSelected2[1]?antibioticTextInput[1]:isSelected1[1]&&isSelected2[1]?antibioticTextInput[2]:antibioticTextInput[3]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InfectionControlWithTwoSubsections2EndPage extends StatelessWidget {
  const InfectionControlWithTwoSubsections2EndPage({
    Key? key,
    required this.pageTitle,
    this.topPanelColour = kInfectionControlBlue,
    this.titleTextColour = Colors.white,
    this.topRedBox,
    this.toggleBox1,
    this.toggleBox2,
    this.toggleBox3,
    this.toggleBox4,
    this.toggleBox5,
    this.toggleBox6,
    this.toggleBox7,
    this.toggleBox8,
    this.toggleBox9,
    this.scroller1,
    this.scroller2,
    this.antibioticSelectionFunction,
    required this.antibioticTextOutput,
    required this.outputPanelTitle,
    required this.subPanel1Text,
    required this.subPanel2Text,
    required this.selectionTitles,
    required this.selectionTitles2,
    this.widgetSpacing = 15,
  }) : super(key: key);

  final String pageTitle;
  final Color topPanelColour;
  final Color titleTextColour;
  final Widget? topRedBox;
  final Widget? toggleBox1;
  final Widget? toggleBox2;
  final Widget? toggleBox3;
  final Widget? toggleBox4;
  final Widget? toggleBox5;
  final Widget? toggleBox6;
  final Widget? toggleBox7;
  final Widget? toggleBox8;
  final Widget? toggleBox9;
  final Widget? scroller1;
  final Widget? scroller2;

  final Function? antibioticSelectionFunction;
  final String antibioticTextOutput;
  final String outputPanelTitle;
  final String subPanel1Text;
  final String subPanel2Text;
  final double widgetSpacing;

  final List<Widget> selectionTitles;
  final List<Widget> selectionTitles2;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          toolbarHeight: 45.0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(
              CupertinoIcons.chevron_left,
              size: 22.0,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SizedBox.expand(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: Container(
                    color: topPanelColour,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                          child: Text(
                            pageTitle,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 15.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: widgetSpacing,
                ),
                Container(
                    color: kInfectionControlTopPurplePanel,
                    height: MediaQuery.of(context).size.height * 0.03,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: AutoSizeText(
                        subPanel1Text,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    )),
                SizedBox(
                  height: widgetSpacing,
                ),
                Container(
                  child: scroller1,
                ),
                SizedBox(
                  height: widgetSpacing,
                ),
                Container(
                    color: kInfectionControlTopPurplePanel,
                    height: MediaQuery.of(context).size.height * 0.03,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: AutoSizeText(
                        subPanel2Text,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    )),
                SizedBox(
                  height: widgetSpacing,
                ),
                Container(
                  child: scroller2,
                ),
                SizedBox(
                  height: widgetSpacing,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 30,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    color: kInfectionControlBottomPanelGreen,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                      child: Text(
                        outputPanelTitle,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 15.5,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: widgetSpacing,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                  child: Text(antibioticTextOutput),

                  //isSelected1[0]&&isSelected2[0]?antibioticTextInput[0]:isSelected1[0]&&isSelected2[1]?antibioticTextInput[1]:isSelected1[1]&&isSelected2[1]?antibioticTextInput[2]:antibioticTextInput[3]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ResultsInterpretationEndPage extends StatelessWidget {
  const ResultsInterpretationEndPage({
    Key? key,
    required this.pageTitle,
    this.topPanelColour = kResultsInterpretationPink,
    this.titleTextColour = Colors.white,
    this.topRedBox,
    this.toggleBox1,
    this.toggleBox2,
    this.toggleBox3,
    this.toggleBox4,
    this.toggleBox5,
    this.toggleBox6,
    this.toggleBox7,
    this.toggleBox8,
    this.toggleBox9,
    this.antibioticSelectionFunction,
    required this.antibioticTextOutput,
    this.widgetSpacing = 15,
  }) : super(key: key);

  final String pageTitle;
  final Color topPanelColour;
  final Color titleTextColour;
  final Widget? topRedBox;
  final Widget? toggleBox1;
  final Widget? toggleBox2;
  final Widget? toggleBox3;
  final Widget? toggleBox4;
  final Widget? toggleBox5;
  final Widget? toggleBox6;
  final Widget? toggleBox7;
  final Widget? toggleBox8;
  final Widget? toggleBox9;

  final Function? antibioticSelectionFunction;
  final String antibioticTextOutput;
  final double widgetSpacing;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0.0,
            toolbarHeight: 45.0,
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: const Icon(
                CupertinoIcons.chevron_left,
                size: 22.0,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: SizedBox.expand(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: Container(
                      color: topPanelColour,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                            child: Text(
                              pageTitle,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 15.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: widgetSpacing,
                  ),
                  Container(child: topRedBox),
                  SizedBox(
                    height: widgetSpacing,
                  ),
                  Column(
                    children: [
                      Container(
                        child: toggleBox1,
                      ),
                      Container(
                        child: toggleBox2,
                      ),
                      Container(
                        child: toggleBox3,
                      ),
                      Container(
                        child: toggleBox4,
                      ),
                      Container(
                        child: toggleBox5,
                      ),
                      Container(
                        child: toggleBox6,
                      ),
                      Container(
                        child: toggleBox7,
                      ),
                      Container(
                        child: toggleBox8,
                      ),
                      Container(
                        child: toggleBox9,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: widgetSpacing,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 30,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      color: kSubTitleDarkerYellow,
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                        child: Text(
                          'Information',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 15.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: widgetSpacing,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                    child: Text(antibioticTextOutput),

                    //isSelected1[0]&&isSelected2[0]?antibioticTextInput[0]:isSelected1[0]&&isSelected2[1]?antibioticTextInput[1]:isSelected1[1]&&isSelected2[1]?antibioticTextInput[2]:antibioticTextInput[3]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SpectraColoringTile extends StatelessWidget {
  SpectraColoringTile({
    Key? key,
    required this.title,
    required this.tileColour,
    required this.variableColour,
    this.fontWeight = FontWeight.w400,
    this.flex = 3,
    this.customTextColour = Colors.black,
  }) : super(key: key);

  final String title;
  final Color tileColour;
  Color variableColour;
  int flex;
  final FontWeight fontWeight;
  final Color customTextColour;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 2, horizontal: 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 8,
              child: Container(
                margin: const EdgeInsets.only(
                  right: 2.0,
                ),
                padding: const EdgeInsets.all(4),
                color: tileColour,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: fontWeight,
                      color: customTextColour,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.only(
                  left: 2.0,
                ),
                color: variableColour,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SubBarAndText extends StatelessWidget {
  const SubBarAndText(
      {Key? key,
      required this.lowerTitle,
      required this.outputText,
      required this.barColour})
      : super(key: key);

  final String lowerTitle;
  final String outputText;
  final Color barColour;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            height: 25,
            child: Container(
              alignment: Alignment.centerLeft,
              color: barColour,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                child: Text(
                  lowerTitle,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 15.0,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Text(
                outputText,
                textAlign: TextAlign.justify,
              ),
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
        ],
      ),
    );
  }
}

class SubMenuModule extends StatelessWidget {
  const SubMenuModule(
      {Key? key,
      required this.tileTitles,
      required this.tileNavigation,
      required this.topBoxColour,
      required this.topBoxText,
      this.tileLeadingIcon,
      this.topBoxTrailingIcon,
      this.leadingPadding = 20.0,
      this.iconSize = 0.0})
      : super(key: key);

  final List<String> tileTitles;
  final List<Widget> tileNavigation;
  final List<Widget>? tileLeadingIcon;
  final Widget? topBoxTrailingIcon;
  final Color topBoxColour;
  final String topBoxText;
  final double leadingPadding;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0.0,
            toolbarHeight: 45.0,
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: const Icon(
                CupertinoIcons.chevron_left,
                size: 22.0,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: SizedBox.expand(
            child: Column(
              children: [
                TopColourBox(
                  boxColour: topBoxColour,
                  boxText: topBoxText,
                  trailingTopBoxIcon: topBoxTrailingIcon,
                ),
                Expanded(
                  child: ListView.separated(
                    itemCount: tileTitles.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(left: leadingPadding),
                        child: MenuTile(
                          tileTitle: tileTitles[index],
                          navigateTo: tileNavigation[index],
                          leadingIcon: tileLeadingIcon?[index],
                          minLeadingWidth: 0.0,
                          //leadingPadding: leadingPadding,
                          iconSize: iconSize,
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider(
                        height: 0.0,
                        thickness: 1.5,
                        indent: 20.0,
                      );
                    },
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

class SurgicalProphylaxisEndPage extends StatefulWidget {
  SurgicalProphylaxisEndPage(
      {Key? key,
      required this.title,
      this.titleBoxColour = kSurgicalProphylaxisOrange,
      this.lowerTitle = 'Prophylaxis',
      required this.selectionTitles,
      required this.indexTicker,
      required this.abxSelection,
      required this.notifyParent,
      required this.antibioticTextOutput,
      required this.onSelectedItemChanged,
      required this.onValueChanged})
      : super(key: key);

  String title;
  Color titleBoxColour;
  String lowerTitle;
  List<Widget> selectionTitles;
  int? abxSelection;
  String antibioticTextOutput;
  int indexTicker;
  Function notifyParent;
  Function(int?) onValueChanged;
  Function(int) onSelectedItemChanged;

  @override
  State<SurgicalProphylaxisEndPage> createState() =>
      _SurgicalProphylaxisEndPageState();
}

class _SurgicalProphylaxisEndPageState
    extends State<SurgicalProphylaxisEndPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          toolbarHeight: 45.0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(
              CupertinoIcons.chevron_left,
              size: 22.0,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SizedBox.expand(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 35,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    color: widget.titleBoxColour,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                      child: Text(
                        widget.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  color: kSurgicalProphylaxisOrange,
                  child: Container(
                    color: Colors.white,
                    margin: EdgeInsets.all(1),
                    child: SizedBox(
                      width: double.infinity,
                      height: 150,
                      child: ListWheelScrollView(
                        controller: FixedExtentScrollController(
                          initialItem: 0,
                        ),
                        physics: FixedExtentScrollPhysics(),
                        //perspective: 0.01,
                        overAndUnderCenterOpacity: 0.3,
                        diameterRatio: 1.0,
                        magnification: 1.2,
                        clipBehavior: Clip.none,
                        onSelectedItemChanged: widget.onSelectedItemChanged,
                        itemExtent: 30,
                        squeeze: 2,
                        children: widget.selectionTitles,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TripleSwitchFullWidth(
                  indexPosition: widget.abxSelection,
                  onValueChanged: widget.onValueChanged,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 35,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    color: kSurgicalLightOrange,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                      child: Text(
                        widget.lowerTitle,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Expanded(
                  child: Scrollbar(
                    isAlwaysShown: true,
                    radius: const Radius.circular(10),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                        child: RichText(
                          text: TextSpan(
                            children: Functions().antibioticHighlighter(
                                widget.antibioticTextOutput, 13),

                            //isSelected1[0]&&isSelected2[0]?antibioticTextInput[0]:isSelected1[0]&&isSelected2[1]?antibioticTextInput[1]:isSelected1[1]&&isSelected2[1]?antibioticTextInput[2]:antibioticTextInput[3]),
                          ),
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

class WeightOrHeightEntryPaeds extends StatefulWidget {
  WeightOrHeightEntryPaeds(
      {Key? key,
      required this.title,
      this.upperBoxHeight = 0,
      this.switchColour = kHighlightedToggleRed,
      required this.onChanged,
      this.units = 'kg',
      required this.fieldText})
      : super(key: key);

  String title;
  double upperBoxHeight;
  Color switchColour;
  Function(String) onChanged;
  String units;
  TextEditingController fieldText;

  @override
  _WeightOrHeightEntryPaedsState createState() =>
      _WeightOrHeightEntryPaedsState();
}

class _WeightOrHeightEntryPaedsState extends State<WeightOrHeightEntryPaeds> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: widget.upperBoxHeight),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 80,
                  child: Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(
                  width: 90,
                  height: 30,
                  child: TextField(
                    controller: widget.fieldText,
                    keyboardType: TextInputType.number,
                    onChanged: widget.onChanged,
                    style: const TextStyle(
                      fontSize: 13,
                    ),
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    maxLines: 1,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  widget.units,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}

class YesNoToggleBasic extends StatefulWidget {
  YesNoToggleBasic(
      {Key? key,
      required this.title,
      required this.indexPosition,
      this.isActive = true,
      this.upperBoxHeight = 0,
      this.switchColour = kHighlightedToggleRed,
      required this.onValueChanged})
      : super(key: key);

  Function(int?) onValueChanged;
  String title;
  int? indexPosition;
  bool isActive;
  double upperBoxHeight;
  Color switchColour;
  @override
  _YesNoToggleBasicState createState() => _YesNoToggleBasicState();
}

class _YesNoToggleBasicState extends State<YesNoToggleBasic> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: widget.upperBoxHeight),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            CupertinoSlidingSegmentedControl<int>(
              groupValue: widget.indexPosition,
              children: const {
                0: Text('No'),
                1: Text('Yes'),
              },
              onValueChanged: widget.onValueChanged,
              thumbColor: widget.switchColour,
              backgroundColor: kBackgroundToggleGrey,
            ),
          ],
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}

class YesNoToggleSwitchBasic extends StatefulWidget {
  YesNoToggleSwitchBasic({
    Key? key,
    required this.title,
    required this.indexPosition,
    required this.notifyParent,
    this.isActive = true,
    this.upperBoxHeight = 0,
    this.switchColour = kHighlightedToggleRed,
  }) : super(key: key);

  Function notifyParent;
  String title;
  List<bool> indexPosition;
  bool isActive;
  double upperBoxHeight;
  Color switchColour;

  @override
  _YesNoToggleSwitchBasicState createState() => _YesNoToggleSwitchBasicState();
}

class _YesNoToggleSwitchBasicState extends State<YesNoToggleSwitchBasic> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: widget.upperBoxHeight),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: kBackgroundToggleGrey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ToggleButtons(
                textStyle:
                    const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                constraints: const BoxConstraints(minHeight: 30, minWidth: 60),
                borderRadius: BorderRadius.circular(10),
                selectedBorderColor: kBackgroundToggleGrey,
                borderColor: kBackgroundToggleGrey,
                selectedColor: Colors.black,
                renderBorder: true,
                fillColor: widget.switchColour,
                children: const <Widget>[
                  Text('No'),
                  Text('Yes'),
                ],
                onPressed: widget.isActive
                    ? (int index) {
                        setState(() {
                          for (int buttonIndex = 0;
                              buttonIndex < widget.indexPosition.length;
                              buttonIndex++) {
                            if (buttonIndex == index) {
                              widget.indexPosition[buttonIndex] = true;
                            } else {
                              widget.indexPosition[buttonIndex] = false;
                            }
                          }
                        });
                        widget.notifyParent();
                      }
                    : null,
                isSelected: widget.indexPosition,
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}

class YesNoToggleSwitchScoring extends StatefulWidget {
  YesNoToggleSwitchScoring(
      {Key? key,
      required this.title,
      required this.indexPosition,
      this.upperBoxHeight = 0,
      required this.onValueChanged,
      this.switchColour = kHighlightedToggleYellow})
      : super(key: key);

  Function(int?) onValueChanged;
  String title;
  int? indexPosition;
  double upperBoxHeight;
  Color switchColour;

  @override
  _YesNoToggleSwitchScoringState createState() =>
      _YesNoToggleSwitchScoringState();
}

class _YesNoToggleSwitchScoringState extends State<YesNoToggleSwitchScoring> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: widget.upperBoxHeight),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            CupertinoSlidingSegmentedControl<int>(
              groupValue: widget.indexPosition,
              children: const {
                0: Text('No'),
                1: Text('Yes'),
              },
              onValueChanged: widget.onValueChanged,
              thumbColor: widget.switchColour,
              backgroundColor: kBackgroundToggleGrey,
            ),
          ],
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
