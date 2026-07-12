import 'package:flutter/material.dart';
import '../../../utils/constants/spacing.dart';
import '../../../utils/constants/strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(SStrings.login)),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(SSpacing.lg),
          child: Text(
            'Login page placeholder',
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
