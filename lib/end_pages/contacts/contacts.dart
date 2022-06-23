import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/constants.dart';

class Contacts extends StatelessWidget {
  const Contacts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:20.0,vertical: 20.0,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:[
              SizedBox(
                width: double.infinity,
                height: 40,
                child:
                Container(
                  color: kContactsPageGrey,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,


                    children:  const [
                      Padding(
                        padding: EdgeInsets.fromLTRB(8,0,0,0),
                        child: Text('Contact Details',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 19.0,

                          ),),
                      ),


                    ],

                  ),
                ),
              ),


              Container(
                margin: const EdgeInsets.symmetric(vertical: 15,horizontal:5),
                decoration: BoxDecoration(
                  color: const Color(0xffbf3939),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:[
                    const Text('Clinical advice hotline ext 3421',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.local_phone,
                        color: Colors.white,
                        size: 22,
                      ),
                      onPressed: (){},
                    ),
                  ],
                ),
                ),
              ),

              Expanded(
                flex: 7,
                child: Container(
                  margin: const EdgeInsets.only(left: 5, right:5,),
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10,),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                    color:Color(0xffd4edff),
                  ),
                  child:
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: const [
                        Text('Microbiology Doctors',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xff54adff),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        )),
                        ContactsTextField(
                          name: 'Dr M Twagira',
                          extension: 'Ext 3388',
                          jobTitle: '(Clinical Lead and Infection Control Doctor)',
                        ),
                        ContactsTextField(
                            name: 'Dr I Qureshi',
                            extension: 'Ext 3453',
                            jobTitle: '(Antibiotic Stewardship and OPAT Lead)'),
                        ContactsTextField(
                            name: 'Dr M Sahathevan',
                            extension: 'Ext 3260',
                            jobTitle: '(Consultant Microbiologist)'),
                        ContactsTextField(
                            name: 'Dr M Al-Zahawi',
                            extension:'Ext 3453',
                            jobTitle: '(Consultant Microbiologist'),
                        ContactsTextField(
                          name: 'Dr L Guruptan',
                          extension: 'Ext 4753',
                          jobTitle: '(Microbiology Speciliaty Doctor)',
                        ),
                      ],
                    ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xffd4edff),
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30)),
                  ),

                  margin: const EdgeInsets.only(left: 5, right:5,),

                  child: Container(
                    padding: const EdgeInsets.only(left: 40, top: 10, right: 40,),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      // borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                      color: const Color(0xffe1ffee),

                    ),
                    child:
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: const[
                        Text('Key Contacts',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xff74d72a),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            )),
                        ContactsTextField(
                          name: 'Mr D Smith',
                          extension: 'Blp 875',
                          jobTitle: '(Antimicrobial Lead Pharmacist)',
                        ),
                        ContactsTextField(
                            name: 'Mrs D Matthew',
                            extension: 'Ext 4269',
                            jobTitle: '(Lead OPAT Nurse)'),
                        ContactsTextField(
                            name: 'Infection Control Nurses',
                            extension: 'Ext 4073',
                            jobTitle: ''),
                      ],
                    ),
                  ),
                ),
              ),

            ],

          ),
        ),
      ),
    );
  }
}

class ContactsTextField extends StatelessWidget {
  const ContactsTextField({
    Key? key, required this.name, required this.extension, required this.jobTitle, this.fontSize = 12,
  }) : super(key: key);

  final String name;
  final String extension;
  final String jobTitle;
  final double fontSize;

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:[
            Text(name,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: fontSize,
            )),
            Text(extension,
            style: TextStyle(
              fontSize: fontSize,
            ),
            ),
          ],
        ),
        const SizedBox(height: 3,),
        Text(jobTitle,
          style: TextStyle(
            fontSize: fontSize,
          ),),
      ],
    );
  }
}
