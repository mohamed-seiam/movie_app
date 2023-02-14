// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_project/bussiness_logic/characters_cubit/characters_cubit.dart';
import 'package:movie_project/bussiness_logic/characters_cubit/charcters_states.dart';
import 'package:movie_project/constance/mycolors.dart';
import 'package:movie_project/data/models/characters_model.dart';

class CharactersDetailsScreen extends StatelessWidget {
  final Results character;
  const CharactersDetailsScreen({Key? key, required this.character}) : super(key: key);

  buildSliverAppBar ()
  {
    return SliverAppBar(
      expandedHeight: 800,
      pinned: true,
      stretch: true,
      backgroundColor: MyColors.myGrey,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          '${character.name}',
              style: TextStyle(color: MyColors.myWhite,),
        ),
        background: Hero(
            tag: character.id!,
            child: Image.network('${character.image}',fit: BoxFit.cover,)),
      ),
    );
  }

  Widget characterInfo(String title , String value)
  {
      return RichText(
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          text: TextSpan(
            children: [
              TextSpan(
                text: title,
                style: TextStyle(
                  color: MyColors.myWhite,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              TextSpan(
                text: value,
                style: TextStyle(
                  color: MyColors.myWhite,
                  fontSize: 16.0,
                ),
              ),
            ]
          ),
      );
  }

  Widget buildDivider(double endIndent)
  {
    return Divider(
      color: MyColors.myYellow,
      height: 30.0,
      thickness: 2,
      endIndent: endIndent,
    );
  }

  Widget checkQuotesAreLoaded(CharacterStates state)
  {
    if(state is QuoteSuccessState)
    {
      return displayRandomQuoteOrDisplayEmpty(state);
    }
    else
    {
        return showProgressIndicator();
    }
  }

 Widget displayRandomQuoteOrDisplayEmpty(state)
  {
    var quotes = state.quotes;
    if(quotes.length!=0)
    {
      int randomQuoteIndex = Random().nextInt(quotes.length - 1);

      return Center(
        child: DefaultTextStyle(
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            color: MyColors.myWhite,
            shadows: [
              Shadow(
                blurRadius: 7.0,
                color: MyColors.myYellow,
                offset: Offset(0,0),
              ),
            ],
          ) ,
          child: AnimatedTextKit(
            repeatForever: true,
            animatedTexts: [
              FlickerAnimatedText(quotes[randomQuoteIndex].quote),
            ],
          ),
        ) ,
      );
    }
    else
    {
      return Container();
    }
  }

  Widget showProgressIndicator()
  {
    return Center(child: CircularProgressIndicator(color: MyColors.myYellow,),);
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CharactersCubit>(context).getAllQuotes();
    return Scaffold(
      backgroundColor: MyColors.myGrey,
      body:CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
                    padding: EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        characterInfo('Species : ', character.species!),
                        buildDivider(315),
                        characterInfo('Status : ', character.status!),
                        buildDivider(320),
                        characterInfo('Gender : ', character.gender!),
                        buildDivider(320),
                        characterInfo('Name : ', character.name!),
                        buildDivider(330),
                        characterInfo('Appearance : ', character.appearance!.join(' / ')),
                        buildDivider(280),
                        SizedBox(height: 40.0,),
                        BlocBuilder<CharactersCubit,CharacterStates>(
                          builder:(context,state)
                          {
                            return checkQuotesAreLoaded(state);
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 600,),
                ],
              ),
          ),
        ],
      ),
    );
  }
}
