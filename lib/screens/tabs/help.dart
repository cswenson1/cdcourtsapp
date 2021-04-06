import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:CDCourtServices/models/Document.dart';
import 'package:CDCourtServices/services/document_service.dart';
import 'package:CDCourtServices/screens/pdf_viewer_screen.dart';

class Help extends StatefulWidget {
  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Help> {
  DocumentService documentService;
  List<Document> documentList;

  @override
  void initState() {
    super.initState();

    documentService = Provider.of<DocumentService>(context, listen: false);

    _getDocumentList();
  }

  void _getDocumentList() {
    documentService.getAllDocuments().then((value) {
      setState(() {
        documentList = value;
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
              'These are forms and documents you may find helpful.',
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
              itemCount: documentList == null ? 0 : documentList.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: double.infinity,
                  child: FlatButton(
                    color: Colors.grey[200],
                    child: Text(documentList[index].name),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PdfViewerScreen(
                            title: documentList[index].name,
                            pdfUrl: documentList[index].downloadLink,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
