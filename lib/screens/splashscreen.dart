import 'package:flutter/material.dart';
import 'package:shopping_app/screens/homescreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [_topSection(), _middleSection(), _bottomSection(context)],
      ),
    );
  }
}

Widget _topSection() {
  return Text(
    'Healthy Living',
    style: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 27,
      fontFamily: 'San Francisco',
    ),
  );
}

Widget _middleSection() {
  return Container(
    padding: EdgeInsets.all(16.0),
    child: Center(
      child: Image.asset(
        "assets/images/splashscreenlogo.png",
        width: 200,
        height: 200,
      ),
    ),
  );
}

Widget _bottomSection(BuildContext context) {
  return ElevatedButton(
    onPressed: () => {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      ),
    },
    child: Text('Get Started'),
  );
}
