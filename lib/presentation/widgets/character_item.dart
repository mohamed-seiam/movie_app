// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:movie_project/constance/mycolors.dart';
import 'package:movie_project/constance/strings.dart';
import 'package:movie_project/data/models/characters_model.dart';

class CharacterItem extends StatelessWidget {
  final Results charactersModel;
  const CharacterItem({Key? key, required this.charactersModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: MyColors.myWhite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: ()
        {
          Navigator.pushNamed(context, charactersDetailsScreen,arguments:charactersModel );
        },
        child: GridTile(
          footer: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            color: Colors.black54,
            alignment: Alignment.bottomCenter,
            child: Text('${charactersModel.name}',
              style:TextStyle(
                height: 1.3,
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: MyColors.myWhite,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
          child: Hero(
            tag: charactersModel.id!,
            child: Container(
              color: MyColors.myGrey,
              child:charactersModel.image!.isNotEmpty ?
              FadeInImage.assetNetwork(
                width: double.infinity,
                height: double.infinity,
                placeholder: 'assets/images/loading.gif',
                image:'${charactersModel.image}',
                fit: BoxFit.cover,
              ):Image.asset('assets/images/placeholder.png'),
            ),
          ),
        ),
      ),
    );
  }
}
