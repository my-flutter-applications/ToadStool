import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toadstool/model/plant.dart';
import 'package:toadstool/provider/category_provider.dart';
import 'package:toadstool/provider/plant_provider.dart';
import 'package:toadstool/widgets/singleplant.dart';

class SearchPlant extends SearchDelegate<void> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    PlantProvider plantProvider = Provider.of<PlantProvider>(context);
    List<Plant> searchPlant = plantProvider.searchPlantList(query);
    return Container(
      height: MediaQuery.of(context).size.height / 1.25,
      child: GridView.count(
        childAspectRatio: 0.8,
        crossAxisSpacing: 5,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        scrollDirection: Axis.vertical,
        children: searchPlant
            .map((e) => SinglePlant(
                  name: e.name,
                  genus: e.genus,
                  image: e.image,
                ))
            .toList(),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    PlantProvider provider = Provider.of<PlantProvider>(context);
    List<Plant> searchPlant = provider.searchPlantList(query);
    return Container(
      padding: EdgeInsets.only(top: 20.0),
      child: GridView.count(
        childAspectRatio: 0.8,
        crossAxisSpacing: 5,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        scrollDirection: Axis.vertical,
        children: searchPlant
            .map((e) => SinglePlant(
                  name: e.name,
                  genus: e.genus,
                  image: e.image,
                ))
            .toList(),
      ),
    );
  }
}
