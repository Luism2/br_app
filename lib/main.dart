import 'package:br_app/sliver_tab_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BR_UTTlax',
      home: Scaffold(
        body: BrUTT(),
      ),
    );
  }
}
