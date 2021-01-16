import 'package:flutter/material.dart';
import 'package:toadstool/screens/detailsscreen.dart';

class SinglePlant extends StatelessWidget {
  final String name;
  final String genus;
  final String image;

  SinglePlant({this.name, this.genus, this.image});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => DetailScreen(
                  name: name,
                  genus: genus,
                  image: image,
                )));
      },
      child: Padding(
        // padding: const EdgeInsets.only(right: 15.0),
        padding: const EdgeInsets.symmetric(horizontal: 5.0),

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
            height: 255,
            width: 180,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40.0),
                    child: Container(
                      height: 160,
                      width: 160,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                              image,
                            ),
                            fit: BoxFit.fill),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 5.0),
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
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
      ),
    );
  }
}
