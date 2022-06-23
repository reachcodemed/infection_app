import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../constants.dart';
import '../home_page.dart';

class OpeningPage extends StatelessWidget {
  const OpeningPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          //height: double.infinity,
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 60.0,

              horizontal: 40.0,
            ),
            color: kOpeningPageBlue,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Croydon',
                      style:TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: kTitleFontSize,
                      ),
                      ),
                      SizedBox(height: 8),
                      Text('Infection Guidelines',
                        style:TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text('© Code Med 2021',
                        style:TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: Colors.white,
                        ),),
                    ],
                  ),
                ),

                SizedBox(
                  width: 200,
                  height:200,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.white,
                    ),
                  ),
                ),

                 Align(
                   alignment: Alignment.centerRight,
                   child: SizedBox(
                     width: 100.0,
                     height: 40.0,
                     child: MaterialButton(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0,),
                        ),
                        child: const Center(
                          child: Text('START',
                            style: TextStyle(
                              color: kOpeningPageBlue,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                       onPressed: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context) {
                           return HomePage();
                         }));

                         },
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
