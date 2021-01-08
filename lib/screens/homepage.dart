import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  Widget _buildFeaturedPlant({String name, String genus, String image}) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Card(
        color: Color(0xff3f3f3f),

        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        // color: Color(0xfff5fbf8),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(25.0),
            ),
          ),
          height: 260,
          width: 250,
          child: Column(
            children: [
              Container(
                height: 200,
                width: 160,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("images/$image"))),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Align(
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
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    genus,
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlantCategory(String categoryType, Color color) {
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

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: Drawer(),
      appBar: AppBar(
        // title: Text('Browse plants and create your garden'),
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
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  child: Text(
                    'Browse plants and create your garden',
                    style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: TextFormField(
                            decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search, color: Colors.white),
                          fillColor: Theme.of(context).primaryColorDark,
                          filled: true,
                          hintText: 'Search',
                          hintStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        )),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                // Container(
                //   //TOD0: Implement carousel
                //   color: Colors.blue,
                //   width: double.infinity,
                //   height: 300,
                // ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Container(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _buildPlantCategory('Annual', Color(0xffffc371)),
                          _buildPlantCategory('Bulb', Color(0xff9AD9DB)),
                          _buildPlantCategory('Fruit', Color(0xffE4CEE0)),
                          _buildPlantCategory('Herbs', Color(0xff98D4BB)),
                          // _buildPlantCategory('HousePlant', Color(0xffffc371)),
                          _buildPlantCategory('Perennial', Color(0xff8DA47E)),
                          _buildPlantCategory('Roses', Color(0xffC47482)),
                          _buildPlantCategory('Shurb', Color(0xffB2B2B2)),
                          _buildPlantCategory('Tree', Color(0xff86736C)),
                          _buildPlantCategory('Vegetable', Color(0xffF27348)),
                          _buildPlantCategory('Vine', Color(0xff7C98AB)),

                          // _buildPlantCategory('Water Plants', Color(0xffffc371)),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Container(
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
                        Text(
                          'See All',
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                _buildFeaturedPlant(
                                    name: 'Sunflower',
                                    genus: 'Helianthus annuus',
                                    image: 'sunflower.png'),
                                _buildFeaturedPlant(
                                    name: 'Sunflower',
                                    genus: 'Helianthus annuus',
                                    image: 'sunflower.png'),
                                _buildFeaturedPlant(
                                    name: 'Sunflower',
                                    genus: 'Helianthus annuus',
                                    image: 'sunflower.png'),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
