import 'package:murphy/models/recipe.dart';

class Beer {
  final String name;
  final String style;
  final String abv;
  final String ibu;
  final String description;
  final Recipe? recipe;

  Beer({
    required this.name,
    required this.style,
    required this.abv,
    required this.ibu,
    required this.description,
    this.recipe,
  });

  factory Beer.fromJson(Map<String, dynamic> json) {
    return Beer(
      name: json['name'],
      style: json['style'],
      abv: json['abv'],
      ibu: json['ibu'],
      description: json['description'],
      recipe: json['recipe'] != null
          ? Recipe.fromJson(json['recipe'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'style': style,
      'abv': abv,
      'ibu': ibu,
      'description': description,
      'recipe': recipe?.toJson(),
    };
  }

  static Beer fromMap(Map<String, dynamic> map) {
    return Beer(
      name: map['name'],
      style: map['style'],
      abv: map['abv'],
      ibu: map['ibu'],
      description: map['description'],
      recipe: map['recipe'] != null
          ? Recipe.fromMap(map['recipe'] as Map<String, dynamic>)
          : null,
    );
  }
}
