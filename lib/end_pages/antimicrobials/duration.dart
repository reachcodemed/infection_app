import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';

class AntimicrobialDuration extends StatefulWidget {
  @override
  _AntimicrobialDurationState createState() => _AntimicrobialDurationState();
}

class _AntimicrobialDurationState extends State<AntimicrobialDuration> {

  List<Widget> selectionTitles = [
    TickerTile(title: 'Select an infection'),
    TickerTile(title: 'Brain Abscess'),
    TickerTile(title: 'Cellulitis - Lymphoedema'),
    TickerTile(title: 'Cellulitis - Normal'),
    TickerTile(title: 'Community Acquired Pneumonia'),
    TickerTile(title: 'Diabetic Foot Infection'),
    TickerTile(title: 'Discitis'),
    TickerTile(title: 'Encephalitis'),
    TickerTile(title: 'Endovascular Infection'),
    TickerTile(title: 'Infective Endocarditis'),
    TickerTile(title: 'Intra-abdominal Collection'),
    TickerTile(title: 'Liver Abscess'),
    TickerTile(title: 'Lung Empyema'),
    TickerTile(title: 'Lyme Disease'),
    TickerTile(title: 'Meningitis'),
    TickerTile(title: 'Osteomyelitis'),
    TickerTile(title: 'Prostatitis'),
    TickerTile(title: 'Pyelonephritis'),
    TickerTile(title: 'Septic Arthritis'),
    TickerTile(title: 'Staphylococcus aureus Bacteraemia'),
    TickerTile(title: 'UTI - Complicated'),
    TickerTile(title: 'UTI - Uncomplicated'),
  ];

  int indexTicker = 0;

  List <String> outputText = [
    """Select an infection""",
    """Duration of treatment of a Brain Abscess is typically for a total of 6 weeks intravenous therapy or with a bioavailable oral agent.
    
This duration may change with drainge or partial drainage of the abscess.

The duration may also change in the context that thebrain abscess is not the primary pathology and that it was secondary to another pathology or another pathology exists, such as endocarditis. Please ensure that you discuss with the Microbiology team.""",
    """Duration of treatment of a patient with Lymphoedema should be at least 3 weeks.
Patients with lymphedema are much more likely to be colonised with a wider spectrum of microorganisms, including Gram-negatives on account ofthe architecture of the skin.
Conventional therapy for cellulitis is unlikely to be effective.
Please ensure that you discuss with the Microbiology team regarding antibiotic choice.
""",
    """Cellulitis should be treated on clinical assessment. There are a variety of factors which can influence the duration of therapy, such as obesity, mobility, immune status and others.

Duration should be decided by the clinical team in response to how a patient is responding to treatment.

 It is important to encourage patients to elevate their legs as this is an essential part of treatment - failure to do this could lead to over-treating the patient with antibiotics.

""",
    """Community Acquired Pneumonia typically requires 5 days of treatment, however, this may be complicated by underlying pulmonary pathologies such as Asthma. Bronchietasis, COPD, etc.

Immunosuppression may also require a longer course of therapy, although clinical response should be the mainstay of assessment, radiological changes may lag.""",
    """Diabetic foot infection requires a prolonged course of antibiotic therapy because of the nature of diabetes as an immunosuppressive condition as well as micro and macrovascular complications which in turn lead to problems with the skin and soft-tissue.
    
All patients with a diabetic foot infection should be swabbed at the point of being seen to better understand the microbial flora which could be causing infection.
Typical duration of therapy will be at least 2 weeks, but this may need to be prolonged if there is concern of an underlying osteomyelitis.
""",
    """Discitis requires a prolonged duration of antibiotic therapy. Usually this involves 6 weeks of intravenous therapy, followed by 6 weeks of oral therapy.
It is essential in a diagnosis of discitis to try and isolate the causative organism. This can be through taking a blood culture, however, if every attempt should be made to obtain a sample from the back, radiologically if possible.

If a patient is systemically well, there is not urgency to start them on antibiotic therapy, the opportunity should be taken to obtain a sample. If however the patient becomes systemically unwell, then antibiotics should be started and a blood culture taken if not already done.

Whilst the normal duration if 6 weeks of intravenous antibiotics followed by 6 weeks of oral antibiotics, given specific situations, it may be necessary to extend the course.

Always involve the OPAT team early on in discussions about long-term management.
""",
    """The most common cause of sporadic Encephalitis is HSV (Herpes Simplex Virus), however, other microorganisms can also cause Encephalitis.
    
Usually diagnosed by lumbar puncture +/- MRI scanning. Treatment for optimal outcomes needs to be instituted very early in the presentation and delay can be linked to worse outcomes.

Duration of therapy is usually 14-21 days. Ideally a lumbar puncture should be taken again at 14 days and if the virus persists in the CSF, then 21 days of treatment should be completed.""",
    """Endovascular infections can have different aetiologies, such as an infected thrombus in the context of a bacteremia, or a mycotic aneurysm.
    
Duration of therapy is typically 6 weeks in these cases, however, it is important to bear in mind that complications of those infections can require further treatment where relevant.

Ensure that a plan has been made with the Microbiology team for therapy and duration and involve the OPAT team early on in discussions about long-term management.""",
    """The duration of therapy for endocarditis is dependent upon the causative organism.
    
Typically, Staphylococci will require at least 4 weeks of treatment, whereas Streptococci will require at least 6 weeks of treatment. This duration of therapy may need to be extended if there are any complications of the infection or indeed, if the patient is not responding as expected as is not suitable for surgical intervention.
All patients with endocarditis must be discussed with both the Microbiology team as well as the Cardiology team, so that a definitive plan can be made and documented.

These patients may be suitable for OPAT and should be discussed with the OPAT team, however, IVDUs will not be suitable, nor those who are having complications from their endocarditis, and anyone receiving Gentamicin as a part of their therapy will also not be able to receive OPAT.""",
    """The duration of therapy of an intra-abdominal collection is dependent on the size and extent of the collection. Other factors may also complicate the situation, such as peritoneal contamination, immunosuppression, etc.
    
If intra-abdominal collections are being treated empirically without surgical intervention, then they're number and sizes need to be determined to help establish duration of therapy.

Positive microbiology will also be very helpful in determining which antibiotics to use as well as duration of therapy. The platelet count is a highly useful marker of collection activity and is more useful in this situation than the CRP and WBC, but equally the picture should be considered holistically.

Duration of therapy is at least 2 weeks and may be much longer. Involve the OPAT team early on in discussions about long-term management.""",
    """The typical duration of treatment of a Liver Abscess is 6 weeks. This is often irrespective of its size, although very small collections may well be managed with a slightly shorter duration, depending on discussion with the Consultant Microbiologist.
    
Getting clinical samples is key here, and blood cultures should be sent as well as Amoebic serology. The sample of choice is aspiration or drainage of the abscess, preferably before or very soon after antibiotic therapy has commenced to maximise the chance of a positive culture.

Drainage of a Liver Abscess, particularly with a drain left in-situ, which continues to adequately drain may well shorten the total duration of antimicrobial therapy
Gram-negative organisms are the usual source of these infections, so oral Ciprofloxacin or Co-trimoxazole may well be suitable agents for therapy depending on culture and sensitivity results.

Be careful to take a travel history as well. Involve the OPAT team early on in discussions about long-term management.""",
    """A Lung Empyema requires a prolonged course of antibiotic therapy. Usual duration is 6 weeks with a broad-spectrum agent, which covers the common respiratory pathogens.
    
As with all infections, this scenario may be complicated by a number of factors which may make treatment difficult. It is important to maintain relatively close review of the patient's condition because if there is no improvement despite a prolonged course of therapy, Cardiothoracic intervention may be required.

Active drainage of the Empyema will result in a shortened duration of therapy. Involve the OPAT team early on in discussions about long-term management.


""",
    """The duration of Lyme Disease is typically a two week course of treatment. This may however be extended in complicated line such as cardiac, neuroborreliosis, as well as other manifestations of the infection.
    
Lyme disease presenting with an Erythema migrans rash should be treated on clinical suspicion, instead of waiting for a positive serological result.

In the event that a patient remains symptomatic, seek help from the local Infectious Disease team.
""",
    """The duration of meningitis is usually 10-14 days depending on the organism causing the infection with Neisseria meningitidis and Haemophilus influenzae usually requiring treatment for 7 days, which extends to 2 weeks in the case of Streptococcus pneumoniae.
    
This duration can be further extended in the case of Listeria meningitis, which is typically treated for 21 days and prolonged therapy may also be important in cases where there is prosthetic material or devices in the brain.

Meningitis can also be a complication of an endocarditic process and in such instances, advice should be sought from the Consultant Microbiologists regarding agents and duration of therapy.
""",
    """The typical duration of treatment for Osteomyelitis is 2 weeks intravenous therapy, followed by 4 weeks of oral antibiotic therapy. This is applicable to acute, native bone/joint osteomylitis.
In the context of osteomyelitis which involves a prosthetic joint or a prosthesis, this will prolong the duration of therapy. Chronic osteomyelitis will also prolong therapy.

Duration of therapy will very much depend upon whether or not there is any surgical intervention, and to which level that intervention occurs. In the latter cases, there needs to be close liasion with the Consultant Microbiologists as well as the surgeons involved in the patient's care to establish not just the appropriate agent(s) for therapy, but also the duration.

In all these cases, involve the OPAT team early on in discussions about long-term management.
""",
    """The prostate is quite a deep organ and so its treatment with regards to infection requires antibiotics which have good penetration into the prostatic tissue.
Urine and semen samples are useful for diagnosis. 

Prostatis should be treated for a minimum of 3 weeks, however longer may also be needed depending on the patient's symptoms and tests.

It may be worth considering a 4 week duration in those patients in particular who may be immunosuppressed.
""",
    """The treatment for pyelonephritis is usually 10-14 days of total antibiotic therapy, consisting of intravenous and oral antibiotics.
    
It is essential in any case of suspected pyelonephtitis to send an MSU for the patient to ensure that we are able to consider appropriate oral conversions. This becomes particularly important in the case of pregnant women in who ongoing infection can increase their risk of miscarriage.

In pregnant women or those patients with recurrent or complicated urinary tract infections, it is better to give the longer duration of therapy of 14 days.
""",
    """The treatment for a Septic Arthritis is typically 6 weeks, which consists of 2 weeks of intravenous therapy followed by 4 weeks of oral antibiotic therapy.
    
This duration of therapy can be complicated by the presence of prostheses or collections, which will may need further surgery. Close liaison with Microbiology and Orthopaedics is required in these cases to establish agent and duration of therapy.
""",
    """The normal duration of treatment for Staphylococcus aureus bacteremia, is 2 weeks. This should consist of at least 10 days of intravenous therapy.
The duration of therapy can be extended due to the pathology which is the source of the bacteraemia, or secondary seeding from the bacteremia to other sites.

Common infections associated with a Staphylococcus aureus bacteremia are skin/soft-tissue infections, bone/joint infections, discitis, endocarditis amongst others. The duration of therapy should be extended on the basis of the underlying/secondary pathology.

Treatment duration should strictly be counted from the date of the first negative blood culture.
""",
    """Complicated UTs in general require 10-14 days of antibiotic therapy. This will be dependent on the source as well and if the source persists, such as catheters, ureteric stents, stones, etc.

The most important part of therapy is removal of an infected source, however, if this is not possible, then the length of the antibiotic course should be extended to maximise the chance of clearing the infection.

It may be necessary to provide therapy beyond the 14 day period. These cases should be discussed with a Consultant Microbiologist.
""",
    """Uncomplicated UTs should be treated for 3 days in women and 7 days in men.""",
  ];



  void notifyParent()
  {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return BloodCulturesEndPage(
        title: "Antimicrobial Duration",
        titleBoxColour: kAntimicrobialMaroon,
        firstTextArea:
        //Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     SizedBox(
        //       width: double.infinity,
        //       height: 25,
        //       child:
        //       Container(
        //         alignment: Alignment.centerLeft,
        //         color: kAntimicrobialPastelBrown,
        //         child: const Padding(
        //           padding: EdgeInsets.fromLTRB(8,0,0,0),
        //           child: Text("Duration",
        //             style: TextStyle(
        //               color: Colors.white,
        //               fontWeight: FontWeight.w500,
        //               fontSize: 15.0,
        //
        //             ),),
        //         ),
        //       ),
        //     ),
        //
        //     const SizedBox(height: 15.0,),
        //
        //     Padding(
        //       padding: const EdgeInsets.fromLTRB(8,0,0,0),
        //       child: Text(outputText[indexTicker]),
        //     ),
        //
        //     const SizedBox(height: 15.0,),
        //   ],
        // ),
        SubBarAndText(
            lowerTitle: "Duration",
            outputText: outputText[indexTicker],
            barColour: kAntimicrobialPastelBrown),
        selectionTitles: selectionTitles,
        onSelectedItemChanged: (index)
          {
            setState(() {
              indexTicker = index;
            });
          },
        notifyParent: notifyParent);

  }
}
