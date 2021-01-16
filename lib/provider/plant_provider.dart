import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:toadstool/model/plant.dart';

class PlantProvider with ChangeNotifier {
  List<Plant> featured = [];
  Plant featuredData;

  Future<void> getFeaturedData() async {
    List<Plant> newList = [];
    QuerySnapshot featuredSnapShot = await FirebaseFirestore.instance
        .collection('plants')
        .doc('tpPczedvpf1qhxfpH70Z')
        .collection('featuredplants')
        .get();

    featuredSnapShot.docs.forEach(
      (element) {
        featuredData = Plant(
          name: element.data()['name'],
          genus: element.data()['genus'],
          image: element.data()['image'],
        );
        newList.add(featuredData);
      },
    );

    featured = newList;
    notifyListeners();
  }

  List<Plant> get getFeaturedList {
    return featured;
  }

  List<Plant> homeFeatured = [];
  Plant homeFeaturedData;

  Future<void> getHomeFeaturedData() async {
    List<Plant> newList = [];
    QuerySnapshot homeFeaturedSnapShot =
        await FirebaseFirestore.instance.collection('homefeatured').get();

    homeFeaturedSnapShot.docs.forEach(
      (element) {
        homeFeaturedData = Plant(
          name: element.data()['name'],
          genus: element.data()['genus'],
          image: element.data()['image'],
        );
        newList.add(homeFeaturedData);
      },
    );

    homeFeatured = newList;
    notifyListeners();
  }

  List<Plant> get getHomeFeaturedList {
    return homeFeatured;
  }

  List<Plant> homePopular = [];
  Plant homePopularData;

  Future<void> getHomePopularData() async {
    List<Plant> newList = [];
    QuerySnapshot homePopularSnapShot =
        await FirebaseFirestore.instance.collection('homepopular').get();

    homePopularSnapShot.docs.forEach(
      (element) {
        homePopularData = Plant(
          name: element.data()['name'],
          genus: element.data()['genus'],
          image: element.data()['image'],
        );
        newList.add(homePopularData);
      },
    );

    homePopular = newList;
    notifyListeners();
  }

  List<Plant> get getHomePopularList {
    return homePopular;
  }

  List<Plant> popular = [];
  Plant popularData;

  Future<void> getPopularData() async {
    List<Plant> newList = [];
    QuerySnapshot popularSnapShot = await FirebaseFirestore.instance
        .collection('plants')
        .doc('tpPczedvpf1qhxfpH70Z')
        .collection('poopularplants')
        .get();

    popularSnapShot.docs.forEach(
      (element) {
        featuredData = Plant(
          name: element.data()['name'],
          genus: element.data()['genus'],
          image: element.data()['image'],
        );
        newList.add(popularData);
      },
    );

    popular = newList;
    notifyListeners();
  }

  List<Plant> get getPopularList {
    return popular;
  }
}
