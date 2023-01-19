import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var currentRoute = ModalRoute.of(context)!.settings.name;
    return Drawer(
      width: 150,
      backgroundColor: const Color.fromARGB(255, 128, 2, 126),
      child: ListView(
        padding: const EdgeInsets.all(40.0),
        children: <Widget>[
          Column(children: [
            ListTile(
              leading: const Icon(Icons.menu,
                  color: Color.fromARGB(255, 2, 229, 254), size: 30.0),
              onTap: Navigator.of(context).pop,
            ),
            const SizedBox(height: 25),
            ListTile(
                visualDensity: VisualDensity.comfortable,
                leading: 
                currentRoute == '/home' ? 
                const Icon(Icons.home,
                    color: Color.fromARGB(255, 2, 254, 103), size: 30.0)
                    :
                const Icon(Icons.home_outlined,
                    color: Color.fromARGB(255, 2, 229, 254), size: 30.0),
                onTap: () {
                  Navigator.of(context).pushNamed('/home');
                }),
            const SizedBox(height: 25),
            ListTile(
                leading: const Icon(Icons.person_outlined,
                    color: Color.fromARGB(255, 2, 229, 254), size: 30.0),
                onTap: () {
                  Navigator.of(context).pushNamed('/profile');
                }),
            const SizedBox(height: 25),
            ListTile(
                leading: const Icon(Icons.devices_outlined,
                    color: Color.fromARGB(255, 2, 229, 254), size: 30.0),
                onTap: () {
                  Navigator.of(context).pushNamed('/projects');
                }),
            const SizedBox(height: 25),
            ListTile(
                leading: const Icon(Icons.mail_outlined,
                    color: Color.fromARGB(255, 2, 229, 254), size: 30.0),
                onTap: () {
                  Navigator.of(context).pushNamed('/contact');
                }),
          ])
        ],
      ),
    );
  }
}
