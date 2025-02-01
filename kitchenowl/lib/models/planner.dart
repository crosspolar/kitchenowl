import 'package:kitchenowl/models/model.dart';
import 'package:kitchenowl/models/recipe.dart';

class RecipePlan extends Model {
  final Recipe recipe;
  final DateTime? datetime;
  final int? yields;

  const RecipePlan({
    required this.recipe,
    this.datetime,
    this.yields,
  });

  factory RecipePlan.fromJson(Map<String, dynamic> map) {
    return RecipePlan(
      recipe: Recipe.fromJson(map['recipe']),
      datetime: map['datetime'],
      yields: map['yields'],
    );
  }

  Recipe get recipeWithYields {
    if (yields == null || yields! <= 0) return recipe;

    return recipe.withYields(yields!);
  }

  @override
  List<Object?> get props => [recipe, datetime, yields];

  @override
  Map<String, dynamic> toJson() => {
        "recipe_id": recipe.id,
        if (datetime != null) "datetime": datetime!.toIso8601String(),
        if (yields != null) "yields": yields,
      };

  @override
  Map<String, dynamic> toJsonWithId() => toJson()
    ..addAll({
      "recipe": recipe.toJson(),
    });
}
