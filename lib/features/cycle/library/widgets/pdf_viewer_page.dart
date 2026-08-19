import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pdfrx/pdfrx.dart';

class PdfViewerPage extends StatelessWidget {
  final String fileName;
  final Uint8List bytes;

  const PdfViewerPage({
    super.key,
    required this.fileName,
    required this.bytes,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(fileName),
      ),
      body: PdfViewer.data(
        bytes,
        sourceName: fileName,
      ),
    );
  }
}