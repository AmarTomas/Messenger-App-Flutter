// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:messenger_app_flutter/main.dart';
import 'package:messenger_app_flutter/model/message_model.dart';
import 'package:messenger_app_flutter/model/user_model.dart';

class ChatScreen extends StatefulWidget {
  final User user;
  const ChatScreen({super.key, required this.user});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  final List<Message> _messages = [];

  @override
  void initState() {
    super.initState();

    _loadMessages();
  }

  void _loadMessages() {
    _messages.addAll(messages);
  }

  _buildMessage(Message message, bool isMe) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15.0),
      margin: isMe
          ? const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 80.0)
          : const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 80.0),
      decoration: BoxDecoration(
          color: isMe
              ? backgroundColor.withOpacity(0.5)
              : backgroundColor.withOpacity(0.3),
          borderRadius: isMe
              ? const BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0))
              : const BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            message.time,
            style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.white24),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(message.text,
              style: const TextStyle(
                  fontSize: 16.0,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.bold,
                  color: Colors.white70))
        ],
      ),
    );
  }

  _buildSendMessage() {
    return Container(
      height: 70,
      color: containerBackground,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
        child: Container(
          decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(20.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.photo_library),
                color: Colors.white54,
                iconSize: 25,
              ),
              Expanded(
                child: TextField(
                  controller: _textEditingController,
                  style: const TextStyle(color: Colors.white54),
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Send your Message',
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          color: Colors.white54,
                          letterSpacing: 1.2)),
                ),
              ),
              IconButton(
                onPressed: () {
                  if (_textEditingController.text.trim().isNotEmpty) {
                    _sendMessage();
                  }
                },
                icon: const Icon(Icons.send),
                color: Colors.white54,
                iconSize: 25,
              )
            ],
          ),
        ),
      ),
    );
  }

  void _sendMessage() {
    final now = DateTime.now();
    final newMessage = Message(
      sender: currentUser,
      time: _formatTime(now),
      text: _textEditingController.text,
      isLiked: false,
      unread: true,
    );

    setState(() {
      _messages.insert(0, newMessage);
      messages.insert(0, newMessage);
      _textEditingController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: backgroundColor,
        title: Text(
          widget.user.name,
          style: const TextStyle(
              fontSize: 25.0, fontWeight: FontWeight.bold, letterSpacing: 1.2),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_horiz),
            iconSize: 40.0,
          )
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  decoration: const BoxDecoration(
                      color: containerBackground,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30.0),
                          topLeft: Radius.circular(30.0))),
                  child: ListView.builder(
                    reverse: true,
                    padding: const EdgeInsets.only(top: 20.0),
                    itemCount: _messages.length,
                    itemBuilder: (context, index) {
                      final Message message = _messages[index];
                      final bool isMe = message.sender.id == currentUser.id;
                      return _buildMessage(message, isMe);
                    },
                  ),
                ),
              ),
            ),
            _buildSendMessage()
          ],
        ),
      ),
    );
  }
}

String _formatTime(DateTime time) {
  int hour = time.hour;
  int minute = time.minute;
  String period = hour >= 12 ? 'PM' : 'AM';
  hour = hour % 12;
  hour = hour == 0 ? 12 : hour;
  String minuteStr = minute < 10 ? '0$minute' : '$minute';
  return '$hour:$minuteStr $period';
}

// final ImagePicker _picker = ImagePicker();
//   // File? _selectedImage;
//
//   // Future<void> _pickImage() async {
//   //   try {
//   //     final XFile? image = await _picker.pickImage(
//   //       source: ImageSource.gallery,
//   //       imageQuality: 70,  (100-0)
//   //     );
//   //
//   //     if (image != null) {
//   //       setState(() {
//   //         _selectedImage = File(image.path);
//   //       });
//   //       _sendImageMessage(_selectedImage!);
//   //     }
//   //   } catch (e) {
//   //     print('Error picking image: $e');
//   //     ScaffoldMessenger.of(context).showSnackBar(
//   //       SnackBar(content: Text('فشل في اختيار الصورة')),
//   //     );
//   //   }
//   // }
//   //
//   // void _sendImageMessage(File image) {
// final now = DateTime.now();
//   //   print('تم اختيار الصورة: ${image.path}');
//   //   setState(() {
//   //     chats.add(
//   //       Message(
//   //         sender: currentUser,
//   //         time: _formatTime(now),
//   //         text: '',
//   //         image: image.path,
//   //         isLiked: false,
//   //         unread: true,
//   //       ),
//   //     );
//   //   });
//   // }
