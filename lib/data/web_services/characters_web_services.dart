
import 'package:dio/dio.dart';
import 'package:movie_project/constance/strings.dart';

class CharactersWebServices
{
 late Dio dio ;

 CharactersWebServices ()
 {
   BaseOptions options = BaseOptions(
     baseUrl: baseUrl,
     receiveDataWhenStatusError: true,
     connectTimeout: 20*1000,
     receiveTimeout: 20*1000,
   );
   dio = Dio(options);
 }

 Future<dynamic> getAllCharcters ()
 async{
   try
   {
     Response response = await dio.get('character');
     print(response.data.toString());
     return response.data;

   } catch(error)
   {
     print('error here');
     print(error.toString());
     return [];
   }

 }
}

class QuotesWebServices
{
  late Dio dio ;

  QuotesWebServices ()
  {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrlQuotes,
      receiveDataWhenStatusError: true,
      connectTimeout: 20*1000,
      receiveTimeout: 20*1000,
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> getAllQuotes ()
  async{
    try
    {
      Response response = await dio.get('quotes/12',);
      print(response.data.toString());
      return response.data;

    } catch(error)
    {
      print('error here');
      print(error.toString());
      return [];
    }

  }
}