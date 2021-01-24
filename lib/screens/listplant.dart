import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toadstool/model/plant.dart';
import 'package:toadstool/provider/category_provider.dart';
import 'package:toadstool/provider/plant_provider.dart';
import 'package:toadstool/screens/detailsscreen.dart';
import 'package:toadstool/screens/homepage.dart';
import 'package:toadstool/screens/search_plant.dart';
import 'package:toadstool/screens/searchcategory.dart';
import 'package:toadstool/widgets/singleplant.dart';

class ListPlant extends StatelessWidget {
  final String name;
  bool isCategory = true;
  final List<Plant> snapShot;
  ListPlant({this.name, this.snapShot, this.isCategory});
  @override
  Widget build(BuildContext context) {
    CategoryProvider categoryProvider = Provider.of<CategoryProvider>(context);
    PlantProvider plantProvider = Provider.of<PlantProvider>(context);

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
            isCategory == true
                ? IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      showSearch(context: context, delegate: SearchCategory());
                    },
                  )
                : IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      plantProvider.getSearchList(list: snapShot);

                      showSearch(context: context, delegate: SearchPlant());
                    },
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
