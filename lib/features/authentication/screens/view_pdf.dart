import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Viewpdf extends StatelessWidget{
  final String url;
  final String title;

  const Viewpdf({Key? key, required this.url, required this.title}):super(key: key);

  @override
  Widget build(BuildContext context) {
  return Scaffold
(appBar: AppBar(title: Text(title),),
body: SfPdfViewer.network(url), 
  
  );
  }
}