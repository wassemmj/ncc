import 'dart:convert';
import 'dart:io';

import 'package:ncc_app/data/api/edit_api.dart';

class EditRepo {
  static Future editCat(int productId,String edit) async {
    try {
      var response = await EditApi.editCat(productId, edit);
      return jsonDecode(response);
    } catch (e) {
      throw Exception('error in repo');
    }
  }

  static Future editSector(int productId,String edit) async {
    try {
      var response = await EditApi.editSector(productId, edit);
      print(response);
      return jsonDecode(response);
    } catch (e) {
      throw Exception('error in repo');
    }
  }

  static Future editSec(int productId,String edit,File? image) async {
    try {
      var response = await EditApi.editSec(edit, image, productId);
      return jsonDecode(response);
    } catch (e) {
      throw Exception('error in repo');
    }
  }

  static Future editProduct(int id,String price,String quantity,String ava) async {
    try {
      var response = await EditApi.editProduct(id, price, quantity,ava);
      return jsonDecode(response);
    } catch (e) {
      throw Exception('error in repo');
    }
  }

}