import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infection/main_pages/antimicrobials_page.dart';
import 'package:infection/main_pages/results_interpretation.dart';
import 'package:infection/constants.dart';
import 'package:infection/main_pages/critical_care_guidelines.dart';
import 'package:infection/custom_widgets.dart';
import 'package:infection/main_pages/contacts_page.dart';
import 'package:infection/main_pages/dosing_and_monitoring_page.dart';
import 'package:infection/main_pages/infection_prevention_and_control_page.dart';
import 'package:infection/main_pages/opat_and_ambulatory_page.dart';
import 'package:infection/main_pages/paediatric_guidelines_page.dart';
import 'package:infection/main_pages/primary_care_guidelines_page.dart';
import 'package:infection/main_pages/search_page.dart';
import 'main_pages/adult_guidelines_page.dart';
import 'main_pages/adult_surgical_prophylaxis.dart';
import 'main_pages/covid_19_page.dart';



Widget IconTemplate (String address)
{
  return SizedBox(
    
    width: 32,
    child: Image(
        image: AssetImage('custom_icons/$address'),
        height: 40,
        width: 32,
    ),
  );
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final List<String> homePageTileTitles = ['Advice & Guidance','Antimicrobials','Adult Guidelines','Adult Surgical Prophylaxis','Covid-19', 'Critical Care Guidelines','Dosing and Monitoring','Infection & Prevention Control','OPAT & Ambulatory', 'Paediatric Guidelines','Primary Care Guidelines','Results Interpretation',];

  final List<Widget> homePageTileIcons = [
    IconTemplate('contact.png'),
    IconTemplate('antimicrobials.png'),
    IconTemplate('adult.png'),
    IconTemplate('surg.png'),
    IconTemplate('covid.png'),
    IconTemplate('icu.png'),
    IconTemplate('blood.png'),
    IconTemplate('ipc.png'),
    IconTemplate('opat.png'),
    IconTemplate('paeds.png'),
    IconTemplate('gp.png'),
    IconTemplate('contact.png'),
    IconTemplate('bc.png'),

  ];

  final List<Widget> navigateTo = [ ContactsAndGuidance(),
    Antimicrobials(),AdultGuidelines(),SurgicalProphylaxis(),  Covid19(), CriticalCare(),DosingMonitoring(),InfectionControl(),Opat(), Paediatric(), PrimaryCare(), ResultsInterpretation(),];

  @override
  Widget build(BuildContext context) {
    return SubMenuModule(
        tileLeadingIcon: homePageTileIcons,
        tileTitles: homePageTileTitles,
        tileNavigation: navigateTo,
        topBoxColour: kOpeningPageBlue,
        topBoxText: 'Guidelines Menu',
        leadingPadding: 20.0,
        iconSize: 25,

        topBoxTrailingIcon: Row(
          children: [
            GestureDetector(child: const Icon(Icons.search, color: Colors.white, size: 25,),
                onTap: ()
                {
                  Navigator.push(context, CupertinoPageRoute(builder: (context) {
                    return SearchPage();
                },));

                },
            ),

            const SizedBox(width: 10),

            const Icon(
              CupertinoIcons.info_circle_fill,
              color: Colors.white,
              size: 25,),
          ],
        ),

    );

  }
}

//   SafeArea(
//   child: Scaffold(
//     appBar: AppBar(
//         elevation: 0.0,
//         toolbarHeight: 45.0,
//         backgroundColor: Colors.white,
//         leading:
//         IconButton(
//           icon: const Icon(CupertinoIcons.chevron_left,
//             //size: 12.0,
//             color: Colors.white,),
//           onPressed: ()
//           {
//             Navigator.pop(context);
//           },
//         ),
//
//     ),
//     body: SizedBox.expand(
//       child:
//       Column(
//         children: [
//           SizedBox(
//             height: 130.0,
//             child: Container(
//               padding: const EdgeInsets.fromLTRB(30.0, 0, 15, 15),
//               color: kOpeningPageBlue,
//               child: Align(
//                 alignment: Alignment.bottomCenter,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: const [
//                     Text("Guidelines Menu",
//                       style: TextStyle(
//                         fontWeight: FontWeight.w400,
//                         fontSize: kTitleFontSize,
//                         color: Colors.white,
//                       ),),
//
//                     Icon(CupertinoIcons.info_circle_fill,
//                     color: Colors.white,
//                     size: 25),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: ListView.separated(
//                 itemCount: homePageTileTitles.length,
//                 itemBuilder: (context, index)
//             {
//               return MenuTile(
//                 tileTitle: homePageTileTitles[index],
//                 leadingIcon: homePageTileIcons[index],
//                 navigateTo: navigateTo[index],
//                 leadingPadding: 30.0,
//                 minLeadingWidth: 0.0,
//               );
//             },
//           separatorBuilder: (context, index) {
//           return const Divider(
//             height: 0.0,
//             thickness: 1.5,
//             indent: 20.0,
//           );
//           },
//             ),
//           ),
//
//
//         ],
//       ),
//     ),
//   ),
// );


