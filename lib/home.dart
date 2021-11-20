import 'package:flutter/material.dart';
import 'static_routes.dart';
import 'colors.dart';
import 'pages.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);


  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: turquoise,
        title: const Text('Strona główna'),
      ),
      drawer: Drawer(
        child: ListView(

          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: turquoise,
              ),
              child: Text(
                'Smart Family',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Strona główna'),
                onTap: () {
                  goToPage(context, Pages.home);
                }
            ),
            ListTile(
              leading: const Icon(Icons.chat),
              title: const Text('Czat'),
                onTap: () {
                  goToPage(context, Pages.chat);
                }
            ),
            ListTile(
              leading: const Icon(Icons.euro),
              title: const Text('Budżet domowy'),
                onTap: () {
                  goToPage(context, Pages.homeBudget);
                }
            ),
            ListTile(
              leading: const Icon(Icons.fastfood),
              title: const Text('Lodówka'),
                onTap: () {
                  goToPage(context, Pages.fridge);
                }
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart),
              title: const Text('Zakupy'),
                onTap: () {
                  goToPage(context, Pages.shopping);
                }
            ),
            ListTile(
              leading: const Icon(Icons.calendar_today),
              title: const Text('Kalendarz'),
                onTap: () {
                  goToPage(context, Pages.calendar);
                }
            ),
            ListTile(
              leading: const Icon(Icons.gps_fixed),
              title: const Text('Lokalizacja'),
                onTap: () {
                  goToPage(context, Pages.localization);
                }
            ),
            ListTile(
              leading: const Icon(Icons.people),
              title: const Text('Moja rodzina'),
                onTap: () {
                  goToPage(context, Pages.myFamily);
                }
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Ustawienia'),
              onTap: () {
                goToPage(context, Pages.settings);
              }
            ),
          ],
        ),
      ),
    );
  }
}