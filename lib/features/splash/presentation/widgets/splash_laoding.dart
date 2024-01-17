import 'package:flutter/material.dart';

class SplashLoading extends StatelessWidget {
  const SplashLoading({required this.message, super.key});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        const SizedBox.square(
          dimension: 60,
          child: Stack(alignment: Alignment.center, children: [
            Icon(
              Icons.account_circle,
              size: 50,
              color: Colors.white,
            ),
            SizedBox.square(
              dimension: 60,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.white),
              ),
            ),
          ]),
        ),
        const SizedBox(width: 20),
        Text(message, style: const TextStyle(color: Colors.white))
      ]),
    );
  }
}
