import 'dart:io';

import 'package:flutter/material.dart';
import 'package:notify/Screens/PdfPreviewScreen.dart';
import 'package:notify/models/files.dart';
import 'package:pdf/pdf.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:google_fonts/google_fonts.dart';



class Notesviewer extends StatelessWidget {
  final Notes note;
  Notesviewer({this.note});

  final pdf = pw.Document();

  writeOnPdf(){
    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a5,
        margin: pw.EdgeInsets.all(32),

        build: (pw.Context context){
          return <pw.Widget>  [
          
            pw.Header(
              level: 0,
              child: pw.Text(note.title)
            ),

            pw.Paragraph(
              text: note.content
            ),

          ];
        },


      )
    );
  }

  Future savePdf() async{
    Directory documentDirectory = await getApplicationDocumentsDirectory();

    String documentPath = documentDirectory.path;

    File file = File("$documentPath/example.pdf");

    file.writeAsBytesSync(pdf.save());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title:Text(
            note.title,
            style: TextStyle(
            color: Colors.black,
            )
            ),
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0,10,0,10),
              child: GestureDetector(
              onTap: () async {
                  
              writeOnPdf();
              await savePdf();
              Directory documentDirectory = await getApplicationDocumentsDirectory();

              String documentPath = documentDirectory.path;

              String fullPath = "$documentPath/example.pdf";
              Navigator.push(context, MaterialPageRoute(
              builder: (context) => PdfPreviewScreen(path: fullPath,)
              
            ));

                },
                  child: ListTile(
                title: Text(note.title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        softWrap: false,
                        style: TextStyle(color: Colors.black,fontSize: 19)),

                subtitle: Text(note.content,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        softWrap: false,
                          style: TextStyle(color: Colors.black,)
                          )         
  ),
              ),
            ),
    ),
        ), 
      )
    );
  }
}