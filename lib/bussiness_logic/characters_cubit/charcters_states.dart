import 'package:movie_project/data/models/characters_model.dart';

import '../../data/models/qoute_model.dart';

abstract class CharacterStates {}

class CharactersInitialState extends CharacterStates {}

class CharactersSuccessState extends CharacterStates
{
  final List <Results> ? characters ;

  CharactersSuccessState(this.characters);
}

class CharactersLoadingState extends CharacterStates {}

class CharactersErrorState extends CharacterStates
{
  final String error ;

  CharactersErrorState(this.error);
}

class QuoteSuccessState extends CharacterStates
{
  final List<Quote> ? quotes ;

  QuoteSuccessState(this.quotes);
}