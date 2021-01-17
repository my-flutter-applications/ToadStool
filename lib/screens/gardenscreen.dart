import 'package:flutter/material.dart';
import 'package:toadstool/screens/basketscreen.dart';
import 'package:toadstool/screens/detailsscreen.dart';

class Garden extends StatefulWidget {
  final String name;
  final String image;
  final String plantType;
  final String date;
  final int quantity;

  Garden({this.name, this.image, this.plantType, this.date, this.quantity});
  @override
  _GardenState createState() => _GardenState();
}

class _GardenState extends State<Garden> {
  _buildSingleGardenPlant() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => DetailScreen(

                //@TODO : add the detail screen parameters
                )));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        padding: EdgeInsets.symmetric(vertical: 15.0),
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
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        widget.image,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  // textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.plantType,
                  // textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
                Text(
                  'Planted on :  ${widget.date}',
                  style: TextStyle(color: Colors.greenAccent, fontSize: 14.0),
                ),
              ],
            ),
            SizedBox(
              width: 40.0,
            ),
            Column(
              children: [
                Text('Qty',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 10.0,
                ),
                Text(widget.quantity.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold))
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
              '2',
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
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
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
                // _buildSingleCartProduct(),
                _buildSingleGardenPlant(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
