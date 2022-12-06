class Beer {
  final String name;
  final String style;
  final String abv;
  final String ibu;
  final String description;

  Beer({
    required this.name,
    required this.style,
    required this.abv,
    required this.ibu,
    required this.description,
  });

  factory Beer.fromJson(Map<String, dynamic> json) {
    return Beer(
      name: json['name'],
      style: json['style'],
      abv: json['abv'],
      ibu: json['ibu'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'style': style,
      'abv': abv,
      'ibu': ibu,
      'description': description,
    };
  }

  static Beer fromMap(Map<String, dynamic> map) {
    return Beer(
      name: map['name'],
      style: map['style'],
      abv: map['abv'],
      ibu: map['ibu'],
      description: map['description'],
    );
  }
}
