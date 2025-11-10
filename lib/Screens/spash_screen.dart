import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:news_reader/Screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // dark elegant base
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 90,
              width: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(45),
                gradient: const LinearGradient(
                  colors: [Color(0xFF7F00FF), Color(0xFFE100FF)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: const Icon(
                Icons.newspaper_rounded,
                color: Colors.white,
                size: 48,
              ),
            )
                .animate()
                .fadeIn(duration: 700.ms)
                .scaleY(begin: 0.7, end: 1.0, curve: Curves.easeOutBack),

            const SizedBox(height: 24),


            Text(
              "News Reader",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            )
                .animate()
                .fadeIn(delay: 400.ms, duration: 800.ms)
                .slideY(begin: 0.5, end: 0),

            const SizedBox(height: 12),


            Text(
              "Stay informed. Stay ahead.",
              style: TextStyle(
                color: Colors.grey.shade400,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            )
                .animate()
                .fadeIn(delay: 700.ms, duration: 900.ms)
                .slideY(begin: 0.5, end: 0),

            const SizedBox(height: 60),

            // 🔹 Bottom loading indicator
            const CircularProgressIndicator(
              color: Color(0xFFE100FF),
              strokeWidth: 2,
            )
                .animate()
                .fadeIn(delay: 1000.ms)
                .scaleY(begin: 0.8, end: 1.0),
          ],
        ),
      ),
    );
  }
}
