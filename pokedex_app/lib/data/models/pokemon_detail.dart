class PokemonDetail {
  final int id;
  final String name;
  final int height;
  final int weight;
  final List<PokemonType> types;
  final List<PokemonAbility> abilities;
  final List<PokemonStat> stats;
  final List<PokemonMove> moves;
  final Sprites sprites;

  PokemonDetail({
    required this.id,
    required this.name,
    required this.height,
    required this.weight,
    required this.types,
    required this.abilities,
    required this.stats,
    required this.moves,
    required this.sprites,
  });

  factory PokemonDetail.fromJson(Map<String, dynamic> json) {
    return PokemonDetail(
      id: json['id'],
      name: json['name'],
      height: json['height'],
      weight: json['weight'],
      types: List<PokemonType>.from(
          json['types'].map((x) => PokemonType.fromJson(x))),
      abilities: List<PokemonAbility>.from(
          json['abilities'].map((x) => PokemonAbility.fromJson(x))),
      stats: List<PokemonStat>.from(
          json['stats'].map((x) => PokemonStat.fromJson(x))),
      moves: List<PokemonMove>.from(
          json['moves'].map((x) => PokemonMove.fromJson(x))),
      sprites: Sprites.fromJson(json['sprites']),
    );
  }
}


class PokemonType {
  final int slot;
  final Type type;

  PokemonType({required this.slot, required this.type});

  factory PokemonType.fromJson(Map<String, dynamic> json) => PokemonType(
        slot: json['slot'],
        type: Type.fromJson(json['type']),
      );

  Map<String, dynamic> toJson() => {
        'slot': slot,
        'type': type.toJson(),
      };
}

class Type {
  final String name;
  final String url;

  Type({required this.name, required this.url});

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        name: json['name'],
        url: json['url'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'url': url,
      };
}

class PokemonAbility {
  final bool isHidden;
  final int slot;
  final Ability ability;

  PokemonAbility({
    required this.isHidden,
    required this.slot,
    required this.ability,
  });

  factory PokemonAbility.fromJson(Map<String, dynamic> json) => PokemonAbility(
        isHidden: json['is_hidden'],
        slot: json['slot'],
        ability: Ability.fromJson(json['ability']),
      );

  Map<String, dynamic> toJson() => {
        'is_hidden': isHidden,
        'slot': slot,
        'ability': ability.toJson(),
      };
}

class Ability {
  final String name;
  final String url;

  Ability({required this.name, required this.url});

  factory Ability.fromJson(Map<String, dynamic> json) => Ability(
        name: json['name'],
        url: json['url'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'url': url,
      };
}

class PokemonStat {
  final int baseStat;
  final int effort;
  final Stat stat;

  PokemonStat({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });

  factory PokemonStat.fromJson(Map<String, dynamic> json) => PokemonStat(
        baseStat: json['base_stat'],
        effort: json['effort'],
        stat: Stat.fromJson(json['stat']),
      );

  Map<String, dynamic> toJson() => {
        'base_stat': baseStat,
        'effort': effort,
        'stat': stat.toJson(),
      };
}

class Stat {
  final String name;
  final String url;

  Stat({required this.name, required this.url});

  factory Stat.fromJson(Map<String, dynamic> json) => Stat(
        name: json['name'],
        url: json['url'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'url': url,
      };
}

class PokemonMove {
  final Move move;

  PokemonMove({required this.move});

  factory PokemonMove.fromJson(Map<String, dynamic> json) => PokemonMove(
        move: Move.fromJson(json['move']),
      );

  Map<String, dynamic> toJson() => {
        'move': move.toJson(),
      };
}

class Move {
  final String name;
  final String url;

  Move({required this.name, required this.url});

  factory Move.fromJson(Map<String, dynamic> json) => Move(
        name: json['name'],
        url: json['url'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'url': url,
      };
}

class Sprites {
  final String backDefault;
  final String frontDefault;

  Sprites({
    required this.backDefault,
    required this.frontDefault,
  });

  factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
        backDefault: json['back_default'],
        frontDefault: json['front_default'],
      );

  Map<String, dynamic> toJson() => {
        'back_default': backDefault,
        'front_default': frontDefault,
      };
}

