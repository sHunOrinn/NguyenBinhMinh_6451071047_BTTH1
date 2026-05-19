import 'dart:async';
import 'package:flutter/material.dart';
import '../../features/login/screens/login_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const OnboardingView(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0140),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/icons/app_icon.png',
              width: 60,
              height: 60,
            ),
            const SizedBox(height: 14),
            const Text(
              'Jobspot',
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Align(
                alignment: Alignment.topRight,
                child: Text(
                  'Jobspot',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                  )
                ),
              ),

              const SizedBox(height: 60),

              Center(
                child: Image.asset(
                  'assets/images/splash.png',
                  width: 301,
                  height: 311,
                ),
              ),

              const Spacer(),

              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Find Your\n',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                      )
                    ),

                    TextSpan(
                      text: 'Dream Job\n',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFCA34D),
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xFFFCA34D),
                        decorationThickness: 2,
                      )
                    ),

                    TextSpan(
                      text: 'Here!',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        height: 1.05,
                      ),
                    ),
                  ]
                )
              ),

              const SizedBox(height: 18),

              const Text(
                'Explore all the most exciting job roles based\n'
                    'on your interest and study major.',
                style: TextStyle(
                  color: Color(0xFF524B6B),
                  fontSize: 14,
                  height: 1.45,
                  fontWeight: FontWeight.w400,
                ),
              ),


              const SizedBox(height: 28),

              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginView(),
                      ),
                    );
                  },
                  child: Container(
                    width: 58,
                    height: 58,
                    decoration: const BoxDecoration(
                      color: Color(0xFF1B0066),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 12),

            ],
          ),
        ),
      ),
    );
  }
}