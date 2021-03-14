import 'package:flutter/material.dart';
import 'package:places/ui/screen/onboarding_screen.dart';

/// Стартовый экран приложения
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _isInitialized;

  @override
  void initState() {
    print('initState - stated.');
    super.initState();
    _navigateToNext();
    print('initState - finished.');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.yellow,
              Colors.green,
            ],
          ),
        ),
        child: Center(
          child: Container(
            width: 160,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Center(
              child: Image.asset(
                'res/Map Full.png',
                width: 80,
                color: Colors.green,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToNext() {
    print('_navigateToNext - stated.');
    _isInitialized = Future<void>.delayed(Duration(seconds: 2), () {
      print(
          'Время показа SplashScreen (2 секунды) истекло. Переход на следующий экран.');
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => OnboardingScreen()));
    });
    print('_navigateToNext - finished.');
  }
}
