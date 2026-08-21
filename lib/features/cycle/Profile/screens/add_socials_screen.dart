import 'package:flutter/material.dart';
import 'package:studycycle/utils/constants/colors.dart';
import 'package:studycycle/utils/constants/sizes.dart';
import 'package:studycycle/utils/widgets/custom_appbar.dart';

class AddSocialsScreen extends StatefulWidget {
  const AddSocialsScreen({super.key});

  @override
  State<AddSocialsScreen> createState() => _AddSocialsScreenState();
}

class _AddSocialsScreenState extends State<AddSocialsScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Connected Accounts'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Header Section (Compact Card-style)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(SSizes.xl),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [SColors.primary, SColors.primaryLight, SColors.secondary],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(SSizes.borderRadiusLg * 2),
                  boxShadow: [
                    BoxShadow(
                      color: SColors.primary.withValues(alpha: 0.3),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(SSizes.md),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.white.withValues(alpha: 0.3),
                            Colors.white.withValues(alpha: 0.1),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white.withValues(alpha: 0.5), width: 1.5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            blurRadius: 10,
                            spreadRadius: 2,
                          )
                        ],
                      ),
                      child: const Icon(
                        Icons.hub_rounded,
                        size: 32,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: SSizes.md),
                    Text(
                      'Link Your Socials',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                    ),
                    const SizedBox(height: SSizes.sm),
                    Text(
                      'Connect your profiles to easily find your friends and grow your study circle network.',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.white.withValues(alpha: 0.9),
                          ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: SSizes.spaceBtwSections),

              // Social Accounts List
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Available Platforms',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: SSizes.md),
              
              _buildAnimatedSocialCard(
                context,
                index: 0,
                platform: 'Google',
                iconWidget: Image.asset('assets/icons/google.png', height: 28, width: 28),
                iconColor: Colors.transparent,
                isConnected: true,
                username: 'user@gmail.com',
              ),
              const SizedBox(height: SSizes.md),
              _buildAnimatedSocialCard(
                context,
                index: 1,
                platform: 'X',
                iconWidget: const Text(
                  '𝕏', // Double-struck X character
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black, height: 1.0),
                ),
                iconColor: Colors.grey.shade200,
                isConnected: false,
              ),
              const SizedBox(height: SSizes.md),
              _buildAnimatedSocialCard(
                context,
                index: 2,
                platform: 'LinkedIn',
                iconWidget: Icon(Icons.work_rounded, size: 28, color: Colors.blue.shade800),
                iconColor: Colors.blue.shade800.withValues(alpha: 0.1),
                isConnected: false,
              ),
              const SizedBox(height: SSizes.md),
              _buildAnimatedSocialCard(
                context,
                index: 3,
                platform: 'Facebook',
                iconWidget: Icon(Icons.facebook_rounded, size: 28, color: Colors.blue.shade600),
                iconColor: Colors.blue.shade600.withValues(alpha: 0.1),
                isConnected: false,
              ),
              const SizedBox(height: SSizes.spaceBtwSections),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedSocialCard(
    BuildContext context, {
    required int index,
    required String platform,
    required Widget iconWidget,
    required Color iconColor,
    required bool isConnected,
    String? username,
  }) {
    // Staggered delay based on index
    final double start = index * 0.15;
    final double end = (start + 0.4).clamp(0.0, 1.0);
    
    final animation = CurvedAnimation(
      parent: _controller,
      curve: Interval(start, end, curve: Curves.easeOutCubic),
    );

    final slideAnimation = Tween<Offset>(
      begin: const Offset(0.2, 0),
      end: Offset.zero,
    ).animate(animation);

    return FadeTransition(
      opacity: animation,
      child: SlideTransition(
        position: slideAnimation,
        child: _buildSocialCard(
          context,
          platform: platform,
          iconWidget: iconWidget,
          iconColor: iconColor,
          isConnected: isConnected,
          username: username,
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
        boxShadow: isConnected
            ? [
                BoxShadow(
                  color: SColors.primary.withValues(alpha: 0.15),
                  blurRadius: 12,
                  spreadRadius: 1,
                  offset: const Offset(0, 4),
                )
              ]
            : [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.08),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
        border: Border.all(
          color: isConnected ? SColors.primary.withValues(alpha: 0.5) : Colors.grey.shade200,
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
              backgroundColor: isConnected ? Colors.grey.shade100 : SColors.primary,
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
