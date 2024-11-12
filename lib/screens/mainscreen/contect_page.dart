// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';


class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.landscape) {
          return const ContactFirstHorizon();
        } else {
          return const ContactFirstVertical();
        }
      },
    );
  }
}

class ContactFirstHorizon extends StatefulWidget {
  const ContactFirstHorizon({super.key});

  @override
  State<ContactFirstHorizon> createState() => _ContactFirstHorizonState();
}

class _ContactFirstHorizonState extends State<ContactFirstHorizon> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double totalSize = screenHeight + screenWidth;

    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return ContactBottomSheet(totalSize: totalSize);
          },
        );
      },
      child: Row(
        children: [
          Icon(
            Icons.restaurant,
            color: Colors.grey[600],
            size: 36, // 0.5 + MediaQuery.of(context).size.height * 0.02,
          ),
          SizedBox(
            width: screenWidth * 0.01,
          ),
          Text(
            'Soi Siam',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 36, //0.5 + MediaQuery.of(context).size.height * 0.02,
              fontWeight: FontWeight.bold,
              color:  Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}

class ContactFirstVertical extends StatefulWidget {
  const ContactFirstVertical({super.key});

  @override
  State<ContactFirstVertical> createState() => _ContactFirstVerticalState();
}

class _ContactFirstVerticalState extends State<ContactFirstVertical> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double totalSize = screenHeight + screenWidth;

    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return ContactBottomSheet(totalSize: totalSize);
          },
        );
      },
      child: Row(
        children: [
          Icon(
            Icons.restaurant,
            color: Colors.grey[600],
            size: 36, // 1 + totalSize * 0.02,
          ),
          SizedBox(
            width: screenWidth * 0.01,
          ),
          Text(
            'Soi Siam',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 36, //1 + MediaQuery.of(context).size.height,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}

class ContactBottomSheet extends StatelessWidget {
  final double totalSize;

  const ContactBottomSheet({super.key, required this.totalSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: totalSize * 0.12,
      color: const Color(0xFF212121),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(totalSize * 0.01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomTextStyle(label: "Contact Us"),
                      SizedBox(height: totalSize * 0.01),
                      const CustomTextStyle(
                        label: "Rattanathibech 28 Alley, Tambon Bang Kraso, Mueang Nonthaburi District, Nonthaburi 11000",
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: ContactInfoIcons(totalSize: totalSize),
                ),
              ],
            ),
          ),
          FooterSection(totalSize: totalSize),
        ],
      ),
    );
  }
}

class ContactInfoIcons extends StatelessWidget {
  final double totalSize;

  const ContactInfoIcons({super.key, required this.totalSize});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
              Icon(Icons.phone, size: totalSize * 0.02, color: Colors.white), // ใช้ Icon โดยตรง
              SizedBox(width: totalSize * 0.01),
              const Text(
                '090-890-xxxx',
                style: TextStyle(fontSize: 12, color: Colors.white),
             ),
            
          
      
        Padding(
          padding: EdgeInsets.symmetric(vertical: totalSize * 0.005),
          child: Row(
            children: [
              Icon(Icons.facebook, size: totalSize * 0.02, color: Colors.white), // ใช้ Icon โดยตรง
              SizedBox(width: totalSize * 0.01),
              Text(
                'SoiSiam',
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: totalSize * 0.005),
          child: Row(
            children: [
              Icon(Icons.message, size: totalSize * 0.02, color: Colors.white), // ใช้ Icon โดยตรง
              SizedBox(width: totalSize * 0.01),
              Text(
                'SoiSiam Chanal',
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: totalSize * 0.005),
          child: Row(
            children: [
              Icon(Icons.email, size: totalSize * 0.02, color: Colors.white), // ใช้ Icon โดยตรง
              SizedBox(width: totalSize * 0.01),
              Text(
                'SoiSiam@gmail.co.th',
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }
}


class FooterSection extends StatelessWidget {
  final double totalSize;

  const FooterSection({super.key, required this.totalSize});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '© Copyright 2022 l Powered by',
          style: TextStyle(color: Colors.white, fontSize: 18,),
        ),
        const SizedBox(width: 5),
        Image.asset(
          'assets/image/logo.png',
          height: totalSize * 0.03,
          width: totalSize * 0.03,
        ),
      ],
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
    double totalSize = screenHeight + screenWidth;
    return Text(
      label,
      style: TextStyle(fontFamily: 'Roboto',color:  Colors.white, fontSize: totalSize * 0.015),
    );
  }
}
