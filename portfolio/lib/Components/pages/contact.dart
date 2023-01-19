import 'package:flutter/material.dart';
import 'package:portfolio/Components/sidebar.dart';

class ContactMe extends StatelessWidget {
  ContactMe({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) => Scaffold(
      key: _scaffold,
      body : Stack(
        children: [
          IconButton(icon: const Icon(Icons.menu, color:Colors.black), onPressed: () => _scaffold.currentState!.openDrawer()),
          const Center(child: Text('Contact Me !')),
        ],
      ),
      drawer: const Sidebar(),
      );
}