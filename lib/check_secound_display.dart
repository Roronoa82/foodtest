import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/secoundscreen/secound_screen.dart';


class OrientationSecoundPage extends StatefulWidget {
  const OrientationSecoundPage({super.key});

  @override
  State<OrientationSecoundPage> createState() => _OrientationSecoundPageState();
}

class _OrientationSecoundPageState extends State<OrientationSecoundPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) {
          return orientation == Orientation.portrait
              ? const CombinedSecondPage()
              : const CombinedSecondPage();
        },
      ),
    );
  }
}
