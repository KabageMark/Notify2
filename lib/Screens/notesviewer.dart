import 'dart:io';

import 'package:flutter/material.dart';
import 'package:notify/Screens/PdfPreviewScreen.dart';
import 'package:notify/models/files.dart';
import 'package:pdf/pdf.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;


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
        body:Text(note.content),
        floatingActionButton: RaisedButton(
        onPressed: () async {
            writeOnPdf();
            await savePdf();
            Directory documentDirectory = await getApplicationDocumentsDirectory();

            String documentPath = documentDirectory.path;

            String fullPath = "$documentPath/example.pdf";
            Navigator.push(context, MaterialPageRoute(
            builder: (context) => PdfPreviewScreen(path: fullPath,)
            
          ));
          
        },
      child:Text('ViewPdf',style: TextStyle(color:Colors.white),),
      color: Colors.black,
    ), 
      )
    );
  }
}