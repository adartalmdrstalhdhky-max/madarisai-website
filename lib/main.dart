import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'services/auth_service.dart';
import 'screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // إنشاء أول Admin تلقائياً
  final AuthService authService = AuthService();
  await authService.initializeAdmin();

  runApp(MadarisAIApp());
}

class MadarisAIApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MadarisAI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(), // الشاشة الأولى هي شاشة تسجيل الدخول
    );
  }
}
