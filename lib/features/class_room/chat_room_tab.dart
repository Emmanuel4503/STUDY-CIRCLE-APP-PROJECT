import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:studycycle/utils/constants/colors.dart';

class ChatroomTab extends StatelessWidget {
  const ChatroomTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. WELCOME BANNER WITH GRADIENT BLEND & DROP SHADOW
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [SColors.primary, SColors.primaryDark],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: SColors.primary.withValues(alpha: 0.3),
                  blurRadius: 15,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'LIVE DISCUSSION',
                      style: TextStyle(
                        color: SColors.secondary,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.5,
                        fontSize: 12,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: SColors.white.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Row(
                        children: [
                          CircleAvatar(
                              radius: 4, backgroundColor: Colors.greenAccent),
                          SizedBox(width: 4),
                          Text('142 Online',
                              style: TextStyle(
                                  color: SColors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 12),
                const Text(
                  'Collaborate in Real-Time',
                  style: TextStyle(
                      color: SColors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  'Share resources, clarify blockers, and work alongside peers.',
                  style: TextStyle(
                      color: SColors.white.withValues(alpha: 0.8),
                      fontSize: 13),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // SECTION HEADER WITH TRANSPARENT OUTLINE TEXT EFFECT
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Active Circles',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: SColors.darkGrey,
                    shadows: [
                      Shadow(
                          offset: const Offset(0, 1),
                          blurRadius: 2,
                          color: Colors.black.withValues(alpha: 0.05))
                    ]),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('View All',
                    style: TextStyle(
                        color: SColors.primary, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const SizedBox(height: 10),

          // 2. ACTIVE CHATROOM CARDS WITH OPACITY FILTERS & BORDERS
          _buildChatGroupCard(
            title: 'Calculus II Prep Group',
            subtitle: 'Discussing Integration by Parts right now...',
            tag: 'Mathematics',
            membersCount: 24,
            isTrending: true,
          ),
          _buildChatGroupCard(
            title: 'UI/UX Design Studio',
            subtitle: 'Critique my study application dashboards!',
            tag: 'Design',
            membersCount: 11,
            isTrending: false,
          ),
          _buildChatGroupCard(
            title: 'MCAT Biology Review',
            subtitle: 'Flashcards on Cellular Respiration pathways',
            tag: 'Medicine',
            membersCount: 45,
            isTrending: false,
          ),
        ],
      ),
    );
  }

  // REUSABLE GLASS-MORPHIC CHATROOM CARD ARCHITECTURE
  Widget _buildChatGroupCard({
    required String title,
    required String subtitle,
    required String tag,
    required int membersCount,
    required bool isTrending,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: SColors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: SColors.lightBorder, width: 1.2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: SColors.primary.withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        tag,
                        style: const TextStyle(
                          color: SColors.primary,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    if (isTrending)
                      Row(
                        children: [
                          const Icon(
                            Iconsax.flash_1_copy,
                            color: SColors.warning,
                            size: 14,
                          ),
                          const SizedBox(width: 2),
                          Text(
                            'TRENDING',
                            style: TextStyle(
                              color: SColors.warning.withValues(alpha: 0.9),
                              fontSize: 10,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: SColors.lightTextPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 13,
                    color: SColors.lightTextSecondary,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 14),
                const Divider(color: SColors.lightBorder, height: 1),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Iconsax.user_copy,
                          size: 14,
                          color: SColors.grey,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '$membersCount students active',
                          style: const TextStyle(
                            color: SColors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      Iconsax.arrow_right_3_copy,
                      size: 16,
                      color: SColors.primary.withValues(alpha: 0.7),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
