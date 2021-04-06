import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:CDCourtServices/models/Faq.dart' as FaqModel;
import 'package:CDCourtServices/services/faq_service.dart';

class Faq extends StatefulWidget {
  @override
  _FaqState createState() => _FaqState();
}

class _FaqState extends State<Faq> {
  FaqService faqService;
  List<FaqModel.Faq> faqList;

  @override
  void initState() {
    super.initState();
    faqService = Provider.of<FaqService>(context, listen: false);
    _getFaqList();
  }

  void _getFaqList() async {
    faqService.getAllFaqs().then((value) {
      setState(() {
        faqList = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
              bottom: 20,
            ),
            child: Text(
              'Frequently Asked Questions',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: faqList == null ? 0 : faqList.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 10.0),
                  child: ExpansionPanelList(
                    expansionCallback: (int i, bool isExpanded) {
                      print(index);
                      setState(() {
                        faqList[index].isExpanded = !faqList[index].isExpanded;
                      });
                    },
                    expandedHeaderPadding: EdgeInsets.all(0),
                    children: [
                      ExpansionPanel(
                        headerBuilder: (BuildContext context, bool isExpanded) {
                          return ListTile(
                            title: Text(
                              faqList[index].faqQuestion,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        },
                        body: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 15.0, right: 15.0, bottom: 10.0),
                            child: Text(
                              faqList[index].faqAnswer,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ),
                        isExpanded: faqList[index].isExpanded,
                      )
                    ],
                  ),
                );
              },
            ),
            // child: Column(
            //   children: [
            //     Container(
            //       width: double.infinity,
            //       child: FlatButton(
            //         color: Colors.grey[200],
            //         child: Text('How do I pay my fine?'),
            //         onPressed: () {},
            //       ),
            //     ),
            //     Container(
            //       width: double.infinity,
            //       child: FlatButton(
            //         color: Colors.grey[200],
            //         child: Text('Question #2'),
            //         onPressed: () {},
            //       ),
            //     ),
            //     Container(
            //       width: double.infinity,
            //       child: FlatButton(
            //         color: Colors.grey[200],
            //         child: Text('Question #3'),
            //         onPressed: () {},
            //       ),
            //     ),
            //     Container(
            //       width: double.infinity,
            //       child: FlatButton(
            //         color: Colors.grey[200],
            //         child: Text('Question #4'),
            //         onPressed: () {},
            //       ),
            //     ),
            //   ],
            // ),
          )
        ],
      ),
    );
  }
}
