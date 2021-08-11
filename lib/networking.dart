import 'dart:convert';

import 'package:http/http.dart';

class Networking{
 static const int numberOfList=20;
  static Future<dynamic> getData() async {
  String apiKey = '65d9525b0c4a44a4b5b619199fe14ab3';
  String uri =
      'https://api.spoonacular.com/recipes/complexSearch?apiKey=$apiKey&number=$numberOfList';
  var response = await get(Uri.parse(uri));
  if (response.statusCode == 200) {
  var dataDecode=jsonDecode(response.body);
    return dataDecode;
  }
  
   return print(response.statusCode);
}

}