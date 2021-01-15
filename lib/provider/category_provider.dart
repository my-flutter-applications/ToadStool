import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:toadstool/model/plant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryProvider with ChangeNotifier {
  List<Plant> annual = [];
  Plant annualData;

  Future<void> getAnnualData() async {
    List<Plant> newList = [];
    QuerySnapshot annualSnapShot = await FirebaseFirestore.instance
        .collection('category')
        .doc('Rc91xFvd6aLv1yDrmG6Q')
        .collection('annual')
        .get();

    annualSnapShot.docs.forEach(
      (element) {
        annualData = Plant(
            name: element.data()['name'],
            genus: element.data()['genus'],
            image: element.data()['image']);
        newList.add(annualData);
      },
    );

    annual = newList;
  }
}
