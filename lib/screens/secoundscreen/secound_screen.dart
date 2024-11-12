import 'package:flutter/material.dart';

import 'package:flutter_application_1/screens/secoundscreen/widget_secound.dart';
import 'package:flutter_application_1/screens/secoundscreen/contact_page.dart';
import '../mainscreen/main_screen.dart';

class CombinedSecondPage extends StatelessWidget {
  const CombinedSecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: MediaQuery.of(context).orientation == Orientation.landscape
          ? const SecondPageHorizontal()
          : const SecondPageVertical(),
    );
  }
}

class SecondPageHorizontal extends StatelessWidget {
  const SecondPageHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double totalSize = screenHeight + screenWidth;
    double fontSize = totalSize * 0.1;

    return Stack(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Image.asset(
            'assets/image/BG3.png',
            fit: BoxFit.fill,
            scale: 1.9,
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 50,),
            Expanded(
              flex: 7,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: fontSize * 0.1, horizontal: fontSize * 0.15),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.restaurant,
                          color: Color(0xFF7D7D7D),
                          size: 36,
                        ),
                        SizedBox(width: screenWidth * 0.01),
                        const Text(
                          'Soi Siam',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 36,
                            color: Color(0xFF7D7D7D),
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: totalSize * 0.025),
                  Text(
                    'Self-Service\nExperience ',
                    style: TextStyle(
                      fontFamily: 'Rasa',
                      fontSize: totalSize * 0.035,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'From self-order and self-checkout',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: totalSize * 0.01,
                      color: const Color(0xFF7D7D7D),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       const Icon(
                        Icons.credit_card,
                        color: Color(0xffEB5757),
                        size: 32,
                      ),
                      SizedBox(width: totalSize * 0.005),
                      Flexible(
                         child: Text(
                    'Accept Credit Card Only',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Color(0xffEB5757),
                          decorationThickness: 2,
                          decorationColor: Color(0xffEB5757) ,
                          fontWeight: FontWeight.w700,
                          fontSize: totalSize * 0.01,
                      fontFamily: 'Roboto',
                          ),           
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 9,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation1, animation2) =>
                                const SelfServiceScreen(),
                            transitionDuration: const Duration(seconds: 0),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            vertical: fontSize * 0.1,
                            horizontal: fontSize * 0.15),
                        height: 2 + fontSize * 0.13,
                        width: 2 + fontSize * 0.13,
                          child: Image.asset(
                            'assets/image/usaflag.png',
                            fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  WidgetSecondPage(
                    height: screenHeight * 0.4,
                    width: screenWidth * 0.25,
                    bottom1: screenHeight * 0.025,
                    bottom2: screenHeight * 0.04,
                    font: 0.025,
                    heighttext: screenHeight * 0.08,
                  ),
                ],
              ),
            ),
          ],
        ),
        const Align(
          alignment: Alignment.bottomCenter,
          child: ContactSecondHorizon(),
        ),
      ],
    );
  }
}

class SecondPageVertical extends StatelessWidget {
  const SecondPageVertical({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double totalSize = screenHeight + screenWidth;
    double fontSize = totalSize * 0.1;

    return Stack(
      children: [
        Padding(
      padding: EdgeInsets.only(top: 70),
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: fontSize * 0.2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.restaurant,
                    color: const Color(0xFF7D7D7D),
                    size: 36 ,
                  ),
                  SizedBox(width: screenWidth * 0.01),
                  const Text(
                    'Soi Siam',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize:36, 
                      color: Color(0xFF7D7D7D),
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) =>
                          const SelfServiceScreen(),
                      transitionDuration: const Duration(seconds: 0),
                    ),
                  );
                },
                child: SizedBox(
                  height: 2 + fontSize * 0.13,
                              width: 2 + fontSize * 0.13,
                 // child: ClipOval(
                    child: Image.asset(
                      'assets/image/usaflag.png',
                      
                      fit: BoxFit.cover,
                    ),
                 // ),
                ),
              ),
            ],
          ),
        ),
        ),
        Positioned(
          top: screenHeight * 0.15,
          child: Image.asset(
            'assets/image/BG2.png',
            scale: totalSize * 0.0003,
            fit: BoxFit.cover,
          ),
        ),
        Column(
          children: [
            SizedBox(height: totalSize * 0.1),
            Text(
             'Self-Service\nExperience.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Rasa',
                  fontSize: totalSize * 0.037,
                  fontWeight: FontWeight.w600,
                ),
            ),
            Text(
                'From self-order and self-checkout',
                textAlign: TextAlign.center,
                style:    
                TextStyle(
                  
                  fontSize: totalSize * 0.0115,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                  color: Colors.grey[700],
                ),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              
                   Icon(
                        Icons.credit_card,
                        color: Color(0xffEB5757),
                        size: totalSize * 0.0115,
                ),
                SizedBox(width: totalSize * 0.005),
                Flexible(
                  child: Text(
                    'Accept Credit Card Only',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Color(0xffEB5757),
                          decorationThickness: 2,
                          decorationColor: Color(0xffEB5757) ,
                          fontWeight: FontWeight.w700,
                          fontSize: totalSize * 0.0115,
                      fontFamily: 'Roboto',
                      ),           
                  ),
                ),
              ],
            ),
            SizedBox(height: totalSize * 0.03),
            WidgetSecondPage(
              height: screenHeight * 0.27,
              width: screenWidth * 0.42,
              bottom1: screenHeight * 0.045,
              bottom2: screenHeight * 0.045,
              font: 0.055,
              heighttext: screenHeight * 0.065,
            ),
            SizedBox(height: fontSize * 0.78),
           
           Align(
                alignment: Alignment.bottomCenter,
                child: ContactPage(),
              ),
          ],
        ),
      ],
    );
  }
}
