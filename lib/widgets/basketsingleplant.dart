import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toadstool/provider/plant_provider.dart';
import 'package:toadstool/screens/gardenscreen.dart';
import 'package:toadstool/widgets/mybutton.dart';

class BasketSinglePlant extends StatefulWidget {
  final String name;
  final String genus;
  final String image;
  final String date;
  final int index;

  final int quantity;

  BasketSinglePlant(
      {this.name,
      this.genus,
      this.image,
      this.date,
      this.quantity,
      this.index});
  @override
  _BasketSinglePlantState createState() => _BasketSinglePlantState();
}

String finalDate = '';

getCurrentDate() {
  var date = new DateTime.now().toString();

  var dateParse = DateTime.parse(date);

  var formattedDate =
      "${dateParse.year} - ${dateParse.month} - ${dateParse.day}";

  return finalDate = formattedDate.toString();
}

int count = 1;

class _BasketSinglePlantState extends State<BasketSinglePlant> {
  PlantProvider plantProvider;
  @override
  void initState() {
    super.initState();
    count = 1;
  }

  Widget build(BuildContext context) {
    plantProvider = Provider.of<PlantProvider>(context);

    // count = widget.quantity;
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Container(
                height: 90,
                width: 90,
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
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              ),
              Text(
                widget.genus,
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
            padding: const EdgeInsets.only(top: 5.0, right: 5.0),
            child: Column(
              children: [
                // Padding(
                //   padding: const EdgeInsets.only(left: 50.0, bottom: 10.0),
                //   child: IconButton(
                //     icon: Icon(
                //       Icons.close,
                //       color: Colors.white,
                //     ),
                //     onPressed: () {
                //        plantProvider
                //                                     .deleteGardenPlant(index);
                //     },
                //   ),
                // ),
                SizedBox(
                  height: 42,
                  width: 95,
                  child: MyButton(
                    name: 'Plant',
                    onPressed: () {
                      plantProvider.getBasketData(
                        image: widget.image,
                        name: widget.name,
                        genus: widget.genus,
                        quantity: count,
                        date: getCurrentDate(),
                      );
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Garden(),
                      ));
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
