import 'package:flutter/material.dart';
import 'package:studycycle/utils/widgets/custom_appbar.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: "Library"),
      body: Text(""),
    );
  }
}