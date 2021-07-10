import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:open_market/SaleApp/Screens/SaleHome.dart';

class RentHome extends StatefulWidget {
  const RentHome({Key key}) : super(key: key);

  @override
  _RentHomeState createState() => _RentHomeState();
}

class _RentHomeState extends State<RentHome> {

  var scaffoldKey = GlobalKey<ScaffoldState>();

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
          Column(
            children: <Widget>[
              Container(
                color: Colors.cyan[200],
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
                            Text(" Market (Rent )", style: TextStyle(fontSize: 20),)
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
            ],
          ),

          FutureBuilder(
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
              if(snapshot.data == null){
                return Container(
                  child: Center(
                    child: Text('Loading...'),
                  ),
                );
              }else{
                return SingleChildScrollView(
                  child: Row(
                    children: <Widget>[
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data == null
                        ? 0
                        : snapshot.data.length,
                        scrollDirection:Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int integer){
                          return Container();
                        },
                      )
                    ],
                  ),
                );
              }
            },
          ),

          Positioned(
              bottom: 10,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.37,
                height: 50,
                decoration: BoxDecoration(
                  // color: Colors.red
                ),
                child: Transform.scale(
                    scale: 1,
                    child :LiteRollingSwitch(
                      value: true,
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
                        if(!state){
                          // Navigator.push(context,MaterialPageRoute(builder: (context) => SaleHome()));
                          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => SaleHome()),
                                  (Route<dynamic> route) => false);                        }
                        print('turned to ${(state) ? 'Rent mode' : 'Sale Mode'}');
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
