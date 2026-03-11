import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _authService = AuthService();

  bool _loading = false;
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('تسجيل الدخول - MadarisAI')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'البريد الإلكتروني'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'كلمة المرور'),
              obscureText: true,
            ),
            SizedBox(height: 24),
            if (_loading) CircularProgressIndicator(),
            if (_errorMessage != null)
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Text(
                  _errorMessage!,
                  style: TextStyle(color: Colors.red),
                ),
              ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: _login,
              child: Text('تسجيل الدخول'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _login() async {
    setState(() {
      _loading = true;
      _errorMessage = null;
    });

    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    try {
      final role = await _authService.signIn(email, password);

      // توجه المستخدم حسب الدور
      if (role == 'Admin') {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => RolePage(role: 'Admin')));
      } else if (role == 'Teacher') {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => RolePage(role: 'Teacher')));
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => RolePage(role: 'Student')));
      }
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
      });
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }
}

// صفحة مؤقتة لكل دور
class RolePage extends StatelessWidget {
  final String role;
  RolePage({required this.role});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('مرحبا $role')),
      body: Center(
        child: Text('أنت سجلت دخولك كـ $role',
            style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
