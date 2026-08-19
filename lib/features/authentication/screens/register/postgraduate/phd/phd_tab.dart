import 'package:flutter/material.dart';
import 'package:studycycle/features/authentication/screens/register/postgraduate/phd/phd.dart';
import 'package:studycycle/features/authentication/screens/register/postgraduate/phd/phd_level.dart';

class PhdTab extends StatefulWidget {
  const PhdTab({super.key});

  @override
  State<PhdTab> createState() => _PhdTabState();
}

class _PhdTabState extends State<PhdTab> {
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
          title: const Text('PHD & Level'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'PHD'),
              Tab(text: 'Level'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            PHD(),
            PHDLevel(),
          ],
        ),
        ),
    );
  }
}
