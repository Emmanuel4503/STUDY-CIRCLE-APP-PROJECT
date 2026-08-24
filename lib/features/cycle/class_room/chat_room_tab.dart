import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:studycycle/utils/constants/colors.dart';

class _ChatMessage {
  final String senderName;
  final String message;
  final String time;
  final bool isMe;
  final Color avatarColor;

  _ChatMessage({
    required this.senderName,
    required this.message,
    required this.time,
    this.isMe = false,
    this.avatarColor = Colors.grey,
  });
}

class ChatroomTab extends StatefulWidget {
  final String groupTitle;
  final String groupMembers;

  const ChatroomTab({
    super.key,
    this.groupTitle = 'Accounting 101',
    this.groupMembers = '24 Members',
  });

  @override
  State<ChatroomTab> createState() => _ChatroomTabState();
}

class _ChatroomTabState extends State<ChatroomTab> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  final List<_ChatMessage> _messages = [
    _ChatMessage(
      senderName: 'Sarah M.',
      message: 'Hey everyone! Has anyone started on Chapter 5?',
      time: '9:15 AM',
      avatarColor: Colors.purple.shade300,
    ),
    _ChatMessage(
      senderName: 'James K.',
      message: 'Yes! The balance sheet section is tricky though 😅',
      time: '9:18 AM',
      avatarColor: Colors.blue.shade300,
    ),
    _ChatMessage(
      senderName: 'Amina D.',
      message: 'I found a great YouTube video that explains it really well 📺',
      time: '9:22 AM',
      avatarColor: Colors.orange.shade300,
    ),
    _ChatMessage(
      senderName: 'James K.',
      message: 'Oh nice! Can you share the link?',
      time: '9:24 AM',
      avatarColor: Colors.blue.shade300,
    ),
    _ChatMessage(
      senderName: 'Amina D.',
      message: 'Sure! Here it is: youtu.be/accounting101',
      time: '9:25 AM',
      avatarColor: Colors.orange.shade300,
    ),
    _ChatMessage(
      senderName: 'You',
      message: 'Can someone share the assignment deadline?',
      time: '9:30 AM',
      isMe: true,
    ),
    _ChatMessage(
      senderName: 'Prof. Williams',
      message: "It's due next Friday, September 5th. Don't forget to include the income statement!",
      time: '9:32 AM',
      avatarColor: Colors.red.shade300,
    ),
    _ChatMessage(
      senderName: 'Sarah M.',
      message: 'Thanks Prof! 🙏',
      time: '9:33 AM',
      avatarColor: Colors.purple.shade300,
    ),
  ];

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Chat Header
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            border: Border(bottom: BorderSide(color: Theme.of(context).dividerColor)),
          ),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: SColors.primaryLight.withValues(alpha: 0.2),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Iconsax.book_1_copy, color: SColors.primary),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.groupTitle,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${widget.groupMembers} · 8 online',
                          style: TextStyle(
                            fontSize: 12,
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.more_vert),
                color: Theme.of(context).colorScheme.onSurfaceVariant,
                onPressed: () {},
              ),
            ],
          ),
        ),
        
        // Messages Area
        Expanded(
          child: Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(16.0),
              itemCount: _messages.length + 1, // +1 for the date separator
              itemBuilder: (context, index) {
                if (index == 0) {
                  return _buildDateSeparator();
                }
                final message = _messages[index - 1];
                return _buildMessageBubble(message);
              },
            ),
          ),
        ),
        
        // Input Bar
        _buildInputBar(),
      ],
    );
  }

  Widget _buildDateSeparator() {
    return Container(
      margin: const EdgeInsets.only(bottom: 24.0, top: 8.0),
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            'Today',
            style: TextStyle(
              fontSize: 12,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMessageBubble(_ChatMessage message) {
    if (message.isMe) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 16.0, left: 48.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              decoration: BoxDecoration(
                color: SColors.primary,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(4),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Text(
                message.message,
                style: const TextStyle(
                  color: SColors.white,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              message.time,
              style: TextStyle(
                fontSize: 11,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0, right: 48.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 16,
            backgroundColor: message.avatarColor,
            child: Text(
              message.senderName[0],
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  message.senderName,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                      bottomLeft: Radius.circular(4),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 5,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Text(
                    message.message,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  message.time,
                  style: TextStyle(
                    fontSize: 11,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border(top: BorderSide(color: Theme.of(context).dividerColor)),
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.attach_file_rounded),
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            onPressed: () {},
          ),
          const SizedBox(width: 4),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(24),
              ),
              child: TextField(
                controller: _messageController,
                decoration: const InputDecoration(
                  hintText: 'Type a message...',
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 12.0),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            decoration: const BoxDecoration(
              color: SColors.primary,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.send_rounded),
              color: SColors.white,
              iconSize: 20,
              onPressed: () {
                // Send logic here
              },
            ),
          ),
        ],
      ),
    );
  }
}
