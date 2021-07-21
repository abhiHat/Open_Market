import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:open_market/AuthApp/Models/UserModel.dart';
import 'package:open_market/SaleApp/Models/ProductModel.dart';

Future<List<ProductSModel>> loadProductList(int id) async {

  var res = await http.get(Uri.parse("http://192.168.43.175:8000/ci/om/public/products/${id}"));
  // http://localhost:8000/ci/om/public/
  var output = json.decode(res.body);

  // print(output);
  // print(res.statusCode);
  List<ProductSModel> cats = [];



  if(res.statusCode == 200){
    print(res.statusCode);
    for(var c in output){
      // print(c);

      // var usr = c['user']['fname'];
      // print(usr);

      // var Id = c['user']['user_id'];
      // var fname = c['user']['fname'];
      // var lname = c['user']['lname'];
      // var email = c['user']['email'];
      // var cno = c['user']['cno'];
      // var address = c['user']['address'];
      // // print(cno);
      // var city = c['user']['city'];
      // var state = c['user']['state'];
      // var pincode = c['user']['pincode'];
      // var created_at = c['user']['created_at'];
      // var modified_at = c['user']['modified_at'];
      // UserModel um = new UserModel(Id, fname, lname, email, cno, address, city, state, pincode, created_at, modified_at);
      //
      // print(um.cno);

      // var j = 0;
      // for(var i in usr){
      //   print(i);
      // }


      var gs = c['img'];
      // print(gs);
      List<String> im = [];

      for(var i in gs){
        im.add(i);
      }

      // print(im);

      ProductSModel cts = ProductSModel(
          int.parse(c['product_id']),
          c['product_name'],
          c['product_buy_price'],
          c['product_sell_price'],
          int.parse(c['product_cat']),
          int.parse(c['product_subcat']),
          c['product_buy_date'],
          c['product_desc'],
          c['created_at'],
          int.parse(c['user_id']),
          c['is_saled'],
          im
      );
      cats.add(cts);
      // print(cats);
    }
  }else{
    // print(res.statusCode);

    // ignore: deprecated_member_use
    // Scaffold.of(context).showSnackBar(SnackBar(content: Text('No shop found for the selected category'),duration: Duration(seconds: 3),));
  }
  // print(cats);
  return cats;

}
