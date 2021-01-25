import 'package:flutter/material.dart';
import 'package:toadstool/screens/homepage.dart';
import 'package:toadstool/widgets/mybutton.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Theme.of(context).canvasColor,
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
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 30.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'We help you choose the best plants for your garden!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
              ),
            ),
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage('images/logo-1.png'))),
            ),
            Text(
              'Go Ahead!',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            Text(
              'Browse plants from our collection, and get planting!',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 50.0),
              child: SizedBox(
                height: 50.0,
                child: MyButton(
                  name: 'Get Planting!',
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
