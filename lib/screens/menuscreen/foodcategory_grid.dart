import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/menu_item.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';


class FoodCategoryGrid  extends StatelessWidget {
  final Map<String, List<Food>> foodCategories;
  final void Function(Food food) onFoodTap;
  final double totalSize;
  final ItemScrollController _scrollController;
  final ItemPositionsListener _itemPositionsListener;

   FoodCategoryGrid ({
    super.key,
    required this.foodCategories,
    required this.onFoodTap,
    required this.totalSize,
    required ItemScrollController scrollController,
    required ItemPositionsListener itemPositionsListener,
  })  : _scrollController = scrollController,
        _itemPositionsListener = itemPositionsListener;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return OrientationBuilder(
      builder: (context, orientation) {
        return ResponsiveSizer(
          builder: (context, orientation, screenType) {
            return ScrollablePositionedList.builder(
              itemScrollController: _scrollController,
              itemPositionsListener: _itemPositionsListener,
              itemCount: foodCategories.length,
              itemBuilder: (context, index) {
                final foodCatName = foodCategories.keys.elementAt(index);
                final foodItems = foodCategories[foodCatName]!;
                bool isLastItem = index == foodCategories.length - 1;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          totalSize * 0.2, totalSize * 0.15, 0, 10),
                      child: Text(
                        foodCatName,
                        style: TextStyle(
                                fontFamily: 'Roboto',
                          fontSize: 36, //totalSize * 0.13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(totalSize * 0.1,
                          totalSize * 0.04, 0, totalSize * 0.17),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: orientation == Orientation.landscape ? 4 : 2,
                          childAspectRatio: (orientation == Orientation.landscape
                              ? screenWidth * 0.22
                              : screenWidth * 0.35) /
                            (orientation == Orientation.landscape
                              ? screenHeight * 0.41
                              : screenHeight * 0.20),
                          mainAxisSpacing: screenHeight * 0.02,
                          crossAxisSpacing: screenWidth * 0.01,
                        ),
                        itemCount: foodItems.length,
                        itemBuilder: (context, index) {
                          final food = foodItems[index];

                          return Container(
                            margin: EdgeInsets.fromLTRB(
                                0, 0, totalSize * 0.01, totalSize * 0.0),
                            child: GestureDetector(
                              onTap: () => onFoodTap(food),
                              child: Stack(
                                children: [
                                  // Positioned(
                                  //   left: 0,
                                  //   right: 0,
                                  //   child: Container(
                                  //     height: orientation == Orientation.landscape
                                  //     ? screenHeight * 0.30
                                  //     : screenHeight * 0.21,
                                  //     width: orientation == Orientation.landscape
                                  //       ? screenWidth * 0.22
                                  //       : screenWidth * 0.45,
                                  //     decoration: BoxDecoration(
                                  //       color: Colors.white,
                                  //       borderRadius: BorderRadius.circular(5),
                                  //     ),
                                  //   ),
                                  // ),
                                  Positioned(
                                    left: 0,
                                    right: 0,
                                    top: 0,
                                    child: Container(
                                      height: (orientation == Orientation.landscape
                                                  ? screenHeight * 0.35
                                                  : screenHeight * 0.24) -
                                      (screenHeight * 0.11),
                                      width: orientation == Orientation.landscape
                                              ? screenWidth * 0.22
                                              : screenWidth * 0.45,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            const BorderRadius.vertical(
                                                top: Radius.circular(5)),
                                        image: food.imageName != null &&
                                                food.imageName!.isNotEmpty
                                            ? DecorationImage(
                                                image: NetworkImage(
                                                    food.imageName!),
                                                fit: BoxFit.cover,
                                              )
                                            : const DecorationImage(
                                                image: AssetImage(
                                                    'assets/image/outofstock.jpg'),
                                                fit: BoxFit.cover,
                                              ),
                                      ),
                                    ),
                                  ),
                                  if (food.isOutStock == true)
                                    Positioned(
                                      left: 0,
                                      right: 0,
                                      top: 0,
                                      child: Opacity(
                                        opacity: 0.7,
                                        child: Container(
                                          height: (orientation == Orientation.landscape
                                                  ? screenHeight * 0.35
                                                  :screenHeight * 0.24) -
                                             (screenHeight * 0.11),
                                          width: orientation == Orientation.landscape
                                              ? screenWidth * 0.22
                                              : screenWidth * 0.45,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.vertical(
                                                    top: Radius.circular(5)),
                                            color: Colors.grey[300],
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Out of Stock',
                                              style: TextStyle(
                                fontFamily: 'Roboto',
                                                fontSize: 32,//totalSize * 1.3,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ), 
                                  Positioned(
                                    left: 0,
                                    right: 0,
                                    bottom: 0,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: totalSize * 0.1,
                                          horizontal: totalSize * 0.06),
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.vertical(
                                            bottom: Radius.circular(15)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey,
                                            blurRadius: 2,
                                            offset: Offset(0, 4),
                                          ),
                                        ],
                                      ),
                                      height: orientation == Orientation.landscape
                                              ? screenHeight* 0.15
                                              : screenHeight* 0.08,
                                      width: orientation == Orientation.landscape
                                              ? screenWidth * 0.22
                                              : screenWidth * 0.45,
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            top: 0,
                                            child: Text(
                                              food.foodName ?? 'No Name',
                                              style: TextStyle(
                                fontFamily: 'Roboto',
                                                color: Colors.black,
                                                fontSize: 16,//totalSize * 0.2,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            top: 30,//totalSize * 0.03,
                                            child: Text(
                                              food.foodDesc!,
                                              style: TextStyle(
                                fontFamily: 'Roboto',
                                                color: Colors.grey[700],
                                                fontSize: 12,//totalSize * 0.2,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 0,
                                            child: Text(
  food.isOutStock == null || food.isOutStock == false
      ? '\$${food.foodPrice}'
      : 'Out of Stock',
  style: TextStyle(
    fontFamily: 'Roboto',
    
    color: food.isOutStock == null || food.isOutStock == false
        ? Colors.black
        : Colors.red,
    decoration: food.isOutStock == null || food.isOutStock == false
        ? TextDecoration.none
        : TextDecoration.underline,
    decorationThickness: food.isOutStock == null || food.isOutStock == false
        ? 0
        : 2,
    decorationColor: food.isOutStock == null || food.isOutStock == false
        ? Colors.transparent
        : Colors.red,
    fontSize: 16,//totalSize * 0.6,
    fontWeight: FontWeight.bold,
  ),
)

                                           ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    if (isLastItem)
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.3),
                  ],
                );
              },
            );
          },
        );
      },
    );
  }
}
