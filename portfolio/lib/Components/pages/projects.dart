import 'package:flutter/material.dart';
import 'package:portfolio/Components/sidebar.dart';

class Projects extends StatelessWidget {

  final GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();

  Projects({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffold,
      body : Stack(
        children: [
          IconButton(icon: const Icon(Icons.menu, color:Colors.black), onPressed: () => _scaffold.currentState!.openDrawer()),
          const Center(child: Text('Here are all my projects that you can find on my github')),
        ],
      ),
      drawer: const Sidebar(),
      
      // body: Center(
      //   child: Text('Portfolio Luc Schmitt'),
      // ),
    );
  }
}