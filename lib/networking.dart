import 'dart:convert';

import 'package:api_task/food_list.dart';
import 'package:http/http.dart';

class Networking {
  static const int numberOfList = 20;
  static Future<List<FoodList>> getData() async {
    String apiKey = '65d9525b0c4a44a4b5b619199fe14ab3';
    String uri =
        'https://api.spoonacular.com/recipes/complexSearch?apiKey=$apiKey&number=$numberOfList';
    var response = await get(Uri.parse(uri));
    if (response.statusCode == 200) {
      final dataDecode =
          json.decode(response.body)['results'].cast<Map<String, dynamic>>();

      return dataDecode.map<FoodList>((item) {
        return FoodList.fromJson(item);
      }).toList();
    }

    return throw 'can`t access';
  }
}
