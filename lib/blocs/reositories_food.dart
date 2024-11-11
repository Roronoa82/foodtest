import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;


import '../models/food_model.dart';

class FoodRepository {
  Future<FoodEntity> fetchFoodData() async {
    final String response =
        await rootBundle.loadString('assets/data/data.json');
    final jsonResponse = json.decode(response);
    final foodEntity = FoodEntity.fromJson(jsonResponse);
    return foodEntity;
  }
}
