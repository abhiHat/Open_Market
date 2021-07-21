import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_market/AuthApp/Screens/login.dart';
import 'package:open_market/SaleApp/Screens/AddProduct.dart';
import 'package:open_market/SaleApp/Screens/Product.dart';
import 'package:open_market/SaleApp/Services/loadProductList.dart';

class ProductList extends StatefulWidget {
  final int id;
  const ProductList({Key key, @required this.id}) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {

  var scaffoldKey = GlobalKey<ScaffoldState>();
  User user = FirebaseAuth.instance.currentUser;



  @override
  Widget build(BuildContext context) {

    return Scaffold(

      key: scaffoldKey,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Center(child: Column(
                children: [
                  Text('Welcome '),
                  Text(user != null ? user.displayName.toString() : " ")
                ],
              )),
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
              title: Text('Add Product'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(context,MaterialPageRoute(builder: (context) => AddProduct()));
                // Navigator.pop(context);
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
              title: Text('My Account'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                // Navigator.pop(context);
                Navigator.push(context,MaterialPageRoute(builder: (context) => Login() ));
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
            FutureBuilder(
              future: loadProductList(widget.id),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
                final orientation = MediaQuery.of(context).orientation;
                if(snapshot.data == null){
                  return Container(
                    child: Center(
                      child: Text('Loading...'),
                    ),
                  );
                }else{

                  return GridView.builder(
                    padding: EdgeInsets.all(5),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: ( orientation == Orientation.portrait) ? 2 : 3),
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index){

                        var prId = snapshot.data[index].product_id;
                        var prName = snapshot.data[index].product_name;
                        var prBPrice = snapshot.data[index].product_buy_price;
                        var prSPrice = snapshot.data[index].product_sale_price;
                        var primgs = snapshot.data[index].imgs;


                        return Wrap(
                          children: <Widget>[
                            GestureDetector(
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.45,
                                margin: EdgeInsets.all(5),

                                decoration: BoxDecoration(
                                    border: Border.all(width: 0.4)
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Image(image: NetworkImage(primgs[0]),width: MediaQuery.of(context).size.width * 0.3,height: 90),
                                    // Text(primgs[0]),
                                    // Text(prId.toString()),
                                    Text(prName,style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w500) , textAlign: TextAlign.center),
                                    Text(prBPrice),
                                    SizedBox(height: 10,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("₹ ${prSPrice}", style: TextStyle(fontSize: 18, color: Colors.yellow[900]),),
                                        // Text(" ", style: TextStyle(color: Colors.black54),)
                                      ],
                                    ),
                                  ],
                                ),
                                // padding: EdgeInsets.only(bottom: ),
                                // height: double.infinity
                              ),
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Product(pr: snapshot.data[index],)));
                              },
                            )
                          ],
                        );
                      });
                  // return ListView.builder(
                  //   physics: NeverScrollableScrollPhysics(),
                  //   itemCount: snapshot.data == null
                  //       ? 0
                  //       : snapshot.data.length,
                  //   scrollDirection:Axis.vertical,
                  //   shrinkWrap: true,
                  //   itemBuilder: (BuildContext context, int integer){

                  //     return GridView.count(
                  //       shrinkWrap: true,
                  //       physics: ClampingScrollPhysics(),
                  //       primary: false,
                  //       padding: const EdgeInsets.all(20),
                  //       crossAxisSpacing: 10,
                  //       mainAxisSpacing: 10,
                  //       crossAxisCount: 2,
                  //       children: <Widget>[

                  //       ],
                  //     );
                  //   },
                  // );
                }
              },
            ),

          ],
        ),
      ),
    );
  }
}
