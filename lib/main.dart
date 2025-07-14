import 'package:flutter/material.dart';
import 'package:messenger_app_flutter/widgets/categories.dart';
import 'package:messenger_app_flutter/widgets/favorite_contacts.dart';
import 'package:messenger_app_flutter/widgets/menu_chate.dart';

void main() {
  runApp(const MyApp());
}

const Color backgroundColor = Color(0xFF283F4D);
const Color containerBackground = Color(0xFF112734);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
          color: Colors.white,
          iconSize: 30.0,
        ),
        title: const Text(
          'Chats',
          style: TextStyle(
            fontSize: 28.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
            iconSize: 30.0,
            color: Colors.white,
          )
        ],
      ),
      backgroundColor: backgroundColor,
      body: Column(
        children: <Widget>[
          const CategoriesSelector(),
          Expanded(
              child: Container(
            decoration: const BoxDecoration(
              color: containerBackground,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text(
                        'Favorite Contacts',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18.0,
                          color: Colors.white54,
                          letterSpacing: 0.8,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.more_horiz,
                        ),
                        iconSize: 40.0,
                        color: Colors.white54,
                      )
                    ],
                  ),
                ),
                const FavoriteContacts(),
                const MenuChate()
              ],
            ),
          ))
        ],
      ),
    );
  }
}
