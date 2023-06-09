import 'package:flutter/material.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({super.key});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
        backgroundColor: Colors.yellow,
        foregroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
