import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
        backgroundColor: const Color(0xFF2196F3),
      ),
      body: const Center(
        child: Text(
          'Your favorite items will appear here',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
