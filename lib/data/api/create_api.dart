import 'dart:ffi';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:ncc_app/data/models/laptop_model.dart';
import 'package:ncc_app/data/models/monitor_model.dart';

import '../../core/api.dart';
import '../../core/token.dart';

class CreateApi {
  static Future createCat(String type) async {
    try {
      var response =
          await http.post(Uri.parse('${Api.api}/MakeCategory'), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${Token.token}'
      }, body: {
        'type': type,
      });
      print(response.body);
      if (response.statusCode == 200) {
        if (response.body.isEmpty) {
          throw Exception('Response is Empty');
        }
        return response.body;
      } else {
        throw Exception('Exception Occurred');
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future createSec(String type, File? image, int catId) async {
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${Token.token}'
      };
      var request = http.MultipartRequest(
          'POST', Uri.parse('${Api.api}/category/$catId/MakeSection'));
      if(image == null ) {
        request.fields.addAll({
          'Section_type': type,
          'Section_image' : 'null',
        });
      }
      else {
        request.files
            .add(await http.MultipartFile.fromPath('Section_image', image.path));
        request.headers.addAll(headers);
        request.fields.addAll({
          'Section_type': type,
        });
      }
      http.StreamedResponse response = await request.send();
      print(response.statusCode);
      if (response.statusCode == 200) {
        return response.stream.bytesToString();
      } else {
        throw Exception('error occured');
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future createSector(String type, int secId) async {
    try {
      var response = await http.post(
          Uri.parse('${Api.api}/category/Section/$secId/makeSector'),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer ${Token.token}'
          },
          body: {
            'name': type,
          });
      if (response.statusCode == 200) {
        if (response.body.isEmpty) {
          throw Exception('Response is Empty');
        }
        return response.body;
      } else {
        throw Exception('an Error Occured');
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future createProduct(
      int id,
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
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${Token.token}'
      };
      var request;
      if(funType == 'Category') {
        request = http.MultipartRequest(
            'POST', Uri.parse('${Api.api}/category/$id'));
        print(1);
      }
      else if (funType == 'Section') {
        request = http.MultipartRequest(
            'POST', Uri.parse('${Api.api}/category/Section/$id'));
        print(2);
      } else {
        request = http.MultipartRequest(
            'POST', Uri.parse('${Api.api}/category/Section/sector/$id'));
        print(3);
      }
      request.fields.addAll({
        'Type': type,
        'price': price,
        'name': name,
        // 'Availabilty': availabilty,
        'product_code': code,
        'Brand': brand,
        'desc': desc,
        'Quntity': quantity,
      });
      request.files
          .add(await http.MultipartFile.fromPath('image', images[0].path));
      for (int i = 1; i < images.length; i++) {
        request.files
            .add(await http.MultipartFile.fromPath('images[]', images[i].path));
      }
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      print(await response.stream.bytesToString());
      if (response.statusCode == 200) {
        return response.stream.bytesToString();
      } else {
        throw Exception('an Error Occurred');
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future createMoreDetails(LaptopModel laptopModel,int id) async {
    try {
      var response = await http.post(
          Uri.parse('${Api.api}/category/Section/laptop/$id'),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer ${Token.token}'
          },
          body: laptopModel.toJson(),
      );
      if (response.statusCode == 200) {
        if (response.body.isEmpty) {
          throw Exception('Response is Empty');
        }
        return response.body;
      } else {
        throw Exception('an Error Occured');
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future createMonitorDetails(MonitorModel laptopModel,int id) async {
    try {
      var response = await http.post(
          Uri.parse('${Api.api}/category/Section/monitor/$id'),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer ${Token.token}'
          },
          body: laptopModel.toMap(),
      );
      if (response.statusCode == 200) {
        if (response.body.isEmpty) {
          throw Exception('Response is Empty');
        }
        return response.body;
      } else {
        throw Exception('an Error Occured');
      }
    } catch (e) {
      rethrow;
    }
  }
}
