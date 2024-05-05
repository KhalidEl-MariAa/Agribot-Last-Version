import 'package:flutter/material.dart';
import 'package:flutter_application_1/Navigation%20Drawer/aboustUs_viem.dart';
import 'package:flutter_application_1/Navigation%20Drawer/help_view.dart';
import 'package:flutter_application_1/NavigationBar/main_page.dart';
import 'package:flutter_application_1/auth/login_view.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      backgroundColor: Colors.teal[400],
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            padding: const EdgeInsets.only(top: 40),
            alignment: Alignment.center,
            color: Colors.amber[400],
            child: const Text(
              'your guide to help',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const MainPage(),
              ));
            },
            leading: const Icon(
              Icons.home,
              size: 30,
              color: Colors.amber,
            ),
            title: const Text(
              'Home',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const AboutUs(),
              ));
            },
            leading: const Icon(
              Icons.business_sharp,
              size: 30,
              color: Colors.amber,
            ),
            title: const Text(
              'About Us',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const Help(),
              ));
            },
            leading: const Icon(
              Icons.help,
              size: 30,
              color: Colors.amber,
            ),
            title: const Text(
              'Help',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(
              Icons.account_circle_rounded,
              size: 30,
              color: Colors.amber,
            ),
            title: const Text(
              'Contact Me',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Divider(
            color: Colors.amber,
            thickness: 2,
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const LoginViem2(),
              ));
            },
            leading: const Icon(
              Icons.logout_outlined,
              size: 30,
              color: Colors.amber,
            ),
            title: const Text(
              'LOG OUT',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
