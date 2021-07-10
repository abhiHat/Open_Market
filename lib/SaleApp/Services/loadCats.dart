import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:open_market/SaleApp/Models/CategoryModel.dart';

Future<List<CategoryModel>> loadCats() async {
  var res = await http.get(Uri.parse("http://192.168.43.175:8000/ci/om/public/category"));
  var output = json.decode(res.body);

  print(output);

  List<CategoryModel> cats = [];

  for(var c in output){
    CategoryModel cts = CategoryModel(int.parse(c['cat_id']), c['cat_name'], c['cat_desc'],
        c['cat_img'], c['time_stamp']
    );
    cats.add(cts);
  }
  return cats;
}
