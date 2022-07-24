import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:foodie/models/data_model.dart';

Future<DataModel?> getFoodieData() async {
  DataModel? result;
  try {
    final response = await http.get(
      Uri.parse("https://tony48.pythonanywhere.com/foodie/REST"),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      result = DataModel.fromJson(item);
    } else {
      print('error');
    }
  } catch (error) {
    log(error.toString());
  }
  return result;
}
