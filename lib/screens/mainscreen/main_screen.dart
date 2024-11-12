import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/secoundscreen/secound_screen.dart';
import '../../blocs/menu_bloc.dart';
import '../../blocs/setting_food.dart';
import '../menuscreen/menu_screen.dart';
import 'contect_page.dart';

class SelfServiceScreen extends StatefulWidget {
  const SelfServiceScreen({super.key});

  @override
  State<SelfServiceScreen> createState() => _SelfServiceScreenState();
}

class _SelfServiceScreenState extends State<SelfServiceScreen> {
  late MenuRepository menuRepository;
  late MenuBloc foodBloc;

  @override
  void initState() {
    super.initState();
    menuRepository = MenuRepository();
    foodBloc = MenuBloc(menuRepository);
  }

  @override
  void dispose() {
    foodBloc.close(); // ปิด FoodBloc เมื่อไม่ใช้งาน
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double totalSize = screenHeight + screenWidth;
    double fontSize = totalSize * 0.1;
    double screenAdjusted = screenHeight + (screenWidth * 0.3 - screenHeight);
    double fontSize1 = screenAdjusted * 2;

    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              // Background Stack
              Positioned.fill(
                child: Stack(
                  children: [
                    Align(
                      alignment: isLandscape ? Alignment.centerRight : Alignment.bottomCenter,
                      child: Stack(
                        children: [
                          Image.asset(
                            'assets/image/gif.gif',
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            top: totalSize * 0.1,
                            bottom: 0,
                            right: 50,
                            left: 0,
                            child: Container(
                              color: Colors.transparent,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.restaurant,
                                      color: Colors.white,
                                      size: 1 + fontSize1 * (isLandscape ? 0.035 : 0.06),
                                    ),
                                    Text(
                                      'Soi Siam\nRestaurant',
                                      style: TextStyle(
                                        fontFamily: 'Rasa',
                                        fontSize: 1 + fontSize1 * (isLandscape ? 0.035 : 0.06),
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Content Stack
              Positioned.fill(
                child: Stack(
                  children: [
                    if (isLandscape)
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Image.asset(
                          'assets/image/BG3.png',
                          fit: BoxFit.fill,
                        ),
                      )
                    else
                      Positioned(
                        top: -50,
                        right: 0,
                        child: SizedBox(
                          height: screenHeight * 0.55,
                          child: Image.asset(
                            'assets/image/BG1.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Padding(
      padding: EdgeInsets.symmetric(horizontal: totalSize * 0.05), // เพิ่ม padding ทั้งสองด้าน
      child: Column(
        crossAxisAlignment: isLandscape ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: totalSize * (isLandscape ? 0.11 : 0.11)),
            child: Text(
              'Self-Service\nExperience.',
              style: TextStyle(
                fontFamily: 'Rasa',
                fontSize: totalSize * (isLandscape ? 0.041 : 0.041),
                fontWeight: FontWeight.bold,
                 height: 1.23,
              ),
            ),
          ),
          SizedBox(height: totalSize * (isLandscape ? 0.005 : 0.01)),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'From self-order and self-checkout',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: totalSize * (isLandscape ? 0.01 : 0.011),
                color: const Color(0xFF7D7D7D),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: totalSize * (isLandscape ? 0.002 : 0.0035)),
          Row(
            mainAxisAlignment: isLandscape ? MainAxisAlignment.start : MainAxisAlignment.center,
            children: [
              SizedBox(width: totalSize * 0.01),
              const Icon(
                Icons.credit_card,
                color: Color(0xffEB5757),
                size: 38,
              ),
              SizedBox(width: totalSize * 0.005),
              Text(
                'Accept only Credit Card',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: totalSize * (isLandscape ? 0.01 : 0.0115),
                  color: const Color(0xFFEB5757),
                  fontWeight: FontWeight.w900,
                  decoration: TextDecoration.underline,
                  decorationColor: const Color(0xFFEB5757),
                ),
              ),
            ],
          ),
          SizedBox(height: totalSize * 0.02),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MenuPage()),
              );
            },
            child: Container(
              height: totalSize * 0.044,
              width: totalSize * 0.15,
              decoration: BoxDecoration(
                color: const Color(0xFF496EE2),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Text(
                  'Tap to Order',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: totalSize * 0.012,
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
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: fontSize * 0.2,
                        vertical: fontSize * 0.2,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          isLandscape ? const ContactFirstHorizon() : const ContactPage(),
                          InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (context, animation1, animation2) => const CombinedSecondPage(),
                                  transitionDuration: const Duration(seconds: 0),
                                  maintainState: false,
                                ),
                              );
                            },
                            child: SizedBox(
                              height: 2 + fontSize * 0.13,
                              width: 2 + fontSize * 0.13,
                              //child: ClipOval(
                                child: Image.asset(
                                  'assets/image/usaflag.png',
                                  fit: BoxFit.cover,
                                ),
                            //  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
