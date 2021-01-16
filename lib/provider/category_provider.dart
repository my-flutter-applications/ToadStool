import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:toadstool/model/plant.dart';

class CategoryProvider with ChangeNotifier {
  List<Plant> annual = [];
  Plant annualData;

  List<Plant> bulb = [];
  Plant bulbData;

  List<Plant> fruit = [];
  Plant fruitData;

  List<Plant> herbs = [];
  Plant herbsData;

  List<Plant> perennial = [];
  Plant perennialData;

  List<Plant> roses = [];
  Plant rosesData;

  List<Plant> shrub = [];
  Plant shrubData;

  List<Plant> tree = [];
  Plant treeData;

  List<Plant> vegetable = [];
  Plant vegetableData;

  List<Plant> vine = [];
  Plant vineData;

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
          image: element.data()['image'],
        );
        newList.add(annualData);
      },
    );

    annual = newList;
  }

  List<Plant> get getAnnualList {
    return annual;
  }

  Future<void> getBulbData() async {
    List<Plant> newList = [];
    QuerySnapshot bulbSnapShot = await FirebaseFirestore.instance
        .collection('category')
        .doc('Rc91xFvd6aLv1yDrmG6Q')
        .collection('bulb')
        .get();

    bulbSnapShot.docs.forEach(
      (element) {
        bulbData = Plant(
          name: element.data()['name'],
          genus: element.data()['genus'],
          image: element.data()['image'],
        );
        newList.add(bulbData);
      },
    );

    bulb = newList;
  }

  List<Plant> get getBulbList {
    return bulb;
  }

  Future<void> getFruitData() async {
    List<Plant> newList = [];
    QuerySnapshot fruitSnapShot = await FirebaseFirestore.instance
        .collection('category')
        .doc('Rc91xFvd6aLv1yDrmG6Q')
        .collection('fruit')
        .get();

    fruitSnapShot.docs.forEach(
      (element) {
        fruitData = Plant(
          name: element.data()['name'],
          genus: element.data()['genus'],
          image: element.data()['image'],
        );
        newList.add(fruitData);
      },
    );

    fruit = newList;
  }

  List<Plant> get getFruitList {
    return fruit;
  }

  Future<void> getHerbsData() async {
    List<Plant> newList = [];
    QuerySnapshot herbsSnapShot = await FirebaseFirestore.instance
        .collection('category')
        .doc('Rc91xFvd6aLv1yDrmG6Q')
        .collection('herbs')
        .get();

    herbsSnapShot.docs.forEach(
      (element) {
        herbsData = Plant(
          name: element.data()['name'],
          genus: element.data()['genus'],
          image: element.data()['image'],
        );
        newList.add(herbsData);
      },
    );

    herbs = newList;
  }

  List<Plant> get getHerbsList {
    return herbs;
  }

  Future<void> getPerennialData() async {
    List<Plant> newList = [];
    QuerySnapshot perennialSnapShot = await FirebaseFirestore.instance
        .collection('category')
        .doc('Rc91xFvd6aLv1yDrmG6Q')
        .collection('perennial')
        .get();

    perennialSnapShot.docs.forEach(
      (element) {
        perennialData = Plant(
          name: element.data()['name'],
          genus: element.data()['genus'],
          image: element.data()['image'],
        );
        newList.add(perennialData);
      },
    );

    perennial = newList;
  }

  List<Plant> get getPerennialList {
    return perennial;
  }

  Future<void> getRosesData() async {
    List<Plant> newList = [];
    QuerySnapshot rosesSnapShot = await FirebaseFirestore.instance
        .collection('category')
        .doc('Rc91xFvd6aLv1yDrmG6Q')
        .collection('roses')
        .get();

    rosesSnapShot.docs.forEach(
      (element) {
        rosesData = Plant(
          name: element.data()['name'],
          genus: element.data()['genus'],
          image: element.data()['image'],
        );
        newList.add(rosesData);
      },
    );

    roses = newList;
  }

  List<Plant> get getRosesList {
    return roses;
  }

  Future<void> getShrubData() async {
    List<Plant> newList = [];
    QuerySnapshot shrubSnapShot = await FirebaseFirestore.instance
        .collection('category')
        .doc('Rc91xFvd6aLv1yDrmG6Q')
        .collection('shrub')
        .get();

    shrubSnapShot.docs.forEach(
      (element) {
        shrubData = Plant(
          name: element.data()['name'],
          genus: element.data()['genus'],
          image: element.data()['image'],
        );
        newList.add(shrubData);
      },
    );

    shrub = newList;
  }

  List<Plant> get getShrubList {
    return shrub;
  }

  Future<void> getTreeData() async {
    List<Plant> newList = [];
    QuerySnapshot treeSnapShot = await FirebaseFirestore.instance
        .collection('category')
        .doc('Rc91xFvd6aLv1yDrmG6Q')
        .collection('tree')
        .get();

    treeSnapShot.docs.forEach(
      (element) {
        treeData = Plant(
          name: element.data()['name'],
          genus: element.data()['genus'],
          image: element.data()['image'],
        );
        newList.add(treeData);
      },
    );

    tree = newList;
  }

  List<Plant> get getTreeList {
    return tree;
  }

  Future<void> getVegetableData() async {
    List<Plant> newList = [];
    QuerySnapshot vegetableSnapShot = await FirebaseFirestore.instance
        .collection('category')
        .doc('Rc91xFvd6aLv1yDrmG6Q')
        .collection('vegetable')
        .get();

    vegetableSnapShot.docs.forEach(
      (element) {
        vegetableData = Plant(
          name: element.data()['name'],
          genus: element.data()['genus'],
          image: element.data()['image'],
        );
        newList.add(vegetableData);
      },
    );

    vegetable = newList;
  }

  List<Plant> get getVegetableList {
    return vegetable;
  }

  Future<void> getVineData() async {
    List<Plant> newList = [];
    QuerySnapshot vineSnapShot = await FirebaseFirestore.instance
        .collection('category')
        .doc('Rc91xFvd6aLv1yDrmG6Q')
        .collection('vine')
        .get();

    vineSnapShot.docs.forEach(
      (element) {
        vineData = Plant(
          name: element.data()['name'],
          genus: element.data()['genus'],
          image: element.data()['image'],
        );
        newList.add(vineData);
      },
    );

    vine = newList;
  }

  List<Plant> get getVineList {
    return vine;
  }
}
