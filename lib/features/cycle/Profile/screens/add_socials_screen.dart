import 'package:flutter/material.dart';
import 'package:studycycle/utils/constants/sizes.dart';
import 'package:studycycle/utils/widgets/custom_appbar.dart';

class AddSocialsScreen extends StatelessWidget {
  const AddSocialsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Scaffold(
      appBar: const CustomAppBar(title: 'Connected Accounts'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: SSizes.xl, horizontal: SSizes.defaultSpace),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [primaryColor, primaryColor.withOpacity(0.7)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(SSizes.sm),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(SSizes.borderRadiusLg),
                    ),
                    child: const Icon(
                      Icons.hub_rounded,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: SSizes.md),
                  Text(
                    'Link Your Socials',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                  ),
                  const SizedBox(height: SSizes.sm),
                  Text(
                    'Connect your profiles to easily find your friends and grow your study circle network.',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white.withOpacity(0.9),
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: SSizes.spaceBtwSections),

            // Social Accounts List
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: SSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Available Platforms',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: SSizes.md),
                  _buildSocialCard(
                    context,
                    platform: 'Google',
                    iconWidget: Image.asset('assets/icons/google.png', height: 28, width: 28),
                    iconColor: Colors.transparent,
                    isConnected: true,
                    username: 'user@gmail.com',
                  ),
                  const SizedBox(height: SSizes.md),
                  _buildSocialCard(
                    context,
                    platform: 'X',
                    iconWidget: const Text(
                      '𝕏', // Double-struck X character
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black, height: 1.0),
                    ),
                    iconColor: Colors.grey.shade200,
                    isConnected: false,
                  ),
                  const SizedBox(height: SSizes.md),
                  _buildSocialCard(
                    context,
                    platform: 'LinkedIn',
                    iconWidget: Icon(Icons.work_rounded, size: 28, color: Colors.blue.shade800),
                    iconColor: Colors.blue.shade800.withOpacity(0.1),
                    isConnected: false,
                  ),
                  const SizedBox(height: SSizes.md),
                  _buildSocialCard(
                    context,
                    platform: 'Facebook',
                    iconWidget: Icon(Icons.facebook_rounded, size: 28, color: Colors.blue.shade600),
                    iconColor: Colors.blue.shade600.withOpacity(0.1),
                    isConnected: false,
                  ),
                  const SizedBox(height: SSizes.spaceBtwSections),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialCard(
    BuildContext context, {
    required String platform,
    required Widget iconWidget,
    required Color iconColor,
    required bool isConnected,
    String? username,
  }) {
    return Container(
      padding: const EdgeInsets.all(SSizes.md),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(SSizes.borderRadiusLg),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(
          color: isConnected ? Theme.of(context).colorScheme.primary.withOpacity(0.5) : Colors.grey.shade200,
          width: isConnected ? 1.5 : 1.0,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(SSizes.sm),
            decoration: BoxDecoration(
              color: iconColor,
              shape: BoxShape.circle,
            ),
            child: iconWidget,
          ),
          const SizedBox(width: SSizes.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  platform,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                if (isConnected && username != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(
                      username,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.grey.shade600,
                          ),
                    ),
                  ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(90, 36),
              backgroundColor: isConnected ? Colors.grey.shade100 : Theme.of(context).colorScheme.primary,
              foregroundColor: isConnected ? Colors.black87 : Colors.white,
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: SSizes.md),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(SSizes.borderRadiusMd),
                side: BorderSide(
                  color: isConnected ? Colors.grey.shade300 : Colors.transparent,
                ),
              ),
            ),
            child: Text(
              isConnected ? 'Disconnect' : 'Connect',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}

