import 'package:flutter/material.dart';
import 'package:thai_temple_app/utils/app_color.dart';

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
        backgroundColor: AppColor.primary,
        foregroundColor: AppColor.font_color,
      ),
      backgroundColor: AppColor.background,
      body: Center(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
