
import 'package:recipe_practise/features/recipes/data/models/recipe_model.dart';

import '../data_source/recipes_api.dart';

abstract class RecipeRepo {
  Future<List<String>> getCategories();
  Future<List<Meal>> getRecipesByCategory(String category);
  Future<Meal> getRecipeDetails(String id);
  Future<List<Meal>> searchRecipes(String query);
}

class RecipeRepoImpl implements RecipeRepo {
  final RecipesApi api;
  RecipeRepoImpl({required this.api});

  @override
  Future<List<String>> getCategories() {
    return api.getCategories().then((response) =>
        response.categories.map((category) => category.name).toList());
  }

  @override
  Future<List<Meal>> getRecipesByCategory(String category) {
    return api.getRecipesByCategory(category).then((response) => response.meals);
  }

  @override
  Future<Meal> getRecipeDetails(String id) {
    return api.getRecipeDetails(id).then((response) => response.meals.first);
  }

  @override
  Future<List<Meal>> searchRecipes(String query) {
    return api.searchRecipes(query).then((response) => response.meals);
  }
}