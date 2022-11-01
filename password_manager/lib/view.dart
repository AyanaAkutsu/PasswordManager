

import 'package:flutter/material.dart';

class ViewScreenState extends StatefulWidget {
  const ViewScreenState({Key? key, required String title}) : super(key: key);
  @override
  State<ViewScreenState> createState() => _ViewScreenStateState();
}
class _ViewScreenStateState extends State<ViewScreenState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("View Screen")),
      body: Container(child: const Text("Body"),),
    );
  }
}