import 'package:flutter/material.dart';
import 'package:studycycle/features/authentication/screens/register/postgraduate/masters/masters.dart';
import 'package:studycycle/features/authentication/screens/register/postgraduate/masters/masters_level.dart';

class MastersTab extends StatefulWidget {
  const MastersTab({super.key});

  @override
  State<MastersTab> createState() => _MastersTabState();
}

class _MastersTabState extends State<MastersTab> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text('Masters & Level'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Masters'),
              Tab(text: 'Level'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Masters(),
            MastersLevel(),
          ],
        ),
        ),
    );
  }
}
