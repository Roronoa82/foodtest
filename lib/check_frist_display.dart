import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/mainscreen/main_screen.dart';

class OrientationFirstPage extends StatefulWidget {
  const OrientationFirstPage({super.key});

  @override
  State<OrientationFirstPage> createState() => _OrientationFirstPageState();
}

class _OrientationFirstPageState extends State<OrientationFirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) {
          return orientation == Orientation.portrait
              ? const FirstPage()
              : const FirstPage();
        },
      ),
    );
  }
}
