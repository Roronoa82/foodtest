part of 'menu_bloc.dart';

abstract class MenuEvent extends Equatable {
  const MenuEvent();

  @override
  List<Object?> get props => [];
}

class FetchFoodDataEvent extends MenuEvent {
  final String selectedSetId;
  final String searchQuery;

  const FetchFoodDataEvent({
    required this.selectedSetId,
    required this.searchQuery,
  });

  @override
  List<Object?> get props => [selectedSetId, searchQuery];
}

class AddFoodToCart extends MenuEvent {
  final Food food;
  const AddFoodToCart(this.food);

  @override
  List<Object> get props => [food];
}

class RemoveFoodFromCart extends MenuEvent {
  final Food food;
  const RemoveFoodFromCart(this.food);

  @override
  List<Object> get props => [food];
}

class UpdateFoodQuantity extends MenuEvent {
  final Food food;
  final int quantity;
  const UpdateFoodQuantity(this.food, this.quantity);

  @override
  List<Object> get props => [food, quantity];
}

class CalculateSubtotalEvent extends MenuEvent {}