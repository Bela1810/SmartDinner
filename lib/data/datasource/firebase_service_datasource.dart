import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:smartdinner/domain/datasource/auth_datasource.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smartdinner/domain/model/user_model.dart';

class FirebaseServiceDatasource implements AuthDatasource {
  final fb.FirebaseAuth _auth = fb.FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<User> login(String email, String password) async {
    final credential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    final uid = credential.user?.uid;
    if (uid == null) throw Exception('Usuario no encontrado');

    final doc = await _firestore.collection('users').doc(uid).get();
    final data = doc.data();

    if (data == null) throw Exception('Datos de usuario no encontrados');

    return User(
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      profileImage: data['profileImage'] ??
          'https://cdn-icons-png.flaticon.com/512/149/149071.png', // imagen por defecto
      createdAt: (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }

  @override
  Future<void> register(String name, String email, String password) async {
    final userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    final uid = userCredential.user?.uid;
    if (uid != null) {
      await _firestore.collection('users').doc(uid).set({
        'name': name,
        'email': email,
        'profileImage': 'https://cdn-icons-png.flaticon.com/512/149/149071.png',
        'createdAt': FieldValue.serverTimestamp(),
      });
    }
  }

  @override
  Future<void> logout() async {
    await _auth.signOut();
  }
}
