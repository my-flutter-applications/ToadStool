import 'package:flutter/material.dart';
import 'package:toadstool/screens/homepage.dart';
import 'package:toadstool/widgets/myTable.dart';
import 'package:toadstool/widgets/mybutton.dart';

class DetailScreen extends StatefulWidget {
  final String image;
  final String name;
  final String genus;

  DetailScreen({this.image, this.name, this.genus});
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Detail Page',
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
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Stack(
          children: [
            ListView(
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 150.0),
                      child: Container(
                        height: 550,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColorDark,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.elliptical(
                                MediaQuery.of(context).size.width, 60.0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(
                              20.0, 100.0, 20.0, 20.0),
                          child: Column(
                            children: [
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          widget.name,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 22.0),
                                        ),
                                        Text(
                                          widget.genus,
                                          style: TextStyle(
                                              color: Colors.grey.shade300,
                                              fontSize: 18.0),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Theme.of(context).primaryColor,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(30.0),
                                          ),
                                        ),
                                        child: IconButton(
                                          icon: Icon(
                                            Icons.shopping_bag,
                                            size: 20.0,
                                          ),
                                          color: Colors.white,
                                          onPressed: () {},
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 40.0,
                              ),
                              Container(
                                child: Text(
                                  'English roses are some of the most fragrant blossoms available, and they’re now seeing a surge in popularity. Their double blossoms are a cross between old-fashioned roses and modern ones, bringing back the sweet fragrance along with new, lush colors.',
                                  style: TextStyle(
                                      color: Colors.grey.shade400,
                                      fontSize: 16.0),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                              SizedBox(
                                height: 35.0,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    width: 80.0,
                                    child: Column(
                                      children: [
                                        CircleAvatar(
                                          radius: 30.0,
                                          backgroundColor: Color(0xffc5d86d),
                                          child: Icon(
                                            Icons.umbrella,
                                            color: Colors.white,
                                            size: 40.0,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Text(
                                          'Season',
                                          style: TextStyle(
                                              color: Colors.grey.shade400),
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Text(
                                          'Spring, Fall, Summer',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.0,
                                              color: Theme.of(context)
                                                  .primaryColor),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 80.0,
                                    child: Column(
                                      children: [
                                        CircleAvatar(
                                          radius: 30.0,
                                          backgroundColor: Color(0xffc5d86d),
                                          child: Icon(
                                            Icons.scatter_plot,
                                            color: Colors.white,
                                            size: 40.0,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Text(
                                          'Type',
                                          style: TextStyle(
                                              color: Colors.grey.shade400),
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Text(
                                          'Rose',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.0,
                                              color: Theme.of(context)
                                                  .primaryColor),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 80.0,
                                    child: Column(
                                      children: [
                                        CircleAvatar(
                                          radius: 30.0,
                                          backgroundColor: Color(0xffc5d86d),
                                          child: Icon(
                                            Icons.wb_sunny,
                                            color: Colors.white,
                                            size: 40.0,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Text(
                                          'Light',
                                          style: TextStyle(
                                              color: Colors.grey.shade400),
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Text(
                                          'Part, Part Sun',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.0,
                                              color: Theme.of(context)
                                                  .primaryColor),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50.0),
                        child: Card(
                          elevation: 4.0,
                          child: Container(
                            height: 220,
                            width: 220,
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                image: DecorationImage(
                                    image:
                                        AssetImage('images/${widget.image}'))),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20.0),
                  child: Container(
                    color: Theme.of(context).canvasColor,
                    height: 550.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MyTable(
                          pname: 'Height',
                          pvalue: '1 to 3 feet 3 to 8 feet 8 to 20 feet',
                        ),
                        MyTable(
                          pname: 'Width',
                          pvalue: '2 to 5 feet',
                        ),
                        MyTable(
                          pname: 'Flower Color',
                          pvalue: 'Purple, Red, Orange, White, Pink, Yellow',
                        ),
                        MyTable(
                          pname: 'Foliage Color',
                          pvalue: 'Blue/Green',
                        ),
                        MyTable(
                          pname: 'Special Features',
                          pvalue: 'Fragrance, Good for Containers, Cut Flowers',
                        ),
                        MyTable(
                          pname: 'Propagation',
                          pvalue: 'Layering, Stem Cuttings',
                        ),
                      ],
                    ),

                    ///////
                  ),
                ),
                Container(
                  height: 1000,
                  color: Theme.of(context).primaryColorDark,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Care Must-Knows',
                          style: TextStyle(
                              fontSize: 22.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Along with being prolific bloomers, English roses are fairly low maintenance. They perform best in full sun. This produces the largest and biggest number of blossoms while preventing any foliar diseases. However, English roses do well in part sun, particularly in warmer climates where sheltered afternoon sun keeps them cool during the heat of the day and also helps create the most intense fragrance. English roses require well-drained soil to thrive. Because some types rebloom and grow vigorously, make sure to amend the soil with rich, well-aged compost and add fertilizer according to package directions.',
                          style: TextStyle(
                              color: Colors.grey.shade400, fontSize: 16.0),
                          textAlign: TextAlign.justify,
                        ),
                        Text(
                          'Harvest Tips',
                          style: TextStyle(
                              fontSize: 22.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'English roses benefit from regular pruning to keep them looking their best while encouraging healthy flowers. Prune in late winter, just before new growth emerges. A general rule is to prune back your rose back by about one-third of the total height to maintain its current size and shape. You can prune more or less depending on how large you want your shrub to grow. Uneven soil moisture and drought encourages fungal diseases, so remove any dead or dying branches. Pruning also helps with air circulation around your plant, which can prevent powdery mildew and black spot fungus. You can also prune after the initial wave of blossoms to help hasten along a second set of flowers.',
                          style: TextStyle(
                              color: Colors.grey.shade400, fontSize: 16.0),
                          textAlign: TextAlign.justify,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Positioned(
              bottom: 10.0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: SizedBox(
                  height: 50.0,
                  width: 390.0,
                  child: MyButton(
                    name: 'Plant',
                    onPressed: () {},
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
