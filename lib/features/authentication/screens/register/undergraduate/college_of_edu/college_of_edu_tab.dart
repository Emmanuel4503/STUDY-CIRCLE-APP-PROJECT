import 'package:flutter/material.dart';
import 'package:studycycle/features/authentication/screens/register/undergraduate/college_of_edu/college_of_edu_level.dart';
import 'package:studycycle/features/authentication/screens/register/undergraduate/college_of_edu/college_of_edu.dart';

class CollegeOfEduTab extends StatefulWidget {
  const CollegeOfEduTab({super.key});

  @override
  State<CollegeOfEduTab> createState() => _CollegeOfEduTabState();
}

class _CollegeOfEduTabState extends State<CollegeOfEduTab> {
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
          title: const Text('College of Education & Level'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'College of Education'),
              Tab(text: 'Level'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            CollegeOfEdu(),
            CollegeOfEduLevel(),
          ],
        ),
        ),
    );
  }
}
