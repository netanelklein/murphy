class Recipe {
  const Recipe(
      {required this.name,
      required this.style,
      this.efficiency,
      this.batchSize,
      required this.mashTemp,
      required this.mashTime,
      required this.og,
      required this.fg,
      required this.ibu,
      required this.srm,
      required this.abv,
      required this.fermentables,
      required this.hops,
      required this.yeast,
      this.misc,
      required this.waterProfile});

  final String name;
  final String style;
  final double? efficiency;
  final double? batchSize;
  final double og;
  final double fg;
  final double ibu;
  final int srm;
  final double abv;
  final int mashTemp;
  final int mashTime;
  final List<Fermentable> fermentables;
  final List<Hop> hops;
  final Yeast yeast;
  final List<Misc>? misc;
  final WaterProfile waterProfile;

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      name: json['name'],
      style: json['style'],
      efficiency: json['efficiency'],
      batchSize: json['batchSize'],
      mashTemp: json['mashTemp'],
      mashTime: json['mashTime'],
      og: json['og'],
      fg: json['fg'],
      ibu: json['ibu'],
      srm: json['srm'],
      abv: json['abv'],
      fermentables: (json['fermentables'] as List)
          .map((e) => Fermentable.fromJson(e))
          .toList(),
      hops: (json['hops'] as List).map((e) => Hop.fromJson(e)).toList(),
      yeast: Yeast.fromJson(json['yeast']),
      misc: (json['misc'] as List).map((e) => Misc.fromJson(e)).toList(),
      waterProfile: WaterProfile.fromJson(json['waterProfile']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'style': style,
      'efficiency': efficiency,
      'batchSize': batchSize,
      'mashTemp': mashTemp,
      'mashTime': mashTime,
      'og': og,
      'fg': fg,
      'ibu': ibu,
      'srm': srm,
      'abv': abv,
      'fermentables': fermentables.map((e) => e.toJson()).toList(),
      'hops': hops.map((e) => e.toJson()).toList(),
      'yeast': yeast.toJson(),
      'misc': misc?.map((e) => e.toJson()).toList(),
      'waterProfile': waterProfile.toJson(),
    };
  }

  static Recipe fromMap(Map<String, dynamic> map) {
    return Recipe(
      name: map['name'],
      style: map['style'],
      efficiency: map['efficiency'],
      batchSize: map['batchSize'],
      mashTemp: map['mashTemp'],
      mashTime: map['mashTime'],
      og: map['og'],
      fg: map['fg'],
      ibu: map['ibu'],
      srm: map['srm'],
      abv: map['abv'],
      fermentables: (map['fermentables'] as List)
          .map((e) => Fermentable.fromMap(e))
          .toList(),
      hops: (map['hops'] as List).map((e) => Hop.fromMap(e)).toList(),
      yeast: Yeast.fromMap(map['yeast']),
      misc: (map['misc'] as List).map((e) => Misc.fromMap(e)).toList(),
      waterProfile: WaterProfile.fromMap(map['waterProfile']),
    );
  }
}

class Fermentable {
  const Fermentable(
      {required this.name, this.amount, required this.percentage});

  final String name;
  final double? amount;
  final percentage;

  factory Fermentable.fromJson(Map<String, dynamic> json) {
    return Fermentable(
      name: json['name'],
      amount: json['amount'],
      percentage: json['percentage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'amount': amount,
      'percentage': percentage,
    };
  }

  static Fermentable fromMap(Map<String, dynamic> map) {
    return Fermentable(
      name: map['name'],
      amount: map['amount'],
      percentage: map['percentage'],
    );
  }
}

enum HopUse { fwh, boil, hopstand, dryhop }

class Hop {
  const Hop(
      {required this.name,
      this.amount,
      required this.alpha,
      required this.time,
      required this.use});

  final String name;
  final double? amount;
  final alpha;
  final time;
  final HopUse use;

  String get useString {
    switch (use) {
      case HopUse.fwh:
        return '$time min\nFirst Wort Hop';
      case HopUse.boil:
        return '$time min\nBoil';
      case HopUse.hopstand:
        return '$time min\nHop Stand';
      case HopUse.dryhop:
        return 'day $time\nDry Hop';
    }
  }

  factory Hop.fromJson(Map<String, dynamic> json) {
    return Hop(
      name: json['name'],
      amount: json['amount'],
      alpha: json['alpha'],
      time: json['time'],
      use: HopUse.values[json['use']],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'amount': amount,
      'alpha': alpha,
      'time': time,
      'use': use.index,
    };
  }

  static Hop fromMap(Map<String, dynamic> map) {
    return Hop(
      name: map['name'],
      amount: map['amount'],
      alpha: map['alpha'],
      time: map['time'],
      use: HopUse.values[map['use']],
    );
  }
}

class Yeast {
  const Yeast({required this.name, this.amount});

  final String name;
  final double? amount;

  factory Yeast.fromJson(Map<String, dynamic> json) {
    return Yeast(
      name: json['name'],
      amount: json['amount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'amount': amount,
    };
  }

  static Yeast fromMap(Map<String, dynamic> map) {
    return Yeast(
      name: map['name'],
      amount: map['amount'],
    );
  }
}

class Misc {
  const Misc({required this.name, required this.amount, required this.time});

  final String name;
  final double amount;
  final double time;

  factory Misc.fromJson(Map<String, dynamic> json) {
    return Misc(
      name: json['name'],
      amount: json['amount'],
      time: json['time'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'amount': amount,
      'time': time,
    };
  }

  static Misc fromMap(Map<String, dynamic> map) {
    return Misc(
      name: map['name'],
      amount: map['amount'],
      time: map['time'],
    );
  }
}

class WaterProfile {
  const WaterProfile(
      {this.name,
      required this.calcium,
      required this.bicarbonate,
      required this.sulfate,
      required this.chloride,
      required this.sodium,
      required this.magnesium});

  final String? name;
  final double calcium;
  final double bicarbonate;
  final double sulfate;
  final double chloride;
  final double sodium;
  final double magnesium;

  factory WaterProfile.fromJson(Map<String, dynamic> json) {
    return WaterProfile(
      name: json['name'],
      calcium: json['calcium'],
      bicarbonate: json['bicarbonate'],
      sulfate: json['sulfate'],
      chloride: json['chloride'],
      sodium: json['sodium'],
      magnesium: json['magnesium'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'calcium': calcium,
      'bicarbonate': bicarbonate,
      'sulfate': sulfate,
      'chloride': chloride,
      'sodium': sodium,
      'magnesium': magnesium,
    };
  }

  static WaterProfile fromMap(Map<String, dynamic> map) {
    return WaterProfile(
      name: map['name'],
      calcium: map['calcium'],
      bicarbonate: map['bicarbonate'],
      sulfate: map['sulfate'],
      chloride: map['chloride'],
      sodium: map['sodium'],
      magnesium: map['magnesium'],
    );
  }
}
