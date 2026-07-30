import 'package:flutter/material.dart';

class GroupModel {
  final String title;
  final String members;
  final IconData icon;
  final Color color;

  const GroupModel({
    required this.title,
    required this.members,
    required this.icon,
    required this.color,
  });
}