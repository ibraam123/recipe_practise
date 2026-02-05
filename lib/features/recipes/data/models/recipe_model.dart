import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'recipe_model.g.dart';

/// =====================
/// Ingredient Model
/// =====================
@JsonSerializable()
class Ingredient extends Equatable {
  final String name;
  final String measure;

  const Ingredient({
    required this.name,
    required this.measure,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) =>
      _$IngredientFromJson(json);
  Map<String, dynamic> toJson() => _$IngredientToJson(this);

  @override
  List<Object?> get props => [name, measure];
}

/// =====================
/// Meal Model
/// =====================
@JsonSerializable(explicitToJson: true)
class Meal extends Equatable {
  @JsonKey(name: 'idMeal')
  final String id;

  @JsonKey(name: 'strMeal')
  final String name;

  @JsonKey(name: 'strCategory')
  final String category;

  @JsonKey(name: 'strArea')
  final String area;

  @JsonKey(name: 'strInstructions')
  final String instructions;

  @JsonKey(name: 'strMealThumb')
  final String image;

  /// Ingredients list cannot be automatically parsed by json_serializable
  @JsonKey(includeFromJson: true)
  late final List<Ingredient> ingredients;

  Meal({
    required this.id,
    required this.name,
    required this.category,
    required this.area,
    required this.instructions,
    required this.image,
    List<Ingredient>? ingredients,
  }) {
    this.ingredients = ingredients ?? [];
  }

  /// Custom fromJson to handle numbered ingredients
  factory Meal.fromJson(Map<String, dynamic> json) {
    final meal = _$MealFromJson(json);

    final ingredients = <Ingredient>[];
    for (int i = 1; i <= 20; i++) {
      final ingredient = json['strIngredient$i'];
      final measure = json['strMeasure$i'];

      if (ingredient != null &&
          ingredient.toString().isNotEmpty &&
          measure != null &&
          measure.toString().isNotEmpty) {
        ingredients.add(
          Ingredient(
            name: ingredient.toString(),
            measure: measure.toString(),
          ),
        );
      }
    }

    meal.ingredients.addAll(ingredients);
    return meal;
  }

  Map<String, dynamic> toJson() => _$MealToJson(this);

  @override
  List<Object?> get props =>
      [id, name, category, area, instructions, image, ingredients];
}

/// =====================
/// Meals Response Model
/// =====================
@JsonSerializable(explicitToJson: true)
class MealsResponse extends Equatable {
  final List<Meal> meals;

  const MealsResponse({required this.meals});

  factory MealsResponse.fromJson(Map<String, dynamic> json) =>
      _$MealsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MealsResponseToJson(this);

  @override
  List<Object?> get props => [meals];
}
