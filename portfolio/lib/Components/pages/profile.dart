import 'package:flutter/material.dart';
import 'package:portfolio/Components/sidebar.dart';

class Profile extends StatelessWidget {

  final GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();

  Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffold,
      body : Stack(
        children: [
          IconButton(icon: const Icon(Icons.menu, color:Colors.black), onPressed: () => _scaffold.currentState!.openDrawer()),
          const Center(child: Text('Presentation of myself')),
        ],
      ),
      drawer: const Sidebar(),
      
      // body: Center(
      //   child: Text('Portfolio Luc Schmitt'),
      // ),
    );
  }
}