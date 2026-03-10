import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MadarisAI());
}

class MadarisAI extends StatelessWidget {
  const MadarisAI({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MadarisAI',
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MadarisAI'),
      ),
      body: const Center(
        child: Text(
          'MadarisAI Platform Ready',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
