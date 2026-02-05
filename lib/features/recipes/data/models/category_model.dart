import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel extends Equatable {
  @JsonKey(name: 'idCategory')
  final String id;

  @JsonKey(name: 'strCategory')
  final String name;

  const CategoryModel({
    required this.id,
    required this.name,
  });

  // JSON serialization methods (works with build_runner)
  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);

  @override
  List<Object?> get props => [id, name];
}

@JsonSerializable()
class CategoriesResponse extends Equatable {
  final List<CategoryModel> categories;

  const CategoriesResponse({required this.categories});

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoriesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesResponseToJson(this);

  @override
  List<Object?> get props => [categories];
}
