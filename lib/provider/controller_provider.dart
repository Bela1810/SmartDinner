import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartdinner/controller/auth_controller.dart';
import 'package:smartdinner/controller/login_state.dart';

// final recipeListByCategoryControllerProvider = StateNotifierProvider<
//     RecipeListByCategoryController, RecipeListByCategoryState>((ref) {
//   final recipeRepository = ref.watch(recipeApiRepositoryProvider);
//   final recipeListByCategoryController =
//       RecipeListByCategoryController(recipeRepository);
//   recipeListByCategoryController.initialize();
//   return recipeListByCategoryController;
// });

// final favoriteRecipeListControllerProvider =
//     StateNotifierProvider<FavoriteRecipeListController, List<Recipe>>((ref) {
//   return FavoriteRecipeListController();
// });

final loginControllerProvider =
    StateNotifierProvider<LoginController, LoginState>(
  (ref) => LoginController(ref),
);

final registerControllerProvider =
    StateNotifierProvider<RegisterController, RegisterState>((ref) {
  return RegisterController(ref);
});
