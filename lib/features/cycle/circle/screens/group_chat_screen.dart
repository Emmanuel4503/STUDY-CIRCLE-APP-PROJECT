import 'package:flutter/material.dart';
import 'package:studycycle/utils/constants/colors.dart';
import 'package:studycycle/utils/constants/spacing.dart';
import 'package:studycycle/utils/widgets/custom_appbar.dart';
import 'package:studycycle/utils/widgets/custom_card.dart';

class GroupChatScreen extends StatefulWidget {
  const GroupChatScreen({super.key});

  @override
  State<GroupChatScreen> createState() => _GroupChatScreenState();
}

class _ChatMessage {
  const _ChatMessage({
    required this.text,
    required this.isMe,
    required this.time,
    required this.sender,
  });

  final String text;
  final bool isMe;
  final String time;
  final String sender;
}

class _GroupChatScreenState extends State<GroupChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  final List<_ChatMessage> _messages = const [
    _ChatMessage(
      text: 'Hey everyone! Let’s start the revision session at 7.',
      isMe: false,
      time: '09:10',
      sender: 'Alicia',
    ),
    _ChatMessage(
      text: 'Perfect. I’ll bring the summary notes.',
      isMe: true,
      time: '09:12',
      sender: 'You',
    ),
    _ChatMessage(
      text: 'I’m online and ready to share resources.',
      isMe: false,
      time: '09:13',
      sender: 'Daniel',
    ),
  ];

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final text = _messageController.text.trim();
    if (text.isEmpty) {
      return;
    }

    setState(() {
      _messages.add(
        _ChatMessage(
          text: text,
          isMe: true,
          time: 'Now',
          sender: 'You',
        ),
      );
      _messageController.clear();
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Study Circle Chat',
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.call_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.videocam_outlined),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
              SSpacing.screenPadding,
              SSpacing.md,
              SSpacing.screenPadding,
              SSpacing.sm,
            ),
            child: CustomCard(
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 28,
                    backgroundColor: SColors.primaryLight,
                    child: Icon(Icons.groups, color: SColors.white),
                  ),
                  const SizedBox(width: SSpacing.md),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Mathematics Sprint Group',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: SSpacing.xs),
                        Text(
                          '12 online • 28 members',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: SSpacing.sm,
                      vertical: SSpacing.xs,
                    ),
                    decoration: BoxDecoration(
                      color: SColors.primary.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: const Text(
                      'Active',
                      style: TextStyle(
                        color: SColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(
                  horizontal: SSpacing.screenPadding),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return Align(
                  alignment: message.isMe
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: SSpacing.sm),
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.75,
                    ),
                    padding: const EdgeInsets.all(SSpacing.md),
                    decoration: BoxDecoration(
                      color: message.isMe ? SColors.primary : SColors.lightGrey,
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(16),
                        topRight: const Radius.circular(16),
                        bottomLeft: Radius.circular(message.isMe ? 16 : 4),
                        bottomRight: Radius.circular(message.isMe ? 4 : 16),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (!message.isMe)
                          Text(
                            message.sender,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: message.isMe
                                  ? SColors.white
                                  : SColors.primary,
                            ),
                          ),
                        const SizedBox(height: SSpacing.xs),
                        Text(
                          message.text,
                          style: TextStyle(
                            color:
                                message.isMe ? SColors.white : SColors.darkGrey,
                          ),
                        ),
                        const SizedBox(height: SSpacing.xs),
                        Text(
                          message.time,
                          style: TextStyle(
                            fontSize: 11,
                            color: message.isMe
                                ? SColors.white.withValues(alpha: 0.8)
                                : SColors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(
              SSpacing.screenPadding,
              SSpacing.sm,
              SSpacing.screenPadding,
              SSpacing.md,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              border: Border(
                top: BorderSide(color: Theme.of(context).dividerColor),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      filled: true,
                      fillColor: SColors.lightGrey,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(999),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: SSpacing.md),
                    ),
                    onSubmitted: (_) => _sendMessage(),
                  ),
                ),
                const SizedBox(width: SSpacing.sm),
                CircleAvatar(
                  backgroundColor: SColors.primary,
                  child: IconButton(
                    icon: const Icon(Icons.send_rounded, color: SColors.white),
                    onPressed: _sendMessage,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
