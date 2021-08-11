import 'package:api_task/networking.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   var foodList;
  getFoodList() async {
    foodList = await Networking.getData();
  }

  @override
  void initState() {
    getFoodList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Foods")),
        ),
        body: ListView.builder(
            itemCount: Networking.numberOfList,
            itemBuilder: (context, int index) {
              var imageUri = foodList['results'][index]['image'];
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 100,
                          width: 150,
                          child: Image.network(
                            imageUri,
                            scale: 2,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          foodList['results'][index]['title'],
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(
                          height: 17.0,
                        ),
                        Row(
                          children: [
                            Text('Code for Request : '),
                            Text(
                              foodList['results'][index]['id'].toString(),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            },),);
  }
}
