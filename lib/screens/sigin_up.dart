import 'package:flutter/material.dart';
import 'package:sprints_project_app/screens/home_screen.dart';
import 'package:sprints_project_app/screens/login.dart';

class SiginUp extends StatefulWidget {
  const SiginUp({super.key});

  @override
  State<SiginUp> createState() => _SiginUpState();
}

class _SiginUpState extends State<SiginUp> with TickerProviderStateMixin {
  bool hidenPassword = true;
  bool hidenConfirmPassword = true;
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // متحكمات الحركة والرسوم المتحركة
  // Animation controllers for managing fade in/out effects
  late AnimationController _fadeController;
  late AnimationController _slideController;

  // حركات التلاشي والانزلاق
  // Fade and slide animations
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    // إنشاء متحكم الحركة للتلاشي مع مدة ثانيتين ونصف
    // Create fade animation controller with 2.5-second duration
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 2500),
      vsync: this,
    );

    // إنشاء متحكم الحركة للانزلاق مع مدة ثانيتين
    // Create slide animation controller with 2-second duration
    _slideController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    // تعريف حركة التلاشي من 0 إلى 1 (من شفاف إلى مرئي)
    // Define fade animation from 0 to 1 (transparent to visible)
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _fadeController,
        curve: Curves.easeInOut, // منحنى سلس للظهور والاختفاء
      ),
    );

    // تعريف حركة الانزلاق من أسفل إلى الوسط
    // Define slide animation from bottom to center
    _slideAnimation =
        Tween<Offset>(
          begin: const Offset(0, 0.3), // يبدأ من الأسفل قليلاً
          end: Offset.zero, // ينتهي في المكان الطبيعي
        ).animate(
          CurvedAnimation(
            parent: _slideController,
            curve: Curves.elasticOut, // منحنى مرن للحركة
          ),
        );

    // بدء الحركات عند تحميل الصفحة
    // Start animations when page loads
    _fadeController.forward();
    _slideController.forward();
  }

  @override
  void dispose() {
    // تنظيف المتحكمات والحقول عند إغلاق الصفحة
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
      hidenPassword = !hidenPassword;
    });
  }

  void toggleConfirmPasswordVisibility() {
    setState(() {
      hidenConfirmPassword = !hidenConfirmPassword;
    });
  }

  void _handleSignUp() async {
    if (_formKey.currentState!.validate()) {
      // عرض رسالة نجح إنشاء الحساب
      // Show successful account creation message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Account created successfully!'),
          backgroundColor: Colors.green,
        ),
      );

      // تشغيل حركة التلاشي للخروج قبل العودة لصفحة تسجيل الدخول
      // Play fade out animation before returning to login page
      await _fadeController.reverse();

      if (mounted) {
        // العودة لصفحة تسجيل الدخول مع تأثير الانتقال
        // Return to login page with transition effect
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 100),
            pageBuilder: (context, animation, secondaryAnimation) =>
                const Home(),
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
            // تطبيق حركة التلاشي على عنوان الصفحة
            // Apply fade animation to page title
            FadeTransition(
              opacity: _fadeAnimation,
              child: const Text(
                'Sign Up',
                style: TextStyle(
                  fontFamily: 'Suwannaphum',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child:
              // تطبيق حركة التلاشي على محتوى الصفحة بالكامل
              // Apply fade animation to entire page content
              FadeTransition(
                opacity: _fadeAnimation,
                child:
                    // تطبيق حركة الانزلاق على المحتوى
                    // Apply slide animation to content
                    SlideTransition(
                      position: _slideAnimation,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(height: 50),

                          // نص إنشاء الحساب مع تأثير تكبير
                          // Create account text with scaling effect
                          AnimatedBuilder(
                            animation: _fadeController,
                            builder: (context, child) {
                              return Transform.scale(
                                scale: _fadeAnimation.value,
                                child: const Text(
                                  "Create Account!",
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                              );
                            },
                          ),

                          const SizedBox(height: 10),

                          // نص فرعي مع حركة تلاشي
                          // Subtitle with fade animation
                          FadeTransition(
                            opacity: _fadeAnimation,
                            child: Text(
                              "Please fill in the details to create your account",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[600],
                              ),
                            ),
                          ),

                          const SizedBox(height: 60),

                          // حقل الاسم الكامل مع حركة انزلاق من اليسار
                          // Full name field with slide animation from left
                          SlideTransition(
                            position:
                                Tween<Offset>(
                                  begin: const Offset(-1, 0), // يأتي من اليسار
                                  end: Offset.zero,
                                ).animate(
                                  CurvedAnimation(
                                    parent: _slideController,
                                    curve: const Interval(
                                      0.1,
                                      0.8,
                                      curve: Curves.elasticOut,
                                    ),
                                  ),
                                ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: TextFormField(
                                controller: fullNameController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your full name';
                                  } else if (value.length < 2) {
                                    return 'Name must be at least 2 characters';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  labelText: 'Full Name',
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
                          ),

                          // حقل الإيميل مع حركة انزلاق من اليمين
                          // Email field with slide animation from right
                          SlideTransition(
                            position:
                                Tween<Offset>(
                                  begin: const Offset(1, 0), // يأتي من اليمين
                                  end: Offset.zero,
                                ).animate(
                                  CurvedAnimation(
                                    parent: _slideController,
                                    curve: const Interval(
                                      0.2,
                                      0.9,
                                      curve: Curves.elasticOut,
                                    ),
                                  ),
                                ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: TextFormField(
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your email';
                                  } else if (!RegExp(
                                    r'^[^@]+@[^@]+\.[^@]+',
                                  ).hasMatch(value)) {
                                    return 'Please enter a valid email address';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  labelText: 'Email',
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
                          ),

                          // حقل كلمة المرور مع حركة انزلاق من اليسار
                          // Password field with slide animation from left
                          SlideTransition(
                            position:
                                Tween<Offset>(
                                  begin: const Offset(-1, 0), // يأتي من اليسار
                                  end: Offset.zero,
                                ).animate(
                                  CurvedAnimation(
                                    parent: _slideController,
                                    curve: const Interval(
                                      0.3,
                                      1.0,
                                      curve: Curves.elasticOut,
                                    ),
                                  ),
                                ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: TextFormField(
                                controller: passwordController,
                                obscureText: hidenPassword,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your password';
                                  } else if (value.length < 6) {
                                    return 'Password must be at least 6 characters';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      hidenPassword
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
                          ),

                          // حقل تأكيد كلمة المرور مع حركة انزلاق من اليمين
                          // Confirm password field with slide animation from right
                          SlideTransition(
                            position:
                                Tween<Offset>(
                                  begin: const Offset(1, 0), // يأتي من اليمين
                                  end: Offset.zero,
                                ).animate(
                                  CurvedAnimation(
                                    parent: _slideController,
                                    curve: const Interval(
                                      0.4,
                                      1.0,
                                      curve: Curves.elasticOut,
                                    ),
                                  ),
                                ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: TextFormField(
                                controller: confirmPasswordController,
                                obscureText: hidenConfirmPassword,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please confirm your password';
                                  } else if (value != passwordController.text) {
                                    return 'Passwords do not match';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  labelText: 'Confirm Password',
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      hidenConfirmPassword
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
                          ),

                          const SizedBox(height: 40),

                          // زر إنشاء الحساب مع حركة تكبير
                          // Sign up button with scale animation
                          AnimatedBuilder(
                            animation: _slideController,
                            builder: (context, child) {
                              return Transform.scale(
                                scale: _slideController.value,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF2196F3),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 120,
                                      vertical: 15,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  onPressed: _handleSignUp,
                                  child: const Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Suwannaphum',
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),

                          const SizedBox(height: 20),

                          // رابط تسجيل الدخول مع حركة تلاشي متأخرة
                          // Login link with delayed fade animation
                          FadeTransition(
                            opacity: Tween<double>(begin: 0.0, end: 1.0)
                                .animate(
                                  CurvedAnimation(
                                    parent: _fadeController,
                                    curve: const Interval(
                                      0.8,
                                      1.0,
                                    ), // يظهر في النهاية
                                  ),
                                ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Already have an account? ",
                                  style: TextStyle(color: Color(0xFF757575)),
                                ),
                                TextButton(
                                  onPressed: () async {
                                    // تشغيل حركة التلاشي قبل العودة لصفحة تسجيل الدخول
                                    // Play fade out before returning to login page
                                    await _fadeController.reverse();

                                    if (mounted) {
                                      Navigator.pop(context);
                                    }
                                  },
                                  child: const Text(
                                    'Login',
                                    style: TextStyle(
                                      color: Color(0xFF2196F3),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 30),
                        ],
                      ),
                    ),
              ),
        ),
      ),
    );
  }
}
