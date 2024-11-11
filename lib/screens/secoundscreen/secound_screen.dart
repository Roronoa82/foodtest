import 'package:flutter/material.dart';
import 'package:flutter_application_1/check_frist_display.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_application_1/screens/secoundscreen/widgets/widget_secound.dart';
import 'package:flutter_application_1/screens/secoundscreen/widgets/contact_horizon.dart';
import 'package:flutter_application_1/screens/secoundscreen/widgets/contact_vertical.dart';

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
    double plusscreen = screenHeight + screenWidth;
    double fontPlus = plusscreen * 0.1;
    double fontPlus2 = (screenHeight + (screenWidth * 0.3 - screenHeight)) * 2;

    return Stack(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Image.asset(
            'assets/image/vector_backgroud3.png',
            fit: BoxFit.fill,
            scale: 1.9,
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 7,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: fontPlus * 0.1, horizontal: fontPlus * 0.15),
                    child: Row(
                      children: [
                        Icon(
                          Icons.restaurant,
                          color: const Color(0xFF7D7D7D),
                          size: 0.5 + fontPlus2 * 0.03,
                        ),
                        SizedBox(width: screenWidth * 0.01),
                        Text(
                          'Soi Siam',
                          style: GoogleFonts.roboto(
                            fontSize: 0.5 + fontPlus2 * 0.03,
                            color: const Color(0xFF7D7D7D),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: plusscreen * 0.025),
                  Text(
                    'Self-Service',
                    style: GoogleFonts.rasa(
                      fontSize: plusscreen * 0.035,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Experience.',
                    style: GoogleFonts.rasa(
                      fontSize: plusscreen * 0.035,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'From self-order and self-checkout',
                    style: GoogleFonts.roboto(
                      fontSize: plusscreen * 0.01,
                      color: const Color(0xFF7D7D7D),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipOval(
                        child: SvgPicture.asset('assets/svg/credit_card.svg',
                            height: plusscreen * 0.01,
                            width: plusscreen * 0.01),
                      ),
                      SizedBox(width: plusscreen * 0.005),
                      Flexible(
                        child: Text(
                          'Accept Credit Card only',
                          style: GoogleFonts.roboto(
                            fontSize: plusscreen * 0.01,
                            color: const Color(0xFFEB5757),
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
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
                                const OrientationFirstPage(),
                            transitionDuration: const Duration(seconds: 0),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            vertical: fontPlus * 0.1,
                            horizontal: fontPlus * 0.15),
                        height: 2 + fontPlus * 0.13,
                        width: 2 + fontPlus * 0.13,
                        child: ClipOval(
                          child: Image.asset(
                            'assets/image/usa_flag_new.png',
                            fit: BoxFit.cover,
                          ),
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
    double plusscreen = screenHeight + screenWidth;
    double fontPlus = plusscreen * 0.1;
    double fontPlus2 = (screenHeight + (screenWidth * 0.3 - screenHeight)) * 2;

    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: fontPlus * 0.2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.restaurant,
                    color: const Color(0xFF7D7D7D),
                    size: 1 + fontPlus2 * 0.05,
                  ),
                  SizedBox(width: screenWidth * 0.01),
                  Text(
                    'Soi Siam',
                    style: GoogleFonts.roboto(
                      fontSize: 1 + fontPlus2 * 0.05,
                      color: const Color(0xFF7D7D7D),
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
                          const OrientationFirstPage(),
                      transitionDuration: const Duration(seconds: 0),
                    ),
                  );
                },
                child: SizedBox(
                  height: 2 + fontPlus * 0.1,
                  width: 2 + fontPlus * 0.1,
                  child: ClipOval(
                    child: Image.asset(
                      'assets/image/usa_flag_new.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: screenHeight * 0.15,
          child: Image.asset(
            'assets/image/vector_backgroud2.png',
            scale: plusscreen * 0.0003,
            fit: BoxFit.cover,
          ),
        ),
        Column(
          children: [
            SizedBox(height: plusscreen * 0.1),
            Text(
              'Self-Service',
              style: GoogleFonts.rasa(
                fontSize: plusscreen * 0.037,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Experience.',
              style: GoogleFonts.rasa(
                fontSize: plusscreen * 0.037,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'From self-order and self-checkout',
              style: GoogleFonts.roboto(
                fontSize: plusscreen * 0.0115,
                color: const Color(0xFF7D7D7D),
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipOval(
                  child: SvgPicture.asset(
                    'assets/svg/credit_card.svg',
                    height: plusscreen * 0.0115,
                    width: plusscreen * 0.0115,
                  ),
                ),
                SizedBox(width: plusscreen * 0.005),
                Flexible(
                  child: Text(
                    'Accept Credit Card Only',
                    style: GoogleFonts.roboto(
                      fontSize: plusscreen * 0.0115,
                      color: const Color(0xFFEB5757),
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: plusscreen * 0.03),
            WidgetSecondPage(
              height: screenHeight * 0.27,
              width: screenWidth * 0.42,
              bottom1: screenHeight * 0.045,
              bottom2: screenHeight * 0.045,
              font: 0.055,
              heighttext: screenHeight * 0.065,
            ),
            SizedBox(height: fontPlus * 0.7),
            const Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ContactSecondVertical(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
