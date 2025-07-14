// ignore_for_file: library_private_types_in_public_api, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:messenger_app_flutter/chat_screen.dart';
import 'package:messenger_app_flutter/main.dart';
import 'package:messenger_app_flutter/model/message_model.dart';

class MenuChate extends StatefulWidget {
  const MenuChate({super.key});

  @override
  _MenuChateState createState() => _MenuChateState();
}

class _MenuChateState extends State<MenuChate> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
          decoration: BoxDecoration(
            color: backgroundColor.withOpacity(0.2),
          ),
          child: ListView.builder(
            padding: const EdgeInsets.only(top: 10),
            itemCount: chats.length,
            itemBuilder: (context, index) {
              final Message chate = chats[index];
              return GestureDetector(
                onTap: () {
                  setState(() {
                    chats[index].unread = !chats[index].unread;
                  });
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) {
                      return ChatScreen(user: chate.sender);
                    },
                  ));
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    height: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: chate.unread
                            ? backgroundColor.withOpacity(0.3)
                            : Colors.transparent),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: CircleAvatar(
                                radius: 40.0,
                                backgroundImage:
                                    AssetImage(chate.sender.imageUrl),
                              )),
                          Expanded(
                              flex: 3,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, top: 30.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      chate.sender.name,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.0,
                                          color: Colors.white,
                                          letterSpacing: 0.8),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      chate.text,
                                      style: const TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.grey,
                                          letterSpacing: 0.8),
                                      overflow: TextOverflow.ellipsis,
                                    )
                                  ],
                                ),
                              )),
                          Expanded(
                              flex: 1,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 20.0, left: 5.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      chate.time,
                                      maxLines: 1,
                                      style: const TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.white24,
                                          fontWeight: FontWeight.w800),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    chate.unread
                                        ? Container(
                                            height: 30,
                                            width: 45,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.red,
                                            ),
                                            child: const Center(
                                              child: Text(
                                                'new',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 14.0,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          )
                                        : const Text('')
                                  ],
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          )),
    ));
  }
}
