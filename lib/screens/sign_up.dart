import 'package:flutter/material.dart';
import 'package:sprints_project_app/screens/login.dart';
import 'package:easy_localization/easy_localization.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with TickerProviderStateMixin {
  bool hiddenPassword = true;
  bool hiddenConfirmPassword = true;
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // Animation controllers for managing fade in/out effects
  late AnimationController _fadeController;
  late AnimationController _slideController;

  // Fade and slide animations
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    // Create fade animation controller with 2.5-second duration
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 2500),
      vsync: this,
    );

    // Create slide animation controller with 2-second duration
    _slideController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    // Define fade animation from 0 to 1 (transparent to visible)
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
    );

    // Define slide animation from bottom to center
    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
          CurvedAnimation(parent: _slideController, curve: Curves.elasticOut),
        );

    // Start animations when page loads
    _fadeController.forward();
    _slideController.forward();
  }

  @override
  void dispose() {
    // Clean up controllers and fields when page is disposed
    _fadeController.dispose();
    _slideController.dispose();
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void togglePasswordVisibility() {
    setState(() {
      hiddenPassword = !hiddenPassword;
    });
  }

  void toggleConfirmPasswordVisibility() {
    setState(() {
      hiddenConfirmPassword = !hiddenConfirmPassword;
    });
  }

  void _handleSignUp() async {
    if (_formKey.currentState!.validate()) {
      // Show successful account creation message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('account_created'.tr()),
          backgroundColor: Colors.green,
        ),
      );

      // Play fade out animation before returning to login page
      await _fadeController.reverse();

      if (mounted) {
        // Return to login page with transition effect
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 100),
            pageBuilder: (context, animation, secondaryAnimation) =>
                const Login(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2196F3),
        centerTitle: true,
        title:
            // Apply fade animation to page title
            FadeTransition(
              opacity: _fadeAnimation,
              child: Text(
                'sign_up'.tr(),
                style: const TextStyle(
                  fontFamily: 'Suwannaphum',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
      ),
      body: Directionality(
        textDirection: Directionality.of(context),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child:
                // Apply fade animation to entire page content
                FadeTransition(
                  opacity: _fadeAnimation,
                  child:
                      // Apply slide animation to content
                      SlideTransition(
                        position: _slideAnimation,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(height: 50),

                            // Create account text with scaling effect
                            AnimatedBuilder(
                              animation: _fadeController,
                              builder: (context, child) {
                                return Transform.scale(
                                  scale: _fadeAnimation.value,
                                  child: Text(
                                    'create_account'.tr(),
                                    style: const TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                );
                              },
                            ),

                            const SizedBox(height: 10),

                            // Subtitle with fade animation
                            FadeTransition(
                              opacity: _fadeAnimation,
                              child: Text(
                                'please_fill_details'.tr(),
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ),

                            const SizedBox(height: 60),

                            // Full name field
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: TextFormField(
                                controller: fullNameController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'please_enter_name'.tr();
                                  } else if (value.length < 2) {
                                    return 'name_min_length'.tr();
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  labelText: 'full_name'.tr(),
                                  suffixIcon: const Icon(
                                    Icons.person,
                                    color: Colors.blue,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                            ),

                            // Email field
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: TextFormField(
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'please_enter_email'.tr();
                                  } else if (!RegExp(
                                    r'^[^@]+@[^@]+\.[^@]+',
                                  ).hasMatch(value)) {
                                    return 'invalid_email'.tr();
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  labelText: 'email'.tr(),
                                  suffixIcon: const Icon(
                                    Icons.email,
                                    color: Colors.blue,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                            ),

                            // Password field
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: TextFormField(
                                controller: passwordController,
                                obscureText: hiddenPassword,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'please_enter_password'.tr();
                                  } else if (value.length < 6) {
                                    return 'password_min_length'.tr();
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  labelText: 'password'.tr(),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      hiddenPassword
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                    onPressed: togglePasswordVisibility,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                            ),

                            // Confirm password field
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: TextFormField(
                                controller: confirmPasswordController,
                                obscureText: hiddenConfirmPassword,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'please_confirm_password'.tr();
                                  } else if (value != passwordController.text) {
                                    return 'passwords_not_match'.tr();
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  labelText: 'confirm_password'.tr(),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      hiddenConfirmPassword
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                    onPressed: toggleConfirmPasswordVisibility,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 40),

                            // Create account button
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF2196F3),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 100,
                                  vertical: 15,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: _handleSignUp,
                              child: Text(
                                'sign_up'.tr(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Suwannaphum',
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            const SizedBox(height: 20),

                            // Login link
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'already_have_account'.tr(),
                                  style: const TextStyle(
                                    color: Color(0xFF757575),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () async {
                                    await _fadeController.reverse();
                                    if (mounted) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const Login(),
                                        ),
                                      );
                                    }
                                  },
                                  child: Text(
                                    'login'.tr(),
                                    style: const TextStyle(
                                      color: Color(0xFF2196F3),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                ),
          ),
        ),
      ),
    );
  }
}
