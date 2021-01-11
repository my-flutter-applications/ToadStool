import 'package:flutter/material.dart';
import 'package:toadstool/widgets/mybutton.dart';

import 'gardenscreen.dart';

class BasketScreen extends StatefulWidget {
  final String name;
  final String image;
  final String plantType;

  BasketScreen({this.name, this.image, this.plantType});
  @override
  _BasketScreenState createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  String finalDate = '';

  getCurrentDate() {
    var date = new DateTime.now().toString();

    var dateParse = DateTime.parse(date);

    var formattedDate =
        "${dateParse.year} - ${dateParse.month} - ${dateParse.day}";

    return finalDate = formattedDate.toString();
  }

  int count = 1;

  Widget _buildSingleCartProduct() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      padding: EdgeInsets.symmetric(vertical: 15.0),
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColorDark,
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "images/${widget.image}",
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
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              ),
              Text(
                widget.plantType,
                // textAlign: TextAlign.left,
                style: TextStyle(color: Colors.white, fontSize: 14.0),
              ),
              Container(
                margin: EdgeInsets.only(top: 10.0),
                height: 28.0,
                width: 90.0,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      child: Icon(
                        Icons.remove,
                      ),
                      onTap: () {
                        setState(() {
                          if (count > 1) {
                            count--;
                          }
                        });
                      },
                    ),
                    Text(count.toString(), style: TextStyle(fontSize: 18.0)),
                    GestureDetector(
                      child: Icon(Icons.add),
                      onTap: () {
                        setState(() {
                          count++;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: SizedBox(
              height: 45,
              width: 100,
              child: MyButton(
                name: 'Plant',
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => Garden(
                            name: widget.name,
                            image: widget.image,
                            plantType: widget.plantType,
                            date: getCurrentDate(),
                            quantity: count,
                          )));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          onPressed: () {},
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
                _buildSingleCartProduct(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
