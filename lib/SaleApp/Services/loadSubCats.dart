import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:open_market/SaleApp/Models/SubCatModel.dart';

Future<List<SubCatModel>> loadSubCats(int id) async {
  var res = await http.get(Uri.parse("http://192.168.43.175:8000/ci/om/public/subcategory/${id}"));
  var output = json.decode(res.body);

  // print(output);
  List<SubCatModel> cats = [];
  if(res.statusCode == 200){
    for(var c in output){
      SubCatModel cts = SubCatModel(int.parse(c['scat_id']),c['scat_name'],int.parse(c['cat_id']), c['scat_desc'],
          c['scat_img'], c['time_stamp']
      );
      cats.add(cts);
    }
    return cats;
  }else{
    return cats;
  }


}
