import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/view/core.dart';

void main() {
  runApp(const ProviderScope(child: Lava()));
}

class Lava extends StatelessWidget {
  const Lava({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const Core(),
    );
  }
}
