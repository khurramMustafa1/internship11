import 'package:flutter/material.dart';
class ExitAppScreen extends StatelessWidget {
  const ExitAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF339D44), // Green background
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          width: 280,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Exit App?',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Press back again\nif you want to exit the app',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Green Button
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF339D44),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                    ),
                    child: const Text('Button'),
                  ),
                  const SizedBox(width: 15),
                  // Grey Button
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFEFEFEF),
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                    ),
                    child: const Text('Button'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
