import 'package:flutter/material.dart';
import 'package:pokedex_app/const/sizes.dart';
import 'package:pokedex_app/data/models/pokemon_detail.dart';

class PokemonDetailCard extends StatelessWidget {
  final PokemonDetail pokemonDetail;

  const PokemonDetailCard({super.key, required this.pokemonDetail});

  @override
  Widget build(BuildContext context) {     
    String pokemonHeight= "Boy";
    String pokemonWeight= "Kilo";
    String pokemonTypes= "Türler";
    String pokemonAbilities= "Yetenekler";
    String pokemonStats= "İstatistikler";
    String pokemonMoves= "Hareketler";

    return Card(
      elevation: CustomSize.cardElevation,
      margin: const EdgeInsets.all(CustomSize.marginSize),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(CustomSize.borderRadiusSize),
      ),
      child: Padding(
        padding: const EdgeInsets.all(CustomSize.marginSize),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                pokemonDetail.name,
                style: const TextStyle(
                  fontSize: CustomSize.fontSizeextraLarge,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: CustomSize.smaillSizedBoxHeight),

              Text(
                '$pokemonHeight: ${pokemonDetail.height}',
                style: const TextStyle(fontSize: CustomSize.fontSizelarge),
              ),
              const SizedBox(height: CustomSize.smaillSizedBoxHeight),

              Text(
                '$pokemonWeight: ${pokemonDetail.weight}',
                style: const TextStyle(fontSize: CustomSize.fontSizelarge),
              ),
              const SizedBox(height: CustomSize.bigSizedBoxHeight),

              Text(
                '$pokemonTypes: ',
                style: const TextStyle(fontSize: CustomSize.fontSizelarge, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: CustomSize.smaillSizedBoxHeight),

              Wrap(
                spacing: CustomSize.wrapSpacingSize,
                children: pokemonDetail.types.map((type) {
                  return Chip(
                    label: Text(type.type.name),
                  );
                }).toList(),
              ),
              const SizedBox(height: CustomSize.bigSizedBoxHeight),

              Text(
                '$pokemonAbilities: ',
                style: const TextStyle(fontSize: CustomSize.fontSizelarge, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: CustomSize.smaillSizedBoxHeight),
              Wrap(
                spacing: CustomSize.wrapSpacingSize,
                children: pokemonDetail.abilities.map((ability) {
                  return Chip(
                    label: Text(ability.ability.name),
                  );
                }).toList(),
              ),
              const SizedBox(height:CustomSize. bigSizedBoxHeight),

              Text(
                '$pokemonStats: ',
                style: const TextStyle(fontSize: CustomSize.fontSizelarge, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: CustomSize.smaillSizedBoxHeight),
              Column(
                children: pokemonDetail.stats.map((stat) {
                  return ListTile(
                    title: Text(stat.stat.name, style: const TextStyle(fontSize: CustomSize.fontSizemedium),),
                    trailing: Text('${stat.baseStat}'),
                  );
                }).toList(),
              ),
              const SizedBox(height: CustomSize.bigSizedBoxHeight),

              Text(
                '$pokemonMoves :',
                style: const TextStyle(fontSize: CustomSize.fontSizelarge, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: CustomSize.smaillSizedBoxHeight),
              Wrap(
                spacing: CustomSize.wrapSpacingSize,
                children: pokemonDetail.moves.map((move) {
                  return Chip(
                    label: Text(move.move.name),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
