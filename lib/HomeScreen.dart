import 'package:api_task/food_list.dart';
import 'package:api_task/networking.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Foods")),
        ),
        body: FutureBuilder<List<FoodList>>(
          future: Networking.getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, int index) {
                  String imageUri = snapshot.data![index].imageUri;
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
                              snapshot.data![index].foodName,
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(
                              height: 17.0,
                            ),
                            Row(
                              children: [
                                Text('Code for Request : '),
                                Text(
                                  snapshot.data![index].code.toString(),
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}

/*


          
 */
