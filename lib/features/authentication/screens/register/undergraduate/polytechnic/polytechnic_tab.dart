import 'package:flutter/material.dart';
import 'package:studycycle/features/authentication/screens/register/undergraduate/polytechnic/polytechnic.dart';
import 'package:studycycle/features/authentication/screens/register/undergraduate/polytechnic/polytechnic_level.dart';

class PolytechnicTab extends StatefulWidget {
  const PolytechnicTab({super.key});

  @override
  State<PolytechnicTab> createState() => _PolytechnicTabState();
}

class _PolytechnicTabState extends State<PolytechnicTab> {
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
          title: const Text('Polytechnic & Level'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Polytechnic'),
              Tab(text: 'Level'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Polytechnic(),
            PolytechnicLevel(),
          ],
        ),
        ),
    );
  }
}
