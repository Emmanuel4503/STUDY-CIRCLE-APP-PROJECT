import 'package:flutter/material.dart';
import 'package:studycycle/features/authentication/screens/register/undergraduate/university/university_level.dart';
import 'package:studycycle/features/authentication/screens/register/undergraduate/university/university.dart';

class UniversityTab extends StatefulWidget {
  const UniversityTab({super.key});

  @override
  State<UniversityTab> createState() => _UniversityTabState();
}

class _UniversityTabState extends State<UniversityTab> {
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
          title: const Text('University & Level'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'University'),
              Tab(text: 'Level'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            University(),
            UniversityLevel(),
          ],
        ),
        ),
    );
  }
}
