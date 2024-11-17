import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/login'); // Navigate to the login screen
    });

    return Scaffold(
      body: Container(
        color: Colors.black, // Set background color to black for the "After Hours" theme
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Display the lamp post image
              Image.asset(
                'Images/LampPost.jpg',
                height: 250, // Increase the height to make the image larger
                width: 250, // Set width (optional, can maintain aspect ratio)
              ),
              SizedBox(height: 20), // Add spacing
              // Display the welcome text
              Text(
                'Welcome to LightsOut After Hours',
                style: TextStyle(
                  color: Colors.white, // White text for better contrast
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
