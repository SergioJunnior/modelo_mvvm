import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:modelo_mvvm/routes/routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Splash Screen'),
            ElevatedButton(
              onPressed: () {
                context.go(Routes.login);
              },
              child: const Text('Go to Home Page'),
            ),
          ],
        ),
      ),
    );
  }
}
