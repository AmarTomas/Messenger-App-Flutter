// ignore_for_file: non_constant_identifier_names

import 'package:messenger_app_flutter/model/user_model.dart';

class Message {
  final User sender;
  final String time;
  final String text;
  final String? image;
  final bool isLiked;
  bool unread;

  Message({
    required this.sender,
    required this.time,
    required this.text,
    this.image,
    required this.isLiked,
    required this.unread,
  });
}

final User currentUser =
    User(id: 0, name: 'currentUser', imageUrl: 'assets/images/user.png');
final User amar_tomas =
    User(id: 1, name: 'Amar Tomas', imageUrl: 'assets/images/img01.jpg');
final User ali = User(id: 2, name: 'ali', imageUrl: 'assets/images/img02.jpg');
final User ahmed =
    User(id: 3, name: 'ahmed', imageUrl: 'assets/images/img03.jpg');
final User mohamed =
    User(id: 4, name: 'mohamed', imageUrl: 'assets/images/img04.jpg');
final User amar =
    User(id: 5, name: 'amar', imageUrl: 'assets/images/img05.jpg');
final User nasser =
    User(id: 6, name: 'nasser', imageUrl: 'assets/images/img06.jpg');
List<User> favorate = [amar_tomas, nasser, mohamed, ali, ahmed, amar];
List<Message> chats = [
  Message(
      sender: nasser,
      time: '10:30 AM',
      text: "Hey team, don't forget about our meeting at 2 PM today!",
      isLiked: false,
      unread: true),
  Message(
      sender: amar_tomas,
      time: '10:32 AM',
      text: "I've prepared the presentation slides. Should I share them now?",
      isLiked: true,
      unread: true),
  Message(
      sender: mohamed,
      time: '10:35 AM',
      text: "Yes please share them. I'll send the meeting link shortly.",
      isLiked: false,
      unread: false),
  Message(
      sender: ahmed,
      time: '10:38 AM',
      text: "I might be 5 minutes late, stuck in another call.",
      isLiked: false,
      unread: false),
  Message(
      sender: amar,
      time: '10:40 AM',
      text: "No problem. I've reviewed the slides, they look great!",
      isLiked: true,
      unread: true),
  Message(
      sender: currentUser,
      time: '10:42 AM',
      text: "Has anyone seen the latest sales report?",
      isLiked: false,
      unread: false),
  Message(
      sender: ali,
      time: '10:45 AM',
      text: "I'll send it to you right now.",
      isLiked: true,
      unread: true)
];

List<Message> messages = [
  Message(
      sender: currentUser,
      time: '10:30 AM',
      text: "Hey team, don't forget about our meeting at 2 PM today!",
      isLiked: false,
      unread: true),
  Message(
      sender: ali,
      time: '10:32 AM',
      text: "I've prepared the presentation slides. Should I share them now?",
      isLiked: true,
      unread: true),
  Message(
      sender: currentUser,
      time: '10:35 AM',
      text: "Yes please share them. I'll send the meeting link shortly.",
      isLiked: false,
      unread: false),
  Message(
      sender: ahmed,
      time: '10:38 AM',
      text: "I might be 5 minutes late, stuck in another call.",
      isLiked: false,
      unread: false),
  Message(
      sender: amar,
      time: '10:40 AM',
      text: "No problem. I've reviewed the slides, they look great!",
      isLiked: true,
      unread: true),
  Message(
      sender: currentUser,
      time: '10:42 AM',
      text: "Has anyone seen the latest sales report?",
      isLiked: false,
      unread: false),
  Message(
      sender: ali,
      time: '10:45 AM',
      text: "I'll send it to you right now.",
      isLiked: true,
      unread: true)
];
