import 'package:open_market/AuthApp/Models/UserModel.dart';
import 'package:open_market/SaleApp/Models/ProductImgModel.dart';

class ProductSModel{
  final int product_id;
  final String product_name;
  final String product_buy_price;
  final String product_sale_price;
  final int product_cat;
  final int product_sub_cat;
  final String product_buy_date;
  final String product_desc;
  final String created_at;
  final int user_id;
  final String is_saled;
  final List<String> imgs;
  // UserModel user;

  ProductSModel(
      this.product_id,
      this.product_name,
      this.product_buy_price,
      this.product_sale_price,
      this.product_cat,
      this.product_sub_cat,
      this.product_buy_date,
      this.product_desc,
      this.created_at,
      this.user_id,
      this.is_saled,
      this.imgs
      // this.user
      );
}