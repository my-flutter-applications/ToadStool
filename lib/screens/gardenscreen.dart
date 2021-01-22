import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:toadstool/provider/plant_provider.dart';
import 'package:toadstool/screens/basketscreen.dart';
import 'package:toadstool/screens/detailsscreen.dart';
import 'package:toadstool/widgets/basketsingleplant.dart';

class Garden extends StatefulWidget {
  // final String name;
  // final String image;
  // final String genus;
  // final String date;
  // final int quantity;

  // Garden({this.name, this.image, this.genus, this.date, this.quantity});
  @override
  _GardenState createState() => _GardenState();
}

class _GardenState extends State<Garden> {
  PlantProvider plantProvider;

  @override
  Widget build(BuildContext context) {
    int totalPlants = 0;

    plantProvider = Provider.of<PlantProvider>(context);
    plantProvider.getBasketModelList.forEach((element) {
      totalPlants += element.quantity;
    });
    return Scaffold(
      bottomNavigationBar: Container(
        height: 70,
        color: Theme.of(context).accentColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Total Number Of Plants ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
            ),
            Text(
              totalPlants.toString(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Garden',
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
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          // shrinkWrap: true,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                    'Browse the plants in your garden',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: plantProvider.getBasketModelListLength,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 10.0),
                        // padding: EdgeInsets.symmetric(vertical: 15.0),
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColorDark,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // BasketSinglePlant(
                            //   image:
                            //       plantProvider.getBasketModelList[index].image,
                            //   name:
                            //       plantProvider.getBasketModelList[index].name,
                            //   genus:
                            //       plantProvider.getBasketModelList[index].genus,
                            //   quantity: plantProvider
                            //       .getBasketModelList[index].quantity,
                            //   date:
                            //       plantProvider.getBasketModelList[index].date,
                            // )
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                        builder: (context) => DetailScreen(

                                            //@TODO : add the detail screen parameters
                                            )));
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 10.0),
                                padding: EdgeInsets.symmetric(vertical: 5.0),
                                decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColorDark,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    )),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,

                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        child: Container(
                                          height: 70,
                                          width: 70,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                plantProvider
                                                    .getBasketModelList[index]
                                                    .image,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          plantProvider
                                              .getBasketModelList[index].name,
                                          // textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          plantProvider
                                              .getBasketModelList[index].genus,
                                          // textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16.0),
                                        ),
                                        Text(
                                          'Planted on :  ${plantProvider.getBasketModelList[index].date}',
                                          style: TextStyle(
                                              color: Colors.greenAccent,
                                              fontSize: 14.0),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 40.0,
                                      ),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              bottom: 0.0,
                                            ),
                                            child: IconButton(
                                              icon: Icon(
                                                Icons.close,
                                                color: Colors.white,
                                              ),
                                              onPressed: () {
                                                plantProvider
                                                    .deleteGardenPlant(index);
                                              },
                                            ),
                                          ),
                                          Text('Qty',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          Text(
                                              plantProvider
                                                  .getBasketModelList[index]
                                                  .quantity
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    })
              ],
            )
          ],
        ),
      ),
    );
  }
}
