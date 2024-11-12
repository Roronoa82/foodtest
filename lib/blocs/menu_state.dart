part of 'menu_bloc.dart';

abstract class MenuState extends Equatable {
  const MenuState();

  @override
  List<Object> get props => [];
}

class FoodInitial extends MenuState {}

class FoodLoading extends MenuState {}

class FoodSuccess extends MenuState {
  final List<Food> foodList;
  final List<FoodCategory> foodCategoryList;
  final List<FoodSet> foodSetList;
  final Map<String, List<Food>> groupedFood;
  final Map<Food, int> order;
  final double subtotal;

  const FoodSuccess({
    required this.foodList,
    required this.foodCategoryList,
    required this.foodSetList,
    required this.groupedFood,
    required this.order,
    required this.subtotal,
  });

  FoodSuccess copyWith({
    List<Food>? foodList,
    List<FoodCategory>? foodCategoryList,
    List<FoodSet>? foodSetList,
    Map<String, List<Food>>? groupedFood,
    Map<Food, int>? order,
    double? subtotal,
  }) {
    return FoodSuccess(
      foodList: foodList ?? this.foodList,
      foodCategoryList: foodCategoryList ?? this.foodCategoryList,
      foodSetList: foodSetList ?? this.foodSetList,
      groupedFood: groupedFood ?? this.groupedFood,
      order: order ?? this.order,
      subtotal: subtotal ?? this.subtotal,
    );
  }

  @override
  List<Object> get props => [
        foodList,
        foodCategoryList,
        foodSetList,
        groupedFood,
        order,
        subtotal,
      ];
}
class FoodError extends MenuState {
  final String message;

  const FoodError({required this.message});

  @override
  List<Object> get props => [message];
}
