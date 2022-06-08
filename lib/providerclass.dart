import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class getmyvar with ChangeNotifier {
  viewdata? view;
  bool status=false;

  data() async {
    try {
      Response response;
      var dio = Dio();
      response = await dio.post(
          'https://dukazo.com/AndroidClass/buyer/get_product_list.php',
          data: {
            "success": 1,
            "id": "17",
            "type": "1",
            "name": "test",
            "mobile": "8888888888",
            "email": "test@gmail.com",
            "password": "123",
            "image": "abc",
            "device_id": "sbsab",
            "created": "2022-02-17 05:05:20"
          });
      print(response);
      var vv = jsonDecode(response.toString());
      view = viewdata.fromJson(vv);
      status=true;
      notifyListeners();

    } catch (e) {
      print(e);
      notifyListeners();
    }
  }


}



class viewdata {
  int? success;
  List<ProductList>? productList;

  viewdata({this.success, this.productList});

  viewdata.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['product_list'] != null) {
      productList = <ProductList>[];
      json['product_list'].forEach((v) {
        productList!.add(new ProductList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.productList != null) {
      data['product_list'] = this.productList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductList {
  String? id;
  String? pName;
  String? sName;
  String? pStatus;
  String? catId;
  String? isSingle;
  String? unit;
  String? weight;
  String? description;
  String? created;
  String? alertStock;
  String? sellerId;
  String? sLat;
  String? sLng;
  String? totalRatingRow;
  int? totalRatingCount;
  List<ProductMultipleImage>? productMultipleImage;
  List<ProductMultipleColor>? productMultipleColor;
  List<ProductCustomPrice>? productCustomPrice;
  String? image;
  String? mainSellingPrice;
  String? mainMrp;
  String? mainDiscount;
  String? mainColor;

  ProductList(
      {this.id,
      this.pName,
      this.sName,
      this.pStatus,
      this.catId,
      this.isSingle,
      this.unit,
      this.weight,
      this.description,
      this.created,
      this.alertStock,
      this.sellerId,
      this.sLat,
      this.sLng,
      this.totalRatingRow,
      this.totalRatingCount,
      this.productMultipleImage,
      this.productMultipleColor,
      this.productCustomPrice,
      this.image,
      this.mainSellingPrice,
      this.mainMrp,
      this.mainDiscount,
      this.mainColor});

  ProductList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pName = json['p_name'];
    sName = json['s_name'];
    pStatus = json['p_status'];
    catId = json['cat_id'];
    isSingle = json['is_single'];
    unit = json['unit'];
    weight = json['weight'];
    description = json['description'];
    created = json['created'];
    alertStock = json['alert_stock'];
    sellerId = json['seller_id'];
    sLat = json['s_lat'];
    sLng = json['s_lng'];
    totalRatingRow = json['total_rating_row'];
    totalRatingCount = json['total_rating_count'];
    if (json['product_multiple_image'] != null) {
      productMultipleImage = <ProductMultipleImage>[];
      json['product_multiple_image'].forEach((v) {
        productMultipleImage!.add(new ProductMultipleImage.fromJson(v));
      });
    }
    if (json['product_multiple_color'] != null) {
      productMultipleColor = <ProductMultipleColor>[];
      json['product_multiple_color'].forEach((v) {
        productMultipleColor!.add(new ProductMultipleColor.fromJson(v));
      });
    }
    if (json['product_custom_price'] != null) {
      productCustomPrice = <ProductCustomPrice>[];
      json['product_custom_price'].forEach((v) {
        productCustomPrice!.add(new ProductCustomPrice.fromJson(v));
      });
    }
    image = json['image'];
    mainSellingPrice = json['main_selling_price'];
    mainMrp = json['main_mrp'];
    mainDiscount = json['main_discount'];
    mainColor = json['main_color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['p_name'] = this.pName;
    data['s_name'] = this.sName;
    data['p_status'] = this.pStatus;
    data['cat_id'] = this.catId;
    data['is_single'] = this.isSingle;
    data['unit'] = this.unit;
    data['weight'] = this.weight;
    data['description'] = this.description;
    data['created'] = this.created;
    data['alert_stock'] = this.alertStock;
    data['seller_id'] = this.sellerId;
    data['s_lat'] = this.sLat;
    data['s_lng'] = this.sLng;
    data['total_rating_row'] = this.totalRatingRow;
    data['total_rating_count'] = this.totalRatingCount;
    if (this.productMultipleImage != null) {
      data['product_multiple_image'] =
          this.productMultipleImage!.map((v) => v.toJson()).toList();
    }
    if (this.productMultipleColor != null) {
      data['product_multiple_color'] =
          this.productMultipleColor!.map((v) => v.toJson()).toList();
    }
    if (this.productCustomPrice != null) {
      data['product_custom_price'] =
          this.productCustomPrice!.map((v) => v.toJson()).toList();
    }
    data['image'] = this.image;
    data['main_selling_price'] = this.mainSellingPrice;
    data['main_mrp'] = this.mainMrp;
    data['main_discount'] = this.mainDiscount;
    data['main_color'] = this.mainColor;
    return data;
  }
}

class ProductMultipleImage {
  int? success;
  String? id;
  String? productId;
  String? productImage;

  ProductMultipleImage(
      {this.success, this.id, this.productId, this.productImage});

  ProductMultipleImage.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    id = json['id'];
    productId = json['product_id'];
    productImage = json['product_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['product_image'] = this.productImage;
    return data;
  }
}

class ProductMultipleColor {
  int? success;
  String? id;
  String? productId;
  String? color;

  ProductMultipleColor({this.success, this.id, this.productId, this.color});

  ProductMultipleColor.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    id = json['id'];
    productId = json['product_id'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['color'] = this.color;
    return data;
  }
}

class ProductCustomPrice {
  int? success;
  String? uId;
  String? productId;
  String? sellingPrice;
  String? mrp;
  String? discount;
  String? size;

  ProductCustomPrice(
      {this.success,
      this.uId,
      this.productId,
      this.sellingPrice,
      this.mrp,
      this.discount,
      this.size});

  ProductCustomPrice.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    uId = json['u_id'];
    productId = json['product_id'];
    sellingPrice = json['selling_price'];
    mrp = json['mrp'];
    discount = json['discount'];
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['u_id'] = this.uId;
    data['product_id'] = this.productId;
    data['selling_price'] = this.sellingPrice;
    data['mrp'] = this.mrp;
    data['discount'] = this.discount;
    data['size'] = this.size;
    return data;
  }
}
