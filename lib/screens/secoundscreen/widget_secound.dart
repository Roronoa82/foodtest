import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/menuscreen/menu_screen.dart';


class WidgetSecondPage extends StatefulWidget {
  final double height;
  final double width;
  final double heighttext;
  final double bottom1;
  final double bottom2;
  final double font;

  const WidgetSecondPage({
    super.key,
    required this.height,
    required this.width,
    required this.bottom1,
    required this.bottom2,
    required this.font,
    required this.heighttext,
  });

  @override
  State<WidgetSecondPage> createState() => _WidgetSecondPageState();
}

class _WidgetSecondPageState extends State<WidgetSecondPage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double totalSize = screenHeight + screenWidth;
    double screenAdjusted = screenHeight + (screenWidth * 0.3 - screenHeight);
    double fontSize1 = screenAdjusted * 2;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MenuPage()),
                );
              },
              child: Stack(
                children: [
                  Container(
                    height: widget.height,
                    width: widget.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.transparent,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5,
                          offset: Offset(1, 5),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: widget.bottom1,
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(5)),
                      child: Image.asset(
                        'assets/image/ani_to_stay.gif',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: widget.heighttext,
                      width: widget.width,
                      decoration: const BoxDecoration(
                          color: Color(0xFF496EE2),
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(5))),
                      child: Center(
                        child: Text(
                          'To Stay',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 1 + fontSize1 * widget.font,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          width: totalSize * 0.01,
        ),
        Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MenuPage()),
                );
              },
              child: Stack(
                children: [
                  Container(
                    height: widget.height,
                    width: widget.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.transparent,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5,
                          offset: Offset(1, 5),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 0,
                    bottom: widget.bottom2,
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(5)),
                      child: Image.asset(
                        'assets/image/ani_welcome_3.gif',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: widget.heighttext,
                      width: widget.width,
                      decoration: const BoxDecoration(
                          color: Color(0xFFFAA21C),
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(5))),
                      child: Center(
                        child: Text(
                          'Togo Walk-in',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 1 + fontSize1 * widget.font,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
