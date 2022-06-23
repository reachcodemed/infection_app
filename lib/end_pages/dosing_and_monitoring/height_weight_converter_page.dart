import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infection/end_pages/dosing_and_monitoring/height_weight_converter_widget.dart';

class HeightAndWeightConverterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return       SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
          HeightAndWeightConverter(),
      ),
    );
  }
}
