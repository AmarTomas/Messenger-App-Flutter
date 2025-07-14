// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:messenger_app_flutter/chat_screen.dart';
import 'package:messenger_app_flutter/model/message_model.dart';

class FavoriteContacts extends StatefulWidget {
  const FavoriteContacts({super.key});

  @override
  _FavoriteContactsState createState() => _FavoriteContactsState();
}

class _FavoriteContactsState extends State<FavoriteContacts> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 15.0),
        scrollDirection: Axis.horizontal,
        itemCount: favorate.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (_) {
                  return ChatScreen(user: favorate[index]);
                },
              ));
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 35.0,
                      backgroundImage: AssetImage(favorate[index].imageUrl),
                    ),
                  ),
                  Text(
                    favorate[index].name,
                    style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.8,
                        color: Colors.white38),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
