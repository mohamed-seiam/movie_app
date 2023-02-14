import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_project/bussiness_logic/characters_cubit/charcters_states.dart';
import 'package:movie_project/data/models/characters_model.dart';
import 'package:movie_project/data/models/qoute_model.dart';
import '../../data/repository/characters_repository.dart';

class CharactersCubit extends Cubit<CharacterStates>
{
  final CharactersRepository charactersRepository ;
  CharactersCubit (this.charactersRepository) :super(CharactersInitialState());

  List<Results> ? characters ;

  List<Results>? getAllCharacters ()
  {
    charactersRepository.getAllCharacters().then((characters)
    {
      emit(CharactersSuccessState(characters.results!));
      this.characters = characters.results;
    });

    return characters;
  }


  void getAllQuotes ()
  {
    charactersRepository.getAllQuotes().then((quotes)
    {
      emit(QuoteSuccessState(quotes));
    });

  }
}