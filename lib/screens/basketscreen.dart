import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toadstool/provider/plant_provider.dart';
import 'package:toadstool/screens/homepage.dart';
import 'package:toadstool/widgets/basketsingleplant.dart';
import 'package:toadstool/widgets/mybutton.dart';

import 'gardenscreen.dart';

class BasketScreen extends StatefulWidget {
  final String name;
  final String image;
  final String genus;

  BasketScreen({this.name, this.image, this.genus});
  @override
  _BasketScreenState createState() => _BasketScreenState();
}

PlantProvider plantProvider;

class _BasketScreenState extends State<BasketScreen> {
  // String finalDate = '';

  // getCurrentDate() {
  //   var date = new DateTime.now().toString();

  //   var dateParse = DateTime.parse(date);

  //   var formattedDate =
  //       "${dateParse.year} - ${dateParse.month} - ${dateParse.day}";

  //   return finalDate = formattedDate.toString();
  // }

  // int count = 1;

  // Widget _buildSingleCartProduct() {
  //   return }

  @override
  Widget build(BuildContext context) {
    plantProvider = Provider.of<PlantProvider>(context);
    return Scaffold(
      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.symmetric(vertical: 10.0),
      //   child: SizedBox(
      //     height: 70,
      //     width: 100,
      //     child: MyButton(
      //       name: 'Plant',
      //       onPressed: () {},
      //     ),
      //   ),
      // ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Basket',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22.0),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
        actions: [
          Container(
            margin: EdgeInsets.all(10.0),
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.all(
                Radius.circular(30.0),
              ),
            ),
            child: GestureDetector(
              child: Icon(
                Icons.favorite_outline,
                color: Colors.white,
                size: 20.0,
              ),
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Garden()));
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    'View the plants in your basket',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                // _buildSingleCartProduct(),
                // ListView.builder(
                //     shrinkWrap: true,
                //     itemCount: plantProvider.getBasketModelListLength,
                //     itemBuilder: (context, index) {
                //       return BasketSinglePlant(
                //         image: plantProvider.getBasketModelList[index].image,
                //         name: plantProvider.getBasketModelList[index].name,

                //         //////
                //         genus: plantProvider.getBasketModelList[index].genus,
                //         // quantity:
                //         //     plantProvider.getBasketModelList[index].quantity,
                //         // date: plantProvider.getBasketModelList[index].date,
                //       );
                //     })
                ListView(
                  shrinkWrap: true,
                  children: [
                    BasketSinglePlant(
                      image: widget.image,
                      name: widget.name,
                      genus: widget.genus,
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
