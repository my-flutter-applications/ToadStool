import 'package:flutter/material.dart';
import 'package:toadstool/model/plant.dart';
import 'package:toadstool/screens/homepage.dart';
import 'package:toadstool/widgets/singleplant.dart';

class ListPlant extends StatelessWidget {
  final String name;
  final List<Plant> snapShot;
  ListPlant({this.name, this.snapShot});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Theme.of(context).canvasColor,
          iconTheme: IconThemeData(color: Colors.white),
          // leading: IconButton(
          //   icon: Icon(
          //     Icons.arrow_back,
          //     color: Colors.white,
          //   ),
          //   onPressed: () {
          //     Navigator.of(context).pushReplacement(
          //       MaterialPageRoute(
          //         builder: (context) => HomePage(),
          //       ),
          //     );
          //   },
          // ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.shopping_bag_outlined,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: Container(
          // margin: EdgeInsets.symmetric(horizontal: 5),
          child: ListView(
            // shrinkWrap: true,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                // padding: EdgeInsets.only(bottom: 150.0),
                height: MediaQuery.of(context).size.height / 1.25,

                child: GridView.count(
                  // crossAxisCount: 2,
                  // mainAxisSpacing: 14,

                  // childAspectRatio: 0.75,

                  // itemCount: snapShot.data.documents.length,
                  // itemBuilder: (context, index) => SinglePlant(
                  //       name: snapShot.data.documents[index]['name'],
                  //       image: snapShot.data.documents[index]['image'],
                  //       genus: snapShot.data.documents[index]['genus'],
                  //     ),
                  // scrollDirection: Axis.vertical,
                  // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //   crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 10,
                  // )
                  crossAxisCount: 2,
                  scrollDirection: Axis.vertical,
                  children: snapShot
                      .map(
                        (e) => SinglePlant(
                          name: e.name,
                          genus: e.genus,
                          image: e.image,
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ));
  }
}
