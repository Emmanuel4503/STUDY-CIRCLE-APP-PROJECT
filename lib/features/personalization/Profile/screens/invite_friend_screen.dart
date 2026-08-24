import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:studycycle/utils/constants/colors.dart';
import 'package:studycycle/utils/constants/sizes.dart';
import 'package:studycycle/utils/widgets/custom_appbar.dart';

class InviteFriendScreen extends StatefulWidget {
  const InviteFriendScreen({super.key});

  @override
  State<InviteFriendScreen> createState() => _InviteFriendScreenState();
}

class _InviteFriendScreenState extends State<InviteFriendScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildAnimatedItem({required Widget child, required int index, required int total}) {
    final start = (index / total) * 0.5;
    final end = start + 0.5;
    
    final slideAnimation = Tween<Offset>(begin: const Offset(0, 0.2), end: Offset.zero).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(start, end, curve: Curves.easeOutCubic),
      ),
    );

    final fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(start, end, curve: Curves.easeOut),
      ),
    );

    return SlideTransition(
      position: slideAnimation,
      child: FadeTransition(
        opacity: fadeAnimation,
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Invite Friends'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Compact Header Section
            Padding(
              padding: const EdgeInsets.all(SSizes.defaultSpace),
              child: Container(
                padding: const EdgeInsets.all(SSizes.lg),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [SColors.primaryLight, SColors.primary],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(SSizes.borderRadiusLg * 1.5),
                  boxShadow: [
                    BoxShadow(
                      color: SColors.primary.withValues(alpha: 0.4),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(SSizes.md),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [SColors.primary, SColors.primaryDark],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: SColors.primaryDark.withValues(alpha: 0.3),
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.group_add_rounded,
                        size: 32,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: SSizes.spaceBtwItems),
                    Text(
                      'Invite Your Friends!',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: SSizes.sm),
                    Text(
                      'Study together by inviting your friends to join your study circle.',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.white.withValues(alpha: 0.9),
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            
            // Content Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: SSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Stats Row
                  _buildAnimatedItem(
                    index: 0,
                    total: 4,
                    child: Row(
                      children: [
                        Expanded(
                          child: _buildStatCard(context, 'Friends Invited', '0', Icons.people_alt_rounded),
                        ),
                        const SizedBox(width: SSizes.md),
                        Expanded(
                          child: _buildStatCard(context, 'Link Clicks', '0', Icons.touch_app_rounded),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: SSizes.spaceBtwSections),

                  // Share Link Box
                  _buildAnimatedItem(
                    index: 1,
                    total: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Your Unique Link',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: SSizes.sm),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: SSizes.md, vertical: SSizes.sm),
                          decoration: BoxDecoration(
                            color: SColors.primaryLight.withValues(alpha: 0.05),
                            borderRadius: BorderRadius.circular(SSizes.borderRadiusLg),
                            border: Border.all(color: SColors.primary.withValues(alpha: 0.4), width: 1.5),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'https://studycycle.app/invite/abc123xyz',
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: SColors.primary,
                                      ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.copy_rounded, color: SColors.primary),
                                onPressed: () {
                                  Clipboard.setData(const ClipboardData(text: 'https://studycycle.app/invite/abc123xyz'));
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Link copied to clipboard!')),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: SSizes.spaceBtwSections),

                  // Share Button
                  _buildAnimatedItem(
                    index: 2,
                    total: 4,
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () => _showShareModal(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: SColors.primary,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.all(SSizes.md),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(SSizes.borderRadiusLg),
                          ),
                        ),
                        icon: const Icon(Icons.share_rounded),
                        label: const Text('Share Link Now'),
                      ),
                    ),
                  ),
                  const SizedBox(height: SSizes.md),
                  
                  // Instruction
                  _buildAnimatedItem(
                    index: 3,
                    total: 4,
                    child: Center(
                      child: Text(
                        'Copy and send the link above or click the share button to invite friends directly via your favorite apps.',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.grey.shade600,
                            ),
                        textAlign: TextAlign.center,
                      ),
                    ),
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

  Widget _buildStatCard(BuildContext context, String title, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(SSizes.md),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(SSizes.borderRadiusLg),
        boxShadow: [
          BoxShadow(
            color: SColors.primary.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: SColors.primaryLight.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: SColors.primary, size: 28),
          const SizedBox(height: SSizes.md),
          Text(
            value,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }

  void _showShareModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(SSizes.defaultSpace),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Share via',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: SSizes.spaceBtwItems),
              Wrap(
                spacing: SSizes.md,
                runSpacing: SSizes.md,
                children: [
                  _buildShareOption(
                    context, 
                    label: 'WhatsApp', 
                    iconWidget: const Icon(Icons.chat_rounded, color: Colors.green, size: 28), 
                    color: Colors.green
                  ),
                  _buildShareOption(
                    context, 
                    label: 'Messages', 
                    iconWidget: const Icon(Icons.message_rounded, color: Colors.blue, size: 28), 
                    color: Colors.blue
                  ),
                  _buildShareOption(
                    context, 
                    label: 'X', 
                    iconWidget: const Text(
                      '𝕏', 
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black, height: 1.0),
                    ), 
                    color: Colors.grey.shade400
                  ),
                  _buildShareOption(
                    context, 
                    label: 'Email', 
                    iconWidget: const Icon(Icons.email_rounded, color: Colors.redAccent, size: 28), 
                    color: Colors.redAccent
                  ),
                  _buildShareOption(
                    context, 
                    label: 'Copy Link', 
                    iconWidget: Icon(Icons.copy_rounded, color: Colors.grey.shade700, size: 28), 
                    color: Colors.grey.shade700
                  ),
                  _buildShareOption(
                    context, 
                    label: 'More', 
                    iconWidget: Icon(Icons.more_horiz_rounded, color: Colors.grey.shade800, size: 28), 
                    color: Colors.grey.shade800
                  ),
                ],
              ),
              const SizedBox(height: SSizes.md),
            ],
          ),
        );
      },
    );
  }

  Widget _buildShareOption(BuildContext context, {required String label, required Widget iconWidget, required Color color}) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        if (label == 'Copy Link') {
          Clipboard.setData(const ClipboardData(text: 'https://studycycle.app/invite/abc123xyz'));
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Link copied to clipboard!')),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Opening $label...')),
          );
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: iconWidget,
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
