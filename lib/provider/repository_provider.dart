import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartdinner/data/datasource/firebase_service_datasource.dart';
import 'package:smartdinner/data/repository/auth_repository.dart';
import 'package:smartdinner/domain/datasource/auth_datasource.dart';

final authDatasourceProvider =
    Provider<AuthDatasource>((ref) => FirebaseServiceDatasource());

final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => AuthRepository(ref.read(authDatasourceProvider)),
);

final authStateProvider = StreamProvider<User?>((ref) {
  return FirebaseAuth.instance.authStateChanges();
});
