import 'package:flutter/material.dart';
import 'package:portfolio/Components/sidebar.dart';

class ContactMe extends StatelessWidget {
  ContactMe({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) => Scaffold(
      key: _scaffold,
      backgroundColor: const Color.fromARGB(255, 53, 0, 62),
      body : Stack(
        children: [
          IconButton(icon: const Icon(Icons.menu, color:Color.fromARGB(255, 2, 229, 254), size : 30.0), onPressed: () => _scaffold.currentState!.openDrawer()),
          const Center(child: Text('Contact Me !', style : TextStyle(color : Colors.white, fontSize: 30))),
        ],
      ),
      drawer: const Sidebar(),
      );
}