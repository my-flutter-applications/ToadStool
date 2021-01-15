import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:toadstool/screens/detailsscreen.dart';
import 'package:toadstool/screens/listplant.dart';
import 'package:toadstool/widgets/singleplant.dart';
import '../model/plant.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

Plant tomatoData;
// Plant strawberryData;
// Plant amazonlilyData;
// Plant potatoData;
// Plant lemonData;
Plant englishroseData;

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

  bool accountColor = false;

  bool contactusColor = false;

  bool aboutColor = false;

  Widget _buildMyDrawer() {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Color(0xff3f3f3f)),
            accountName: Text(
              'Supriya Malla',
              style: TextStyle(color: Colors.white),
            ),
            accountEmail: Text(
              'supriya.malla02@gmail.com',
              style: TextStyle(color: Colors.white),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('images/roses.jpeg'),
            ),
          ),
          ListTile(
            selected: homeColor,
            onTap: () {
              setState(() {
                homeColor = true;
                basketColor = false;
                mygardenColor = false;
                accountColor = false;
                contactusColor = false;
                aboutColor = false;
              });
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
            selected: basketColor,
            onTap: () {
              setState(() {
                basketColor = true;
                homeColor = false;
                mygardenColor = false;
                accountColor = false;
                contactusColor = false;
                aboutColor = false;
              });
            },
            selectedTileColor: Theme.of(context).primaryColorDark,
            leading: Icon(Icons.shopping_bag_outlined,
                size: 28.0, color: Theme.of(context).primaryColor),
            title: Text('Basket',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                )),
          ),
          ListTile(
            selected: mygardenColor,
            onTap: () {
              setState(() {
                mygardenColor = true;
                basketColor = false;
                homeColor = false;
                accountColor = false;
                contactusColor = false;
                aboutColor = false;
              });
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
            selected: accountColor,
            onTap: () {
              setState(() {
                accountColor = true;
                basketColor = false;
                mygardenColor = false;
                homeColor = false;
                contactusColor = false;
                aboutColor = false;
              });
            },
            selectedTileColor: Theme.of(context).primaryColorDark,
            leading: Icon(Icons.person_outline,
                size: 28.0, color: Theme.of(context).primaryColor),
            title: Text(
              'Account',
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
                accountColor = false;
                homeColor = false;
                aboutColor = false;
              });
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
                accountColor = false;
                contactusColor = false;
                homeColor = false;
              });
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
              FirebaseAuth.instance.signOut();
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      child: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => ListPlant(
                            name: 'Annual',
                            snapShot: annual,
                          )));
                },
                child: _buildPlantCategory(
                    categoryType: 'Annual', color: Color(0xffffc371)),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => ListPlant()));
                },
                child: _buildPlantCategory(
                    categoryType: 'Bulb', color: Color(0xff9AD9DB)),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => ListPlant()));
                },
                child: _buildPlantCategory(
                    categoryType: 'Fruit', color: Color(0xffE4CEE0)),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => ListPlant()));
                },
                child: _buildPlantCategory(
                    categoryType: 'Herbs', color: Color(0xff98D4BB)),
              ),
              // _buildPlantCategory('HousePlant', Color(0xffffc371)),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => ListPlant()));
                },
                child: _buildPlantCategory(
                    categoryType: 'Perennial', color: Color(0xff8DA47E)),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => ListPlant()));
                },
                child: _buildPlantCategory(
                    categoryType: 'Roses', color: Color(0xffC47482)),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => ListPlant()));
                },
                child: _buildPlantCategory(
                    categoryType: 'Shurb', color: Color(0xffB2B2B2)),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => ListPlant()));
                },
                child: _buildPlantCategory(
                    categoryType: 'Tree', color: Color(0xff86736C)),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => ListPlant()));
                },
                child: _buildPlantCategory(
                    categoryType: 'Vegetable', color: Color(0xffF27348)),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => ListPlant()));
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
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => ListPlant(
                              name: "Featured Plants",
                              snapShot: featureSnapShot,
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
                        children: [
                          GestureDetector(
                            child: SinglePlant(
                                name: 'Sunflower',
                                genus: 'Helianthus annuus',
                                image: 'sunflower.png'),
                            onTap: () {
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                      builder: (context) => DetailScreen(
                                            name: 'Sunflower',
                                            genus: 'Helianthus annuus',
                                            image: 'sunflower.png',
                                          )));
                            },
                          ),
                          GestureDetector(
                            child: SinglePlant(
                                name: englishroseData.name,
                                genus: englishroseData.genus,
                                image: englishroseData.image),
                            onTap: () {
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                      builder: (context) => DetailScreen(
                                            name: englishroseData.name,
                                            genus: englishroseData.genus,
                                            image: englishroseData.image,
                                          )));
                            },
                          ),
                          GestureDetector(
                            child: SinglePlant(
                                name: tomatoData.name,
                                genus: tomatoData.genus,
                                image: tomatoData.image),
                            onTap: () {
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                      builder: (context) => DetailScreen(
                                            name: tomatoData.name,
                                            genus: tomatoData.genus,
                                            image: tomatoData.image,
                                          )));
                            },
                          ),
                        ],
                      ),
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
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => ListPlant(
                              name: "Popular Plants",
                              snapShot: popularSnapShot,
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
              children: [
                GestureDetector(
                  child: _buildPopularPlant(
                      name: lavenderData.name,
                      genus: lavenderData.genus,
                      image: lavenderData.image),
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => DetailScreen(
                              name: lavenderData.name,
                              genus: lavenderData.genus,
                              image: lavenderData.image,
                            )));
                  },
                ),
                GestureDetector(
                  child: _buildPopularPlant(
                    name: raspberryData.name,
                    genus: raspberryData.genus,
                    image: raspberryData.image,
                  ),
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => DetailScreen(
                              name: raspberryData.name,
                              genus: raspberryData.genus,
                              image: raspberryData.image,
                            )));
                  },
                ),
                GestureDetector(
                  child: _buildPopularPlant(
                      name: 'Sunflower',
                      genus: 'Helianthus aunuus',
                      image: 'sunflower.png'),
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => DetailScreen(
                              name: 'English Rose',
                              genus: 'Rosa',
                              image: 'roses.jpeg',
                            )));
                  },
                ),
              ],
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
        actions: [
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.shopping_bag_outlined,
                color: Colors.white,
              ),
              onPressed: () {}),
        ],
        title: Text('ToadStool',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22.0)),
      ),
      body: FutureBuilder(
        future: FirebaseFirestore.instance
            .collection('plants')
            .doc('tpPczedvpf1qhxfpH70Z')
            .collection('featuredplants')
            .get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          featureSnapShot = snapshot;

          tomatoData = Plant(
            image: snapshot.data.documents[0]['image'],
            name: snapshot.data.documents[0]['name'],
            genus: snapshot.data.documents[0]['genus'],
          );

          englishroseData = Plant(
            image: snapshot.data.documents[5]['image'],
            name: snapshot.data.documents[5]['name'],
            genus: snapshot.data.documents[5]['genus'],
          );

          return FutureBuilder(
              //
              future: FirebaseFirestore.instance
                  .collection('plants')
                  .doc('tpPczedvpf1qhxfpH70Z')
                  .collection('popularplants')
                  .get(),
              builder: (context, snapShot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return FutureBuilder(
                  future: FirebaseFirestore.instance
                      .collection('category')
                      .doc('Rc91xFvd6aLv1yDrmG6Q')
                      .collection('annual')
                      .get(),
                  builder: (context, annualSnapshot) {
                    if (annualSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    // featureSnapShot = snapshot;
                    popularSnapShot = snapShot;

                    annual = annualSnapshot;

                    lavenderData = Plant(
                      image: snapShot.data.documents[0]['image'],
                      name: snapShot.data.documents[0]['name'],
                      genus: snapShot.data.documents[0]['genus'],
                    );

                    raspberryData = Plant(
                      image: snapShot.data.documents[1]['image'],
                      name: snapShot.data.documents[1]['name'],
                      genus: snapShot.data.documents[1]['genus'],
                    );
                    return Container(
                      height: double.infinity,
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                        child: ListView(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 15.0),
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
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: TextFormField(
                                        decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.search,
                                          color: Colors.white),
                                      fillColor:
                                          Theme.of(context).primaryColorDark,
                                      filled: true,
                                      hintText: 'Search',
                                      hintStyle: TextStyle(color: Colors.white),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                    )),
                                  ),
                                ),
                                _buildCategory(),
                                _buildFeatured(),
                                _buildPopular(),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              });
        },
      ),
    );
  }
}
