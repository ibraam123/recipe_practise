import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/category_model.dart';
import '../models/recipe_model.dart';

part 'recipes_api.g.dart';

@RestApi(baseUrl: "https://www.themealdb.com/api/json/v1/1/")
abstract class RecipesApi {
  factory RecipesApi(Dio dio, {String baseUrl}) = _RecipesApi;

  // Categories
  @GET("categories.php")
  Future<CategoriesResponse> getCategories();

  // Meals by category
  @GET("filter.php?c={category}")
  Future<MealsResponse> getRecipesByCategory(
      @Path("category") String category,
      );

  // Meal details
  @GET("lookup.php?i={id}")
  Future<MealsResponse> getRecipeDetails(
      @Path("id") String id,
      );

  // Search meals
  @GET("search.php?s={query}")
  Future<MealsResponse> searchRecipes(
      @Path("query") String query,
      );
}
