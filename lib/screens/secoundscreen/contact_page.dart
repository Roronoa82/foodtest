import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          // แสดง ContactSecondVertical สำหรับโหมดแนวตั้ง
          return ContactSecondVertical();
        } else {
          // แสดง ContactSecondHorizon สำหรับโหมดแนวนอน
          return ContactSecondHorizon();
        }
      },
    );
  }
}

class ContactSecondHorizon extends StatefulWidget {
  const ContactSecondHorizon({super.key});

  @override
  State<ContactSecondHorizon> createState() => _ContactSecondHorizonState();
}

class _ContactSecondHorizonState extends State<ContactSecondHorizon> {
  @override
  Widget build(BuildContext context) {
  double screenHeight = MediaQuery.of(context).size.height;
  double screenWidth = MediaQuery.of(context).size.width;
  // คำนวณค่าต่างๆ ที่เกี่ยวกับขนาดหน้าจอ
  double totalSize = screenHeight + screenWidth;
  double screenAdjusted = screenHeight + (screenWidth * 0.3 - screenHeight);
  // การคำนวณขนาดฟอนต์ตามขนาดหน้าจอ
  double fontSize1 = screenAdjusted * 2;
  double fontSize2 = screenAdjusted * 5;
  double fontSize3 = screenAdjusted * 0.1;
    return Container(
      height: totalSize * 0.12,
      color: const Color(0xFF212121),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(fontSize2 * 0.02 * 1,
                    fontSize2 * 0.015 * 2, fontSize2 * 0.02 * 1, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 6,
                      child: Column(
                        children: [
                          SizedBox(
                            width: screenWidth * 0.4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const CustomTextStyle(
                                  label: "Contact Us",
                                ),
                                SizedBox(
                                  height: 1 + fontSize1 * 0.015,
                                ),
                                const CustomTextStyle(
                                  label:
                                      "Rattanathibech 28 Alley, Tambon Bang Kraso, Mueang Nonthaburi District, Nonthaburi 11000",
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                              height: fontSize3 * 1,
                              width: fontSize3 * 10,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.phone, color: Colors.white),
                                  SizedBox(
                                    width: fontSize3 * 1,
                                  ),
                                  Text(
                                    "090-890-xxxx",
                                    style: TextStyle(
                                        fontSize: 1 + fontSize1 * 0.02,
                                        color: Colors.white),
                                    softWrap: true,
                                    maxLines: null,
                                  ),
                                ],
                              )),
                          SizedBox(
                            height: fontSize3 * 0.2,
                          ),
                          SizedBox(
                              height: fontSize3 * 1,
                              width: fontSize3 * 10,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.facebook, color: Colors.white),
                                  SizedBox(
                                    width: fontSize3 * 1,
                                  ),
                                  Text(
                                    "SoiSiam",
                                    style: TextStyle(
                                        fontSize: 1 + fontSize1 * 0.02,
                                        color: Colors.white),
                                    softWrap: true,
                                    maxLines: null,
                                  ),
                                ],
                              )),
                          SizedBox(
                            height: fontSize3 * 0.2,
                          ),
                          SizedBox(
                              height: fontSize3 * 1,
                              width: fontSize3 * 10,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.message, color: Colors.white),
                                  SizedBox(
                                    width: fontSize3 * 1,
                                  ),
                                  Text(
                                    "SoiSiam Chanal",
                                    style: TextStyle(
                                        fontSize: 1 + fontSize1 * 0.02,
                                        color: Colors.white),
                                    softWrap: true,
                                    maxLines: null,
                                  ),
                                ],
                              )),
                          SizedBox(
                            height: fontSize3 * 0.2,
                          ),
                          SizedBox(
                              height: fontSize3 * 1,
                              width: fontSize3 * 10,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.email, color: Colors.white),
                                  SizedBox(
                                    width: fontSize3 * 1,
                                  ),
                                  Text(
                                    "SoiSiam@gmail.co.th",
                                    style: TextStyle(
                                        fontSize: 1 + fontSize1 * 0.02,
                                        color: Colors.white),
                                    softWrap: true,
                                    maxLines: null,
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      '© Copyright 2022 l Powered by',
                      style: TextStyle(
                          color: Colors.white, fontSize: 1 + fontSize1 * 0.015),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Image.asset(
                    'assets/image/logo.png',
                    height: 10 + fontSize1 * 0.025,
                    width: 10 + fontSize1 * 0.025,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class ContactSecondVertical extends StatefulWidget {
  const ContactSecondVertical({super.key});

  @override
  State<ContactSecondVertical> createState() => _ContactSecondVerticalState();
}

class _ContactSecondVerticalState extends State<ContactSecondVertical> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double plusscreen2 = screenHeight + (screenWidth * 0.3 - screenHeight);
    double totalSize = screenHeight + screenWidth;
    double fontPlus4 = plusscreen2 * 0.1;

    double fontPlus2 = plusscreen2 * 2;
    double fontPlus3 = plusscreen2 * 5;
    return Container(
      height: totalSize * 0.12,
      color: const Color(0xFF212121),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(fontPlus3 * 0.02 * 1,
                    fontPlus3 * 0.02 * 2, fontPlus3 * 0.02 * 1, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomTextStyle(
                            label: "Contact Us",
                          ),
                          SizedBox(
                            height: 1 + fontPlus2 * 0.015,
                          ),
                          const CustomTextStyle(
                            label:
                                "Rattanathibech 28 Alley, Tambon Bang Kraso, Mueang Nonthaburi District, Nonthaburi 11000",
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                              height: fontPlus4 * 1,
                              width: fontPlus4 * 10,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.phone, color: Colors.white),
                                  SizedBox(
                                    width: fontPlus4 * 1,
                                  ),                                 
                                  SizedBox(
                                    width: fontPlus4 * 1,
                                  ),
                                  Text(
                                    "090-890-xxxx",
                                    style: TextStyle(
                                        fontSize: 1 + fontPlus2 * 0.02,
                                        color: Colors.white),
                                    softWrap: true,
                                    maxLines: null,
                                  ),
                                ],
                              )),
                          SizedBox(
                            height: fontPlus4 * 0.2,
                          ),
                          SizedBox(
                              height: fontPlus4 * 1,
                              width: fontPlus4 * 10,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.facebook, color: Colors.white),
                                  SizedBox(
                                    width: fontPlus4 * 1,
                                  ),
                                  SizedBox(
                                    width: fontPlus4 * 1,
                                  ),
                                  Text(
                                    "SoiSiam",
                                    style: TextStyle(
                                        fontSize: 1 + fontPlus2 * 0.02,
                                        color: Colors.white),
                                    softWrap: true,
                                    maxLines: null,
                                  ),
                                ],
                              )),
                          SizedBox(
                            height: fontPlus4 * 0.2,
                          ),
                          SizedBox(
                              height: fontPlus4 * 1,
                              width: fontPlus4 * 10,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.message, color: Colors.white),
                                  SizedBox(
                                    width: fontPlus4 * 1,
                                  ),
                                  SizedBox(
                                    width: fontPlus4 * 1,
                                  ),
                                  Text(
                                    "SoiSiam Chanal",
                                    style: TextStyle(
                                        fontSize: 1 + fontPlus2 * 0.02,
                                        color: Colors.white),
                                    softWrap: true,
                                    maxLines: null,
                                  ),
                                ],
                              )),
                          SizedBox(
                            height: fontPlus4 * 0.2,
                          ),
                          SizedBox(
                              height: fontPlus4 * 1,
                              width: fontPlus4 * 10,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.email, color: Colors.white),
                                  SizedBox(
                                    width: fontPlus4 * 1,
                                  ),
                                  SizedBox(
                                    width: fontPlus4 * 1,
                                  ),
                                  Text(
                                    "SoiSiam@gmail.co.th",
                                    style: TextStyle(
                                        fontSize: 1 + fontPlus2 * 0.02,
                                        color: Colors.white),
                                    softWrap: true,
                                    maxLines: null,
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 3 + fontPlus2 * 0.07,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      '© Copyright 2022 l Powered by',
                      style: TextStyle(
                          color: Colors.white, fontSize: 1 + fontPlus2 * 0.03),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Image.asset(
                    'assets/image/logo.png',
                    height: 10 + fontPlus2 * 0.05,
                    width: 10 + fontPlus2 * 0.05,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextStyle extends StatelessWidget {
  final String label;

  const CustomTextStyle({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double plusscreen2 = screenHeight + (screenWidth * 0.3 - screenHeight);
    double fontPlus2 = plusscreen2 * 2;
    return Text(
      label,
      style: TextStyle(fontFamily: 'Roboto',
          color: Colors.white, fontSize: 1 + fontPlus2 * 0.02),
    );
  }
}


