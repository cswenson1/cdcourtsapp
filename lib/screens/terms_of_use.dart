import 'package:flutter/material.dart';

import 'package:CDCourtServices/screens/profile.dart';

class TermsOfUseView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms Of Use'),
        actions: [
          IconButton(
            icon: Image.asset('assets/images/dummy-profile.png'),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Profile()));
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Text(
                  'Terms Of Use',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Last updated: April 14, 2021',
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text:
                          'Please read these terms and conditions carefully before using Our Service.',
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text: 'Interpretation and Definitions',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text: 'Interpretation',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 26.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text:
                          'The words of which the initial letter is capitalized have meanings defined under the following conditions. The following definitions shall have the same meaning regardless of whether they appear in singular or in plural.',
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text: 'Definitions',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 26.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text: 'For the purposes of this Privacy Policy:',
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text:
                          'Account means a unique account created for You to access our Service or parts of our Service.',
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text:
                          'Affiliate means an entity that controls, is controlled by or is under common control with a party, where "control" means ownership of 50% or more of the shares, equity interest or other securities entitled to vote for election of directors or other managing authority.',
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text:
                          'Application means the software program provided by the Company downloaded by You on any electronic device, named C&D Court Services',
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text:
                          'Company (referred to as either "the Company", "We", "Us" or "Our" in this Agreement) refers to C&D Court Services LLC, 640 North Main, STE 1278, North Salt Lake, UT 84054.',
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text:
                          'Cookies are small files that are placed on Your computer, mobile device or any other device by a website, containing the details of Your browsing history on that website among its many uses.',
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text: 'Country refers to: Utah, United States',
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text:
                          'Device means any device that can access the Service such as a computer, a cellphone or a digital tablet.',
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text:
                          'Personal Data is any information that relates to an identified or identifiable individual.',
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text:
                          'Service refers to the Application or the Website or both.',
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text:
                          'Service Provider means any natural or legal person who processes the data on behalf of the Company. It refers to third-party companies or individuals employed by the Company to facilitate the Service, to provide the Service on behalf of the Company, to perform services related to the Service or to assist the Company in analyzing how the Service is used.',
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text:
                          'Third-party Social Media Service refers to any website or any social network website through which a User can log in or create an account to use the Service.',
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text:
                          'Usage Data refers to data collected automatically, either generated by the use of the Service or from the Service infrastructure itself (for example, the duration of a page visit).',
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text:
                          'Website refers to C&D Court Services, accessible from http://www.cdcourtservices.com',
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text:
                          'You means the individual accessing or using the Service, or the company, or other legal entity on behalf of which such individual is accessing or using the Service, as applicable.',
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text: 'Acknowledgment',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text:
                          'These are the Terms and Conditions governing the use of this Service and the agreement that operates between You and the Company. These Terms and Conditions set out the rights and obligations of all users regarding the use of the Service.',
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text:
                          'Your access to and use of the Service is conditioned on Your acceptance of and compliance with these Terms and Conditions. These Terms and Conditions apply to all visitors, users and others who access or use the Service.',
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text:
                          'By accessing or using the Service You agree to be bound by these Terms and Conditions. If You disagree with any part of these Terms and Conditions then You may not access the Service.',
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text:
                          'You represent that you are over the age of 18. The Company does not permit those under 18 to use the Service.',
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text:
                          'Your access to and use of the Service is also conditioned on Your acceptance of and compliance with the Privacy Policy of the Company. Our Privacy Policy describes Our policies and procedures on the collection, use and disclosure of Your personal information when You use the Application or the Website and tells You about Your privacy rights and how the law protects You. Please read Our Privacy Policy carefully before using Our Service.',
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text: 'User Accounts',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text:
                          'When You create an account with Us, You must provide Us information that is accurate, complete, and current at all times. Failure to do so constitutes a breach of the Terms, which may result in immediate termination of Your account on Our Service.',
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text:
                          'You are responsible for safeguarding the password that You use to access the Service and for any activities or actions under Your password, whether Your password is with Our Service or a Third-Party Social Media Service.',
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text:
                          'You agree not to disclose Your password to any third party. You must notify Us immediately upon becoming aware of any breach of security or unauthorized use of Your account.',
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text:
                          'You may not use as a username the name of another person or entity or that is not lawfully available for use, a name or trademark that is subject to any rights of another person or entity other than You without appropriate authorization, or a name that is otherwise offensive, vulgar or obscene.',
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text: 'Intellectual Property',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text:
                          'The Service and its original content (excluding Content provided by You or other users), features and functionality are and will remain the exclusive property of the Company and its licensors.',
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text:
                          'The Service is protected by copyright, trademark, and other laws of both the Country and foreign countries.',
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text:
                          'Our trademarks and trade dress may not be used in connection with any product or service without the prior written consent of the Company.',
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text: 'Your Feedback to Us',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text:
                          'You assign all rights, title and interest in any Feedback You provide the Company. If for any reason such assignment is ineffective, You agree to grant the Company a non-exclusive, perpetual, irrevocable, royalty free, worldwide right and license to use, reproduce, disclose, sub-license, distribute, modify and exploit such Feedback without restriction.',
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text: 'Links to Other Websites',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text:
                          'Our Service may contain links to third-party web sites or services that are not owned or controlled by the Company.',
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text:
                          'The Company has no control over, and assumes no responsibility for, the content, privacy policies, or practices of any third party web sites or services. You further acknowledge and agree that the Company shall not be responsible or liable, directly or indirectly, for any damage or loss caused or alleged to be caused by or in connection with the use of or reliance on any such content, goods or services available on or through any such web sites or services.',
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text:
                          'We strongly advise You to read the terms and conditions and privacy policies of any third-party web sites or services that You visit.',
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text: 'Termination',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text:
                          'We may terminate or suspend Your Account immediately, without prior notice or liability, for any reason whatsoever, including without limitation if You breach these Terms and Conditions.',
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text:
                          'Upon termination, Your right to use the Service will cease immediately. If You wish to terminate Your Account, You may simply discontinue using the Service.',
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text: 'Limitation of Liability',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text:
                          'Notwithstanding any damages that You might incur, the entire liability of the Company and any of its suppliers under any provision of this Terms and Your exclusive remedy for all of the foregoing shall be limited to the amount actually paid by You through the Service or 100 USD if You haven\'t purchased anything through the Service.',
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text:
                          'To the maximum extent permitted by applicable law, in no event shall the Company or its suppliers be liable for any special, incidental, indirect, or consequential damages whatsoever (including, but not limited to, damages for loss of profits, loss of data or other information, for business interruption, for personal injury, loss of privacy arising out of or in any way related to the use of or inability to use the Service, third-party software and/or third-party hardware used with the Service, or otherwise in connection with any provision of this Terms), even if the Company or any supplier has been advised of the possibility of such damages and even if the remedy fails of its essential purpose.',
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text:
                          'Some states do not allow the exclusion of implied warranties or limitation of liability for incidental or consequential damages, which means that some of the above limitations may not apply. In these states, each party\'s liability will be limited to the greatest extent permitted by law.',
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text: '"AS IS" and "AS AVAILABLE" Disclaimer',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text:
                          'The Service is provided to You "AS IS" and "AS AVAILABLE" and with all faults and defects without warranty of any kind. To the maximum extent permitted under applicable law, the Company, on its own behalf and on behalf of its Affiliates and its and their respective licensors and service providers, expressly disclaims all warranties, whether express, implied, statutory or otherwise, with respect to the Service, including all implied warranties of merchantability, fitness for a particular purpose, title and non-infringement, and warranties that may arise out of course of dealing, course of performance, usage or trade practice. Without limitation to the foregoing, the Company provides no warranty or undertaking, and makes no representation of any kind that the Service will meet Your requirements, achieve any intended results, be compatible or work with any other software, applications, systems or services, operate without interruption, meet any performance or reliability standards or be error free or that any errors or defects can or will be corrected.',
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text:
                          'Without limiting the foregoing, neither the Company nor any of the company\'s provider makes any representation or warranty of any kind, express or implied: (i) as to the operation or availability of the Service, or the information, content, and materials or products included thereon; (ii) that the Service will be uninterrupted or error-free; (iii) as to the accuracy, reliability, or currency of any information or content provided through the Service; or (iv) that the Service, its servers, the content, or e-mails sent from or on behalf of the Company are free of viruses, scripts, trojan horses, worms, malware, timebombs or other harmful components.',
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text:
                          'Some jurisdictions do not allow the exclusion of certain types of warranties or limitations on applicable statutory rights of a consumer, so some or all of the above exclusions and limitations may not apply to You. But in such a case the exclusions and limitations set forth in this section shall be applied to the greatest extent enforceable under applicable law.',
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text: 'Governing Law',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text:
                          'The laws of the Country, excluding its conflicts of law rules, shall govern this Terms and Your use of the Service. Your use of the Application may also be subject to other local, state, national, or international laws.',
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text: 'Disputes Resolution',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text:
                          'If You have any concern or dispute about the Service, You agree to first try to resolve the dispute informally by contacting the Company.',
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text: 'For European Union (EU) Users',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text:
                          'If You are a European Union consumer, you will benefit from any mandatory provisions of the law of the country in which you are resident in.',
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text: 'United States Legal Compliance',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text:
                          'You represent and warrant that (i) You are not located in a country that is subject to the United States government embargo, or that has been designated by the United States government as a "terrorist supporting" country, and (ii) You are not listed on any United States government list of prohibited or restricted parties.',
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text: 'Severability and Waiver',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text: 'Severability',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 26.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text:
                          'If any provision of these Terms is held to be unenforceable or invalid, such provision will be changed and interpreted to accomplish the objectives of such provision to the greatest extent possible under applicable law and the remaining provisions will continue in full force and effect.',
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text: 'Waiver',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 26.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text:
                          'Except as provided herein, the failure to exercise a right or to require performance of an obligation under this Terms shall not effect a party\'s ability to exercise such right or require such performance at any time thereafter nor shall be the waiver of a breach constitute a waiver of any subsequent breach.',
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text: 'Translation Interpretation',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text:
                          'These Terms and Conditions may have been translated if We have made them available to You on our Service. You agree that the original English text shall prevail in the case of a dispute.',
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text: 'Changes to These Terms and Conditions',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text:
                          'We reserve the right, at Our sole discretion, to modify or replace these Terms at any time. If a revision is material We will make reasonable efforts to provide at least 30 days\' notice prior to any new terms taking effect. What constitutes a material change will be determined at Our sole discretion.',
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text:
                          'By continuing to access or use Our Service after those revisions become effective, You agree to be bound by the revised terms. If You do not agree to the new terms, in whole or in part, please stop using the website and the Service.',
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text: 'Contact Us',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text:
                          'If you have any questions about this Privacy Policy, You can contact us:',
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text: 'By email: cliff@cdcourtservices.com',
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text:
                          'By visiting this page on our website: http://www.cdcourtservices.com',
                    ),
                    TextSpan(text: '\n'),
                  ],
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
