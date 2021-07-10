import 'package:open_market/AuthApp/Models/UserModel.dart';
import 'package:open_market/SaleApp/Models/ProductImgModel.dart';

class ProductModel{
  final int pr_id;
  final String pr_name;
  final String pr_buy_price;
  final String pr_rent_price;
  final int pr_cat;
  final int pr_sub_cat;
  final String buy_date;
  final String desc;
  final String created_at;
  final int user_id;
  final String is_rented;
  final List<String> imgs;
  // UserModel user;

  ProductModel(
      this.pr_id,
      this.pr_name,
      this.pr_buy_price,
      this.pr_rent_price,
      this.pr_cat,
      this.pr_sub_cat,
      this.buy_date,
      this.desc,
      this.created_at,
      this.user_id,
      this.is_rented,
      this.imgs
      // this.user
      );
}