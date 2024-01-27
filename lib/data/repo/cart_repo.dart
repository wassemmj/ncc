import 'dart:convert';

import 'package:ncc_app/data/api/cart_api.dart';

class CartRepo {
  static Future addToCart(int productId,int quantity) async {
    try {
      var response = await CartApi.addToCart(productId, quantity);
      return jsonDecode(response);
    } catch (e) {
      throw Exception('Exception occurred');
    }
  }

  static Future showCart() async {
    try {
      var response = await CartApi.showCart();
      return jsonDecode(response);
    } catch (e) {
      throw Exception('Exception occurred');
    }
  }

  static Future deleteItem(int id) async {
    try {
      var response = await CartApi.deleteItem(id);
      return jsonDecode(response);
    } catch (e) {
      throw Exception('Exception occurred');
    }
  }

  static Future deleteOneItem(int id) async {
    try {
      var response = await CartApi.deleteOneItem(id);
      return jsonDecode(response);
    } catch (e) {
      throw Exception('Exception occurred');
    }
  }
}