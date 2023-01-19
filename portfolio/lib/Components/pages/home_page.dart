import 'package:flutter/material.dart';
import 'package:portfolio/Components/sidebar.dart';

class HomePage extends StatelessWidget {

  final GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffold,
      backgroundColor: Color.fromARGB(255, 53, 0, 62),
      body : Stack(
        children: [
          IconButton(icon: const Icon(Icons.menu, color:Color.fromARGB(255, 2, 229, 254), size : 30.0), onPressed: () => _scaffold.currentState!.openDrawer()),
          const Center(child: Text('Portfolio Luc Schmitt', style : TextStyle(color : Colors.white, fontSize: 30))),
        ],
      ),
      drawer: const Sidebar(),
      
      // body: Center(
      //   child: Text('Portfolio Luc Schmitt'),
      // ),
    );
  }
}