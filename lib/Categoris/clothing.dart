import 'package:flutter/material.dart';

class Clothing extends StatefulWidget {
  const Clothing({super.key});

  @override
  State<Clothing> createState() => _ClothingState();
}

class _ClothingState extends State<Clothing> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          
      appBar: AppBar(
        title: const Text('Clothing'),
        backgroundColor: const Color(0xFF2196F3),
      ),
    
    );
  }
}