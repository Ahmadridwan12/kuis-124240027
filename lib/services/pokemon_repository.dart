import '../data/pokemon_data.dart';
import '../models/pokemon.dart';

class PokemonRepository {
  static List<Pokemon> getAll() => pokemonList;
}
