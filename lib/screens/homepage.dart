import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toadstool/model/usermodel.dart';
import 'package:toadstool/provider/category_provider.dart';
import 'package:toadstool/provider/plant_provider.dart';
import 'package:toadstool/screens/aboutus.dart';
import 'package:toadstool/screens/contactus.dart';
import 'package:toadstool/screens/detailsscreen.dart';
import 'package:toadstool/screens/gardenscreen.dart';
import 'package:toadstool/screens/listplant.dart';
import 'package:toadstool/screens/login.dart';
import 'package:toadstool/screens/profilescreen.dart';
import 'package:toadstool/screens/search_plant.dart';
// import 'package:toadstool/screens/search.dart';
import 'package:toadstool/widgets/singleplant.dart';
import '../model/plant.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

CategoryProvider categoryProvider;
PlantProvider plantProvider;

Plant tomatoData;
Plant englishroseData;
// Plant strawberryData;
// Plant amazonlilyData;
// Plant potatoData;
// Plant lemonData;

var featureSnapShot;
var popularSnapShot;

var annual;
var bulb;
var fruit;
var herbs;
var perennial;
var roses;
var shrub;
var tree;
var vegetable;
var vine;

Plant lavenderData;
Plant raspberryData;
// List<Plant> search = plantProvider.searchPlantList('');

// List<Plant> all = [];
// Plant allData;
// Future<void> getList(String collection) async {
//   List<Plant> newList = [];

//   DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
//       .collection("category")
//       .doc('Rc91xFvd6aLv1yDrmG6Q')
//       .get();

//   documentSnapshot.data().forEach((collection, docu) {
//     allData = Plant(
//       name: docu.doc.data()['name'],
//       genus: docu.doc.data()['genus'],
//       image: docu.doc.data()['image'],
//     );
//     newList.add(allData);
//   });
//   // return wholeList = querySnapshot.documents;
//   // return documentSnapshot;
//   // newList.add(documentSnapshot.data());
//   all = newList;
// }

class _HomePageState extends State<HomePage> {
  Widget _buildPlantCategory({String categoryType, Color color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: 120.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              categoryType,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPopularPlant({String name, String genus, String image}) {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xff3f3f3f),
          borderRadius: BorderRadius.all(
            Radius.circular(25.0),
          ),
        ),
        height: 100.0,
        width: 280.0,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        image,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  genus,
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  bool homeColor = true;

  bool basketColor = false;

  bool mygardenColor = false;

  bool profileColor = false;

  bool contactusColor = false;

  bool aboutColor = false;

  Widget _buildUserAccountsDrawerHeader() {
    List<UserModel> userModel = plantProvider.userModelList;
    return Column(
      children: userModel.map((e) {
        return UserAccountsDrawerHeader(
          decoration: BoxDecoration(color: Color(0xff3f3f3f)),
          accountName: Text(
            e.userName,
            style: TextStyle(color: Colors.white),
          ),
          accountEmail: Text(
            e.userEmail,
            style: TextStyle(color: Colors.white),
          ),
          currentAccountPicture: CircleAvatar(
            backgroundImage: e.userImage == null
                ? AssetImage('images/user-def.png')
                : NetworkImage(e.userImage),
          ),
        );
      }).toList(),
    );
  }

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Login()));
  }

  Widget _buildMyDrawer() {
    return Drawer(
      child: ListView(
        children: [
          _buildUserAccountsDrawerHeader(),
          ListTile(
            selected: homeColor,
            onTap: () {
              setState(() {
                homeColor = true;
                basketColor = false;
                mygardenColor = false;
                profileColor = false;
                contactusColor = false;
                aboutColor = false;
              });
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => HomePage()));
            },
            selectedTileColor: Theme.of(context).primaryColorDark,
            leading: Icon(
              Icons.home_outlined,
              color: Theme.of(context).primaryColor,
              size: 28.0,
            ),
            title: Text(
              'Home',
              style: TextStyle(fontSize: 16.0, color: Colors.white),
            ),
          ),
          ListTile(
            selected: mygardenColor,
            onTap: () {
              setState(() {
                mygardenColor = true;
                basketColor = false;
                homeColor = false;
                profileColor = false;
                contactusColor = false;
                aboutColor = false;
              });
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Garden()));
            },
            selectedTileColor: Theme.of(context).primaryColorDark,
            leading: Icon(Icons.favorite_border_outlined,
                size: 28.0, color: Theme.of(context).primaryColor),
            title: Text(
              'My Garden',
              style: TextStyle(color: Colors.white, fontSize: 16.0),
            ),
          ),
          ListTile(
            selected: profileColor,
            onTap: () {
              setState(() {
                profileColor = true;
                basketColor = false;
                mygardenColor = false;
                homeColor = false;
                contactusColor = false;
                aboutColor = false;
              });
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => ProfileScreen()));
            },
            selectedTileColor: Theme.of(context).primaryColorDark,
            leading: Icon(Icons.person_outline,
                size: 28.0, color: Theme.of(context).primaryColor),
            title: Text(
              'Profile',
              style: TextStyle(color: Colors.white, fontSize: 16.0),
            ),
          ),
          ListTile(
            selected: contactusColor,
            onTap: () {
              setState(() {
                contactusColor = true;
                basketColor = false;
                mygardenColor = false;
                profileColor = false;
                homeColor = false;
                aboutColor = false;
              });
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => ContactUs()));
            },
            selectedTileColor: Theme.of(context).primaryColorDark,
            leading: Icon(Icons.phone_outlined,
                size: 28.0, color: Theme.of(context).primaryColor),
            title: Text(
              'Contact us',
              style: TextStyle(color: Colors.white, fontSize: 16.0),
            ),
          ),
          ListTile(
            selected: aboutColor,
            onTap: () {
              setState(() {
                aboutColor = true;
                basketColor = false;
                mygardenColor = false;
                profileColor = false;
                contactusColor = false;
                homeColor = false;
              });
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => AboutUs()));
            },
            selectedTileColor: Theme.of(context).primaryColorDark,
            leading: Icon(Icons.info,
                size: 28.0, color: Theme.of(context).primaryColor),
            title: Text(
              'About',
              style: TextStyle(color: Colors.white, fontSize: 16.0),
            ),
          ),
          ListTile(
            onTap: () {
              _signOut();
            },
            leading: Icon(Icons.home_outlined,
                size: 28.0, color: Theme.of(context).primaryColor),
            title: Text(
              'Sign Out',
              style: TextStyle(color: Colors.white, fontSize: 16.0),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategory() {
    List<Plant> annuals = categoryProvider.getAnnualList;
    List<Plant> bulb = categoryProvider.getBulbList;
    List<Plant> fruit = categoryProvider.getFruitList;
    List<Plant> herbs = categoryProvider.getHerbsList;
    List<Plant> perennial = categoryProvider.getPerennialList;
    List<Plant> roses = categoryProvider.getRosesList;
    List<Plant> shrub = categoryProvider.getShrubList;
    List<Plant> tree = categoryProvider.getTreeList;
    List<Plant> vegetable = categoryProvider.getVegetableList;
    List<Plant> vine = categoryProvider.getVineList;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      child: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ListPlant(
                            name: 'Annual',
                            snapShot: annuals,
                          )));
                },
                child: _buildPlantCategory(
                    categoryType: 'Annual', color: Color(0xffffc371)),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          ListPlant(name: 'Bulb', snapShot: bulb)));
                },
                child: _buildPlantCategory(
                    categoryType: 'Bulb', color: Color(0xff9AD9DB)),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          ListPlant(name: 'Fruit', snapShot: fruit)));
                },
                child: _buildPlantCategory(
                    categoryType: 'Fruit', color: Color(0xffE4CEE0)),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          ListPlant(name: 'Herbs', snapShot: herbs)));
                },
                child: _buildPlantCategory(
                    categoryType: 'Herbs', color: Color(0xff98D4BB)),
              ),
              // _buildPlantCategory('HousePlant', Color(0xffffc371)),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          ListPlant(name: 'Perennial', snapShot: perennial)));
                },
                child: _buildPlantCategory(
                    categoryType: 'Perennial', color: Color(0xff8DA47E)),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          ListPlant(name: 'Roses', snapShot: roses)));
                },
                child: _buildPlantCategory(
                    categoryType: 'Roses', color: Color(0xffC47482)),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          ListPlant(name: 'Shrub', snapShot: shrub)));
                },
                child: _buildPlantCategory(
                    categoryType: 'Shurb', color: Color(0xffB2B2B2)),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          ListPlant(name: 'Tree', snapShot: tree)));
                },
                child: _buildPlantCategory(
                    categoryType: 'Tree', color: Color(0xff86736C)),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          ListPlant(name: 'Vegetable', snapShot: vegetable)));
                },
                child: _buildPlantCategory(
                    categoryType: 'Vegetable', color: Color(0xffF27348)),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          ListPlant(name: 'Vine', snapShot: vine)));
                },
                child: _buildPlantCategory(
                    categoryType: 'Vine', color: Color(0xff7C98AB)),
              ),

              // _buildPlantCategory('Water Plants', Color(0xffffc371)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatured() {
    List<Plant> featuredPlant;
    List<Plant> homeFeaturedPlant;

    homeFeaturedPlant = plantProvider.getHomeFeaturedList;
    featuredPlant = plantProvider.getFeaturedList;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.05,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Featured',
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ListPlant(
                              name: "Featured Plants",
                              isCategory: false,
                              snapShot: featuredPlant,
                            )));
                  },
                  child: Text(
                    'See All',
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          // height: MediaQuery.of(context).size.height * 0.4,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Row(
                          children: homeFeaturedPlant.map((e) {
                        return Row(
                          children: [
                            GestureDetector(
                              child: SinglePlant(
                                name: e.name,
                                genus: e.genus,
                                image: e.image,
                              ),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => DetailScreen(
                                          name: e.name,
                                          genus: e.genus,
                                          image: e.genus,
                                        )));
                              },
                            ),
                          ],
                        );
                      }).toList()),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPopular() {
    List<Plant> popularPlant;
    List<Plant> homePopularPlant;

    homePopularPlant = plantProvider.getHomePopularList;
    popularPlant = plantProvider.getPopularList;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.05,
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Popular',
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ListPlant(
                              name: "Popular Plants",
                              isCategory: false,
                              snapShot: popularPlant,
                            )));
                  },
                  child: Text(
                    'See All',
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Row(
              children: homePopularPlant.map((e) {
                return Row(
                  children: [
                    GestureDetector(
                      child: _buildPopularPlant(
                        name: e.name,
                        genus: e.genus,
                        image: e.image,
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => DetailScreen(
                                  name: e.name,
                                  genus: e.genus,
                                  image: e.image,
                                )));
                      },
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        )
      ],
    );
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  MediaQueryData queryData;

  @override
  Widget build(BuildContext context) {
    categoryProvider = Provider.of<CategoryProvider>(context);
    categoryProvider.getAnnualData();
    categoryProvider.getBulbData();
    categoryProvider.getFruitData();
    categoryProvider.getHerbsData();
    categoryProvider.getPerennialData();
    categoryProvider.getRosesData();
    categoryProvider.getShrubData();
    categoryProvider.getTreeData();
    categoryProvider.getVegetableData();
    categoryProvider.getVineData();

    plantProvider = Provider.of<PlantProvider>(context);
    plantProvider.getFeaturedData();
    plantProvider.getPopularData();
    plantProvider.getHomeFeaturedData();
    plantProvider.getHomePopularData();

    plantProvider.getUserData();
    // plantProvider.getAllData();

    return Scaffold(
      key: _key,
      drawer: _buildMyDrawer(),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Theme.of(context).canvasColor,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          ),
          onPressed: () {
            _key.currentState.openDrawer();
          },
        ),
        title: Text('ToadStool',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22.0)),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        child: Container(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Text(
                  'Browse plants and create your own garden',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Column(
                children: [
                  _buildCategory(),
                  _buildFeatured(),
                  _buildPopular(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
