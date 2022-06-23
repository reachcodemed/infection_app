import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';
import 'package:infection/end_pages/contacts/contacts.dart';
import 'package:infection/end_pages/contacts/guidance.dart';
import 'opening_page.dart';

class ContactsAndGuidance extends StatelessWidget {
  ContactsAndGuidance({Key? key}) : super(key: key);

  final List<String> contactsTileTitles = ['Contacts','Guidance',];
  final List<Widget> contactsTileNavigation= [Contacts(),Guidance(),];


  @override
  Widget build(BuildContext context) {
    return SubMenuModule(
        tileTitles: contactsTileTitles,
        tileNavigation: contactsTileNavigation,
        topBoxColour: kContactsPageGrey,
        topBoxText: 'Contacts & Guidance');
  }
}

