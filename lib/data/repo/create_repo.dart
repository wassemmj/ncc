import 'dart:convert';
import 'dart:io';

import 'package:ncc_app/data/api/create_api.dart';

import '../models/laptop_model.dart';
import '../models/monitor_model.dart';


class CreateRepo {
  static Future createCat(String type) async {
    try {
      var response = await CreateApi.createCat(type);
      return jsonDecode(response);
    } catch (e) {
      throw Exception('Repo Error');
    }
  }

  static Future createSec(String type,File? image,int catId) async {
    try {
      var response = await CreateApi.createSec(type, image, catId);
      return jsonDecode(response);
    } catch (e) {
      throw Exception('Repo Error');
    }
  }

  static Future createSector(String type,int secId) async {
    try {
      var response = await CreateApi.createSector(type, secId);
      return jsonDecode(response);
    } catch (e) {
      throw Exception('Repo Error');
    }
  }

  static Future createProduct(int id,
      String funType,
      List<File> images,
      String type,
      String price,
      String name,
      String availabilty,
      String code,
      String brand,
      String desc,
      String quantity) async {
    try {
      var response = await CreateApi.createProduct(id, funType, images, type, price, name, availabilty, code, brand, desc, quantity);
      print(jsonDecode(response));
      return jsonDecode(response);
    } catch (e) {
      throw Exception('Repo Error');
    }
  }

  static Future createMoreDetails(LaptopModel laptopModel,int id) async {
    try {
      var response = await CreateApi.createMoreDetails(laptopModel, id);
      return jsonDecode(response);
    } catch (e) {
      throw Exception('Repo Error');
    }
  }

  static Future createMonitorDetails(MonitorModel laptopModel,int id) async {
    try {
      var response = await CreateApi.createMonitorDetails(laptopModel, id);
      print(response);
      return jsonDecode(response);
    } catch (e) {
      throw Exception('Repo Error');
    }
  }
}