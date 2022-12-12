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
}

class Fermentable {
  const Fermentable(
      {required this.name, this.amount, required this.percentage});

  final String name;
  final double? amount;
  final percentage;
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
}

class Yeast {
  const Yeast({required this.name, this.amount});

  final String name;
  final double? amount;
}

class Misc {
  const Misc({required this.name, required this.amount, required this.time});

  final String name;
  final double amount;
  final double time;
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
}
