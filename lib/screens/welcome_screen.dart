// lib/screens/welcome_screen.dart - Updated with Standard Flutter Buttons
import 'package:flutter/material.dart';
import 'package:sprints_project_app/screens/login.dart';
import 'package:sprints_project_app/screens/sigin_up.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2196F3),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Shop ALI',
          style: TextStyle(
            fontFamily: 'Suwannaphum',
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Welcome Text
              const Text(
                'Welcome to Shop ALI',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF212121),
                  fontFamily: 'Suwannaphum',
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 10),

              Text(
                'Discover amazing products and great deals',
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 50),

              // Image containers row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 12,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    width: 150,
                    height: 150,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(15.0),
                    child: Image.network(
                      'https://picsum.photos/id/237/200/300',
                      width: 100,
                      height: 100,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 12,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    width: 150,
                    height: 150,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(15.0),
                    child: Image.asset(
                      'assets/pngwing.com.png',
                      width: 100,
                      height: 100,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 60),

              // Standard Flutter Buttons
              Column(
                children: [
                  // Primary Login Button (ElevatedButton)
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        print('Login button pressed');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Login(),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.login,
                        color: Colors.white,
                        size: 20,
                      ),
                      label: const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2196F3),
                        foregroundColor: Colors.white,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Secondary Sign Up Button (OutlinedButton)
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        print('Sign Up button pressed');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SiginUp(),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.person_add,
                        color: Color(0xFF2196F3),
                        size: 20,
                      ),
                      label: const Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2196F3),
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(0xFF2196F3),
                        side: const BorderSide(
                          color: Color(0xFF2196F3),
                          width: 2,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // Text Button for Guest Access
              const SizedBox(height: 20),

              Text(
                'Get started by creating an account or logging in',
                style: TextStyle(fontSize: 14, color: Colors.grey[500]),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
