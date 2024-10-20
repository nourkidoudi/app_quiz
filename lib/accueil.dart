import 'package:flutter/material.dart';

class Acceuil extends StatelessWidget {
  const Acceuil({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFFEC6DB1),
      child: Column(
        children: [
          const SizedBox(height: 100),
          Text(
            "Bienvenue !",
            style: TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF910550)),
                
          ),
          Image.asset('assets/img/Quiz11.jpg'),
          TextButton(
  onPressed: () {
    Navigator.pushNamed(context, '/homepage');
  },
  style: TextButton.styleFrom(
    padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0), // Increases size
    foregroundColor: Colors.white, // Text color
    backgroundColor: const Color(0xFF910550),   // Button color
    textStyle: const TextStyle(fontSize: 18.0), // Text size
  ),
  child: const Text('Enter'),
)

        ],
      ),
    );
  }
}
