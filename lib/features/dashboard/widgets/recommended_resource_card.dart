import 'package:flutter/material.dart';

class RecommendedResourceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String type;

  const RecommendedResourceCard({
    super.key,
    required this.icon,
    required this.title,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        subtitle: Text(type),
        trailing: const Icon(Icons.arrow_forward_ios, size: 18),
      ),
    );
  }
}