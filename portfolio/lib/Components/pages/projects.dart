import 'package:flutter/material.dart';
import 'package:portfolio/Components/sidebar.dart';

class Projects extends StatelessWidget {

  final GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();

  Projects({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffold,
      backgroundColor: const Color.fromARGB(255, 53, 0, 62),
      body : Stack(
        children: [
          IconButton(icon: const Icon(Icons.menu, color:Color.fromARGB(255, 2, 229, 254), size : 30.0), onPressed: () => _scaffold.currentState!.openDrawer()),
          const Center(child: Text('Here are all my projects that you can find on my github', style : TextStyle(color : Colors.white, fontSize: 30))),
        ],
      ),
      drawer: const Sidebar(),
      
      // body: Center(
      //   child: Text('Portfolio Luc Schmitt'),
      // ),
    );
  }
}