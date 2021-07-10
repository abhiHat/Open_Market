import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_market/SaleApp/Models/ProductModel.dart';
import 'package:paytm_allinonesdk/paytm_allinonesdk.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class Product extends StatefulWidget {

  final ProductModel pr;
  const Product({Key key, @required this.pr}) : super(key: key);

  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {

  var scaffoldKey = GlobalKey<ScaffoldState>();



  @override
  Widget build(BuildContext context) {

    DateTime dob = DateTime.parse(widget.pr.buy_date);
    Duration dur =DateTime.now().difference(dob);



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
        body: SingleChildScrollView(
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
                            padding: const EdgeInsets.only(left: 5.0),
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
              Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10,right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(widget.pr.pr_name, style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold, color: Colors.blue[700])),
                        SmoothStarRating(
                          rating: 4,
                          isReadOnly: true,
                          size: 12,
                          color: Colors.yellow[900],
                          filledIconData: Icons.star,
                          halfFilledIconData: Icons.star_half,
                          defaultIconData: Icons.star_border,
                          starCount: 5,
                          allowHalfRating: true,
                          spacing: 1,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text('Pimpale saudagar, pune', style: TextStyle(fontSize: 14, color: Colors.black),),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: CarouselSlider(
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
                        items: widget.pr.imgs.map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                  width:
                                  MediaQuery.of(context).size.width,
                                  height: 300,
                                  margin: EdgeInsets.symmetric(
                                      vertical: 10,
                                      horizontal: 2.0),
                                  decoration: BoxDecoration(
                                    // color: Colors.tealAccent,
                                    borderRadius:
                                    BorderRadius.circular(10.0),
                                  ),
                                  child: Center(
                                    child: Image(
                                      image: NetworkImage("$i"),
                                      // fit: BoxFit.contain,
                                    ),
                                  ));
                            },
                          );
                        }).toList(),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[100]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text('₹ ${widget.pr.pr_rent_price}', style: TextStyle(fontSize: 20, color: Colors.orange[900], fontWeight: FontWeight.bold),)
                              ],
                            ),
                          ]
                            )
                        ),
                      ),

                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('About This Product', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),),
                          SizedBox(height: 10,),
                          Text('Buy Date: ${widget.pr.buy_date}',style: TextStyle(fontSize: 16, color: Colors.black)),
                          Text('Availability: ${int.parse(widget.pr.is_rented) == 0  ? "No" : "Yes"}',style: TextStyle(fontSize: 16, color: Colors.black)),
                          Text('This product is ${dur.inDays.toString()} days old',style: TextStyle(fontSize: 16, color: Colors.black)),
                          Text('Description by Owner: ${widget.pr.desc}',style: TextStyle(fontSize: 16, color: Colors.black)),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Contact Details', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              CircleAvatar(child: Icon(Icons.person),radius: 25,),
                              SizedBox(width: 20,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('Ajay Hatwate',style: TextStyle(fontSize: 16)),
                                  SizedBox(height: 6,),
                                  Text('9876543210', style: TextStyle(fontSize: 16))
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: 5,),
                          Text('Wadgaon kolhati, Aurangabad, 431136',style: TextStyle(fontSize: 16, color: Colors.black)),
                        ],
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(top: 15, bottom: 15),
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          border: Border.all(width: 0.1),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Text('*Delivery mote: Delivery will be within 3 to 4 working days, Rent count from the delivery date', style: TextStyle(color: Colors.pink[600], fontSize: 16),),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 6, bottom: 6),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: MaterialButton(
                        onPressed: (){

                          var result;
                          var oid = "${widget.pr.user_id}_${DateTime.now().year}_${DateTime.now().month}_${DateTime.now().day}";
                          var response = AllInOneSdk.startTransaction(
                              'rgsMrt00166034088192', '${oid}', '${widget.pr.pr_rent_price}', '10OXH8oKYOyTqrpM', null, false, true);
                          response.then((value) {
                            print(value);
                            setState(() {
                              result = value.toString();
                              print(result);
                            });
                          }).catchError((onError) {
                            if (onError is PlatformException) {
                              setState(() {
                                result = onError.message + " \n  " + onError.details.toString();
                                print(result);
                              });
                            } else {
                              setState(() {
                                result = onError.toString();
                                print(result);
                              });
                            }
                          });

                          print(response.toString());


                          },
                        minWidth: MediaQuery.of(context).size.width,
                        height: 50,
                        color: Colors.yellow[300],
                        child: Text('Book Now', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black54),),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 6, bottom: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: MaterialButton(
                        onPressed: (){},
                        minWidth: MediaQuery.of(context).size.width,
                        height: 50,
                        color: Colors.blue[200],
                        child: Text('Add to Cart', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black54),),
                      ),
                    ),


                  ],
                ),
              )


            ],
          ),
        ));
  }
}
