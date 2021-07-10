import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:open_market/RentApp/Screens/RentHome.dart';
import 'package:open_market/SaleApp/Screens/ProductList.dart';
import 'package:open_market/SaleApp/Services/loadCats.dart';

class SaleHome extends StatefulWidget {
  const SaleHome({Key key}) : super(key: key);

  @override
  _SaleHomeState createState() => _SaleHomeState();
}

class _SaleHomeState extends State<SaleHome> {

  var scaffoldKey = GlobalKey<ScaffoldState>();
  List colors = [Colors.cyan[200], Colors.blue[200], Colors.red[200],Colors.greenAccent[200],Colors.pink[200]];

  var imgs = [
    'assets/images/banner/b1.jpg',
    'assets/images/banner/b2.jpg',
    'assets/images/banner/b3.jpg'
  ];


  void loadProductList(int id){

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Center(child: Text('Home')),
                decoration: BoxDecoration(
                    color: Colors.cyan[400]
                ),
              ),
              ListTile(
                title: Text('Book by categories'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Cart'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Wishlist'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Your Booking'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Your Products'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  // Navigator.push(context,MaterialPageRoute(builder: (context) => DemoApiList()));
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Language'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Setting'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Help?'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                  // Navigator.push(context,MaterialPageRoute(builder: (context) => MakePayment() ));
                },
              ),
              ListTile(
                title: Text('Contact Us!'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                  // Navigator.push(context,MaterialPageRoute(builder: (context) => Login() ));
                },
              ),
            ],
          ),
        ),
        body: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    color: Colors.cyan[200],
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 50,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 0.0),
                                child: IconButton(icon: Icon(Icons.menu), onPressed: () {
                                  scaffoldKey.currentState.openDrawer();
                                },),
                              ),
                              Row(
                                children: <Widget>[
                                  Text(
                                    "Open",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                                  ),
                                  Text(" Market (Buy)", style: TextStyle(fontSize: 20),)
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 5.0),
                                child: Icon(Icons.shopping_cart),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 15),
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  border: Border.all(width: 0.5),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              padding: EdgeInsets.only(
                                  right: 10,left: 10
                              ),
                              child:

                              TextFormField(
                                decoration: InputDecoration(
                                    labelText: 'Search',
                                    fillColor: Colors.white,
                                    focusColor: Colors.white,
                                    border: InputBorder.none,
                                    icon: Icon(Icons.search)
                                ),
                                cursorColor: Colors.white,

                              ),

                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                  FutureBuilder(
                    future: loadCats(),
                    builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
                      if(snapshot.data == null){
                        return Container(
                          child: Center(
                            child: Text('Loading...'),
                          ),
                        );
                      }else{
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.only(top:10.0),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  child: ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: snapshot.data == null
                                        ? 0
                                        : snapshot.data.length,
                                    scrollDirection:Axis.horizontal,
                                    shrinkWrap: true,
                                    itemBuilder: (BuildContext context, int integer){
                                      var catId = snapshot.data[integer].catId;
                                      var catName = snapshot.data[integer].catName;
                                      var catImg = snapshot.data[integer].catImage;
                                      // Random random = new Random();

                                      return InkWell(
                                        onTap: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductList(id: catId)));
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.only(top: 1,bottom: 10, left: 10,right: 10),
                                          child: Container(
                                            height: 80,
                                            width: 80,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                color: colors[integer],
                                            ),
                                            child: Center(
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    // Image(image: NetworkImage(catImg.toString(),),
                                                    //   height: 35,width: 35,
                                                    //   color: Colors.cyan[900],
                                                    //   ),
                                                    FadeInImage(placeholder: AssetImage('assets/placeholder.jpg'), image: NetworkImage(catImg.toString(),), height: 35, width: 35,),
                                                    Text(catName),
                                                  ],
                                                )),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  height: 100,
                                )
                              ],
                            ),
                          ),
                        );
                      }
                    },
                  ),


                  Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.7),
                      // borderRadius:
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Top picks for your home',style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            InkWell(
                              onTap: (){
                                // Navigator.push(context,MaterialPageRoute(builder: (context) => ListItem()));

                              },
                              child: Column(
                                children: <Widget>[
                                  Image(width: MediaQuery.of(context).size.width * 0.4,height: 170,fit: BoxFit.cover, image: NetworkImage('https://amstradworld.com/wp-content/uploads/2020/01/Amstrad-Hot-Cold-All-Season-AC-1536x833.jpg',),
                                  ),
                                  Text('ACs')
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                // Navigator.push(context,MaterialPageRoute(builder: (context) => ListItem()));

                              },
                              child: Column(
                                children: <Widget>[
                                  Image(width: MediaQuery.of(context).size.width * 0.4,height: 170,fit: BoxFit.cover, image: NetworkImage('https://d2hxhsle93cq7m.cloudfront.net/Thumbs/0004481_samsung-french-door-refrigerator-with-showcase-rf28k9380sg-826-l_1000.jpeg',),
                                  ),
                                  Text('Refrigerators')
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            InkWell(
                              onTap: (){
                                // Navigator.push(context,MaterialPageRoute(builder: (context) => ListItem()));

                              },
                              child: Column(
                                children: <Widget>[
                                  Image(width: MediaQuery.of(context).size.width * 0.4,height: 170,fit: BoxFit.cover, image: NetworkImage('https://assets.architecturaldigest.in/photos/60084d6e274aca243711cb75/16:9/w_2560%2Cc_limit/best-smart-TVs-in-india-1366x768.jpg',),
                                  ),
                                  Text('Televisions')
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                // Navigator.push(context,MaterialPageRoute(builder: (context) => ListItem()));
                              },
                              child: Column(
                                children: <Widget>[
                                  Image(width: MediaQuery.of(context).size.width * 0.4,height: 170,fit: BoxFit.cover, image: NetworkImage('https://static.toiimg.com/photo/msid-78804776/78804776.jpg',),
                                  ),
                                  Text('Washing Machines')
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('See more',style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.blue),),
                        )
                      ],
                    ),
                  ),

                  CarouselSlider(
                    options: CarouselOptions(
                      height: 200.0,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.75,
                      initialPage: 1,
                      autoPlay: true,
                      scrollDirection: Axis.horizontal,
                      autoPlayAnimationDuration:
                      Duration(milliseconds: 500),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                    ),
                    items: imgs.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                              width:
                              MediaQuery.of(context).size.width,
                              height: 400,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 1.0),
                              decoration: BoxDecoration(
                                // color: Colors.tealAccent,
                                borderRadius:
                                BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                child: Image(
                                  image: AssetImage("$i"),

                                  fit: BoxFit.contain,
                                ),
                              ));
                        },
                      );
                    }).toList(),
                  ),

                  SizedBox(height: 100,)


                ],
              ),
            ),





            // Container(
            //   child: Text('Saample Data...'),
            // ),

            Positioned(
                bottom: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.37,
                  height: 50,
                  decoration: BoxDecoration(
                    // color: Colors.red
                  ),
                  child: Transform.scale(
                      scale: 1,
                      child :LiteRollingSwitch(
                        value: false,
                        textOn: 'Rent',
                        textOff: 'Buy',
                        colorOn: Colors.cyan[400],
                        colorOff: Colors.cyan[700],
                        iconOn: Icons.check,
                        iconOff: Icons.check,
                        animationDuration: Duration(
                            milliseconds: 600
                        ),
                        onChanged: (bool state){
                          if(state){
                            // Navigator.push(context,MaterialPageRoute(builder: (context) => RentHome()));
                            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => RentHome()),
                                (Route<dynamic> route) => false);
                          }
                          print('turned to ${(state) ? 'Rent mode' : 'Buy Mode'}');
                        },
                      )
                  ),
                )
            )
          ],
          alignment: Alignment.center,
        )
    );
  }
}
