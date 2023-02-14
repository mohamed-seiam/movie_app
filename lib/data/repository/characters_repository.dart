import 'package:movie_project/data/models/characters_model.dart';
import 'package:movie_project/data/web_services/characters_web_services.dart';

import '../models/qoute_model.dart';

class CharactersRepository
{
 final CharactersWebServices charactersWebServices ;
final QuotesWebServices quotesWebServices;
  CharactersRepository(this.charactersWebServices, this.quotesWebServices);

 Future<CharactersModel> getAllCharacters ()
 async
 {
   final characters = await charactersWebServices.getAllCharcters();
   return  CharactersModel.fromJson(characters);
 }

 Future<List<Quote>> getAllQuotes ()
 async
 {
   final quotes = await quotesWebServices.getAllQuotes();
   return  quotes.map((quote) =>Quote.fromJson(quote)).toList();
 }
}