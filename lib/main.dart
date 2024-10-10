import 'package:flutter/material.dart';
import 'package:search_flutter/home_screen.dart';

void main() {
  runApp(const SearchApp());
}

class SearchApp extends StatelessWidget {
  const SearchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
