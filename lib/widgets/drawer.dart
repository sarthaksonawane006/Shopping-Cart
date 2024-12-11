import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_cart/screens/home_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_declarations
    final imageUrl =
        "https://www.slashfilm.com/img/gallery/one-piece-film-red-showcases-luffys-new-transformation-for-the-first-time/l-intro-1667316814.jpg";

    return Drawer(
      backgroundColor: const Color.fromARGB(255, 115, 84, 169),
      child: ListView(padding: EdgeInsets.zero, children: [
        DrawerHeader(
          padding: EdgeInsets.zero,
          child: UserAccountsDrawerHeader(
            accountName: const Text("Tanmay Sonawane"),
            accountEmail: const Text("sonawanetanmay56@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(imageUrl),
            ),
          ),
        ),
        ListTile(
          onTap: () => Navigator.pushNamed(context, HomeScreen.routeName),
          leading: const Icon(
            CupertinoIcons.home,
            color: Colors.white,
          ),
          // ignore: deprecated_member_use
          title: const Text(
            "Home",
            style: TextStyle(color: Colors.white),
          ),
        ),
        const ListTile(
          leading: Icon(
            CupertinoIcons.profile_circled,
            color: Colors.white,
          ),
          // ignore: deprecated_member_use
          title: Text(
            "Profile",
            style: TextStyle(color: Colors.white),
          ),
        ),
        const ListTile(
          leading: Icon(
            CupertinoIcons.mail,
            color: Colors.white,
          ),
          // ignore: deprecated_member_use
          title: Text(
            "Contact Us",
            style: TextStyle(color: Colors.white),
          ),
        )
      ]),
    );
  }
}
