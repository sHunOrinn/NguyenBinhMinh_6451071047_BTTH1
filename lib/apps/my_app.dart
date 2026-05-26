import 'package:flutter/material.dart';
import '../router/app_router.dart';
import '../shared/screens/splash_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jobspot',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      // home: const SplashView(),
      initialRoute: AppRoutes.splash,
      routes: AppRouter.routes,
    );
  }
}