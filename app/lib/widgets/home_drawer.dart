import 'package:flutter/material.dart';
import 'package:app/data/app_colors.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.85,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: AppColors.blue,
              ),
              child: Row(children: [
                Image(
                  image: AssetImage('assets/images/logo.png'),
                  width: 40,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'SkyCast',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ]),
            ),
            ListTile(
              leading: const Icon(Icons.open_in_new_rounded),
              title: const Text('Website'),
              onTap: () async {
                const url = 'https://www.google.com/'; // Replace by the hosted web app URL
                if (await canLaunchUrlString(url)) {
                  await launchUrlString(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
