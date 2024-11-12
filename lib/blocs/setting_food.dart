import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../models/menu_item.dart';

class MenuRepository {
  Future<FoodEntity> fetchFoodData() async {
    final String response =
        await rootBundle.loadString('assets/image/data_test.json');
    final jsonResponse = json.decode(response);
    final foodEntity = FoodEntity.fromJson(jsonResponse);
    return foodEntity;
  }
}
