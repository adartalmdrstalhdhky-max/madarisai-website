import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // تسجيل الدخول
  Future<User?> signIn(String email, String password) async {
    try {
      final UserCredential cred = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return cred.user;
    } catch (e) {
      print('Sign in error: $e');
      return null;
    }
  }

  // إنشاء أول Admin تلقائياً
  Future<void> initializeAdmin() async {
    const String adminEmail = "admin@madarisai.com";
    const String adminPassword = "Admin12345";
    const String adminName = "Super Admin";
    const String adminSchool = "MadarisAI HQ";

    try {
      // تحقق إذا Admin موجود بالفعل
      final List<String> methods =
          await _auth.fetchSignInMethodsForEmail(adminEmail);
      if (methods.isEmpty) {
        // إنشاء مستخدم جديد
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: adminEmail, password: adminPassword);

        // حفظ بياناته في Firestore
        await _firestore.collection('users').doc(cred.user!.uid).set({
          'id': cred.user!.uid,
          'name': adminName,
          'role': 'admin',
          'school': adminSchool,
        });

        print('Admin user created successfully.');
      } else {
        print('Admin already exists.');
      }
    } catch (e) {
      print('Error initializing Admin: $e');
    }
  }
}
