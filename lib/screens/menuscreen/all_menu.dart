import 'package:flutter/material.dart';
import 'package:flutter_application_1/blocs/menu_bloc.dart';
import 'package:flutter_application_1/screens/menuscreen/foodcategory_grid.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/menu_item.dart';


class AllMenu extends StatefulWidget {
  final Function(Food) onFoodSelected;
  final Function(String) onSetIdSelected;

  const AllMenu(
      {super.key, required this.onFoodSelected, required this.onSetIdSelected});

  @override
  State<AllMenu> createState() => _AllMenuState();
}

class _AllMenuState extends State<AllMenu> with SingleTickerProviderStateMixin {
  List<String> selectedFoodIds = [];
  List<Food> selectedFoodItems = [];
  int selectedIndex3 = -1;
  String selectedSetId = '';
  String selectedFoodCatId = '';
  String searchQuery = '';

  final ItemScrollController _scrollController = ItemScrollController();
  final ItemPositionsListener _itemPositionsListener =
      ItemPositionsListener.create();
  late ScrollController categoryScrollController;

  @override
  void initState() {
    super.initState();
    categoryScrollController = ScrollController();
    _itemPositionsListener.itemPositions.addListener(_onScrollPositionChanged);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final state = context.read<MenuBloc>().state;
      if (state is FoodSuccess) {
        setState(() {
          selectedSetId = state.foodSetList.isNotEmpty
              ? state.foodSetList.first.foodSetId.toString()
              : '';
        });
        context.read<MenuBloc>().add(FetchFoodDataEvent(
              selectedSetId: selectedSetId,
              searchQuery: searchQuery,
            ));
      }
    });
  }

  @override
  void dispose() {
    _itemPositionsListener.itemPositions
        .removeListener(_onScrollPositionChanged);
    categoryScrollController.dispose();
    super.dispose();
  }

  void _onScrollPositionChanged() {
    final itemPositions = _itemPositionsListener.itemPositions.value;

    if (itemPositions.isEmpty) return;

    final firstVisibleItem = itemPositions.first;

    if (firstVisibleItem.index < 0) return;

    final state = context.read<MenuBloc>().state;
    if (state is FoodSuccess) {
      final categoryNames = state.groupedFood.keys.toList();
      final visibleCategoryName = categoryNames[firstVisibleItem.index];

      if (selectedFoodCatId != visibleCategoryName) {
        setState(() {
          selectedFoodCatId = visibleCategoryName;
        });
      }
    }
  }

  void _scrollToCategory(String categoryName) async {
    final state = context.read<MenuBloc>().state;
    if (state is FoodSuccess) {
      final categoryNames = state.groupedFood.keys.toList();
      final targetIndex = categoryNames.indexOf(categoryName);
      final currentIndex =
          _itemPositionsListener.itemPositions.value.first.index;

      if (targetIndex != -1) {
        final step = (targetIndex > currentIndex) ? 1 : -1;
        for (int i = currentIndex; i != targetIndex; i += step) {
          await _scrollController.scrollTo(
            index: i + step,
            duration: const Duration(milliseconds: 100),
          );
        }
      }
    }
  }

  void onFoodTap(Food food) {
    final foodId = food.foodId.toString();

    setState(() {
      if (food.isOutStock == false) {
        selectedFoodIds.add(foodId);
        selectedFoodItems.add(food);
        widget.onFoodSelected(food);
        selectedIndex3 = selectedFoodIds.indexOf(foodId);
        print('add');
      } else {
        print('Out of Stock');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<MenuBloc>().state;

    if (state is FoodLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state is FoodError) {
      return Center(child: Text('Error: ${state.message}'));
    }

    if (state is FoodSuccess) {
      final foodCategories = state.groupedFood;
      double screenHeight = MediaQuery.of(context).size.height;
      double screenWidth = MediaQuery.of(context).size.width;
      double totalSize = (screenHeight + screenWidth) * 0.1;

      return Column(
        children: [
          Container(
            margin:
                EdgeInsets.fromLTRB(totalSize * 0.1, totalSize * 0.07, 0, 0),
            height: totalSize * 0.2,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.foodSetList.length,
              itemBuilder: (context, index) {
                final foodSet = state.foodSetList[index];

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedSetId = foodSet.foodSetId.toString();
                      widget.onSetIdSelected(selectedSetId);
                      context.read<MenuBloc>().add(FetchFoodDataEvent(
                            selectedSetId: selectedSetId,
                            searchQuery: searchQuery,
                          ));
                      print(foodSet.foodSetName.toString());
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: totalSize * 0.05),
                    padding:
                        EdgeInsets.symmetric(horizontal: totalSize * 0.15),
                    decoration: BoxDecoration(
                      color: selectedSetId == foodSet.foodSetId.toString()
                          ? const Color(0xFF02CCFE)
                          : const Color(0xFFF6F6F6),
                      border: Border.all(
                          color: selectedSetId == foodSet.foodSetId.toString()
                              ? Colors.black
                              : Colors.transparent,
                          width: 0.5),
                      borderRadius: BorderRadius.circular(15)
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      foodSet.foodSetName.toString(),
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 24,
                        fontWeight:
                            selectedSetId == foodSet.foodSetId.toString()
                                ? FontWeight.w400
                                : FontWeight.w700,
                        color: selectedSetId == foodSet.foodSetId.toString()
                            ? Colors.white
                            : const Color(0xFF949494),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            margin:
                EdgeInsets.fromLTRB(totalSize * 0.1, totalSize * 0.07, 0, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xFFF6F6F6),
            ),
            height: totalSize * 0.2,
            child: ListView.builder(
              controller: categoryScrollController,
              scrollDirection: Axis.horizontal,
              itemCount: foodCategories.length,
              itemBuilder: (context, index) {
                final foodCategory = foodCategories.keys.elementAt(index);

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedFoodCatId = foodCategory;
                      _scrollToCategory(foodCategory);
                    });
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: totalSize * 0.13),
                    decoration: BoxDecoration(
                      color: selectedFoodCatId == foodCategory
                          ? const Color(0xFF02CCFE)
                          : const Color(0xFFF6F6F6),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      foodCategory,
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 18,
                        fontWeight: selectedFoodCatId == foodCategory
                            ? FontWeight.w400
                            : FontWeight.w600,
                        color: selectedFoodCatId == foodCategory
                            ? Colors.white
                            : const Color(0xFF4F4F4F),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
              child: FoodCategoryGrid (
            foodCategories : foodCategories,
            onFoodTap: onFoodTap,
            totalSize: totalSize,
            scrollController: _scrollController,
            itemPositionsListener: _itemPositionsListener,
          )),
        ],
      );
    }

    return const SizedBox();
  }
}
