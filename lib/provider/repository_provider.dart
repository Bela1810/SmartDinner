import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartdinner/data/datasource/firebase_service_datasource.dart';
import 'package:smartdinner/data/repository/auth_repository.dart';

// final recipeApiRepositoryProvider = Provider<RecipeRepository>((ref) {
//   final recipeApiDatasource = RecipeApiDatasource();
//   final recipeApiRepository = RecipeRepository(recipeApiDatasource);
//   return recipeApiRepository;
// });

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final authDatasource = FirebaseServiceDatasource(FirebaseAuth.instance);
  final authRepository = AuthRepository(authDatasource);
  return authRepository;
});

final authStateProvider = StreamProvider<User?>((ref) {
  return ref.read(authRepositoryProvider).authStateChange;
});
