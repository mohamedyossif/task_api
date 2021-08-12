
class FoodList {
  final String imageUri;
  final String foodName;
  final int code;
  FoodList(
      {required this.foodName, required this.imageUri, required this.code});
  factory FoodList.fromJson(Map<String, dynamic> json) {
    return FoodList(
      code: json['id'] ,
      imageUri: json['image'],
      foodName: json['title'],
    );
  }
}
