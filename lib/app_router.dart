// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_project/bussiness_logic/characters_cubit/characters_cubit.dart';
import 'package:movie_project/constance/strings.dart';
import 'package:movie_project/data/models/characters_model.dart';
import 'package:movie_project/data/repository/characters_repository.dart';
import 'package:movie_project/presentation/screens/characters_details.dart';
import 'package:movie_project/presentation/screens/characters_screen.dart';

import 'data/web_services/characters_web_services.dart';

class AppRouter
{
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;
  AppRouter()
  {
    charactersRepository = CharactersRepository(CharactersWebServices(),QuotesWebServices());
    charactersCubit = CharactersCubit(charactersRepository);
  }
  Route ? generateRoute(RouteSettings settings)
  {
      switch(settings.name)
      {
        case characterScreen:
          return MaterialPageRoute(builder:(_)=>BlocProvider(
              create: (BuildContext context)=>charactersCubit,
            child:CharactersScreen(),
          ),
          );

        case charactersDetailsScreen:
          final selectedCharacter = settings.arguments as Results;
          return MaterialPageRoute(
              builder:(_)=> BlocProvider(
                  create: (BuildContext context) =>CharactersCubit(charactersRepository),
                  child: CharactersDetailsScreen(
                    character: selectedCharacter,
                  ),
              ),
          );
      }
  }
}