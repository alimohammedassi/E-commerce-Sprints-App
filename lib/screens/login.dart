import 'package:flutter/material.dart';
import 'package:sprints_project_app/screens/home_screen.dart';
import 'package:sprints_project_app/screens/sigin_up.dart';
// إضافة استيراد صفحة الرئيسية - يجب استبدالها بالمسار الصحيح
 // Replace with your actual home page path

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with TickerProviderStateMixin {
  bool hidenPassword = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
    
    // إنشاء متحكم الحركة للتلاشي مع مدة ثانيتين
    // Create fade animation controller with 2-second duration
    _fadeController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    
    // إنشاء متحكم الحركة للانزلاق مع مدة ثانية ونصف
    // Create slide animation controller with 1.5-second duration
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    // تعريف حركة التلاشي من 0 إلى 1 (من شفاف إلى مرئي)
    // Define fade animation from 0 to 1 (transparent to visible)
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeIn, // منحنى سلس للظهور
    ));

    // تعريف حركة الانزلاق من أسفل إلى الوسط
    // Define slide animation from bottom to center
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5), // يبدأ من الأسفل قليلاً
      end: Offset.zero, // ينتهي في المكان الطبيعي
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.elasticOut, // منحنى مرن للحركة
    ));

    // بدء الحركات عند تحميل الصفحة
    // Start animations when page loads
    _fadeController.forward();
    _slideController.forward();
  }

  @override
  void dispose() {
    // تنظيف متحكمات الحركة عند إغلاق الصفحة
    // Clean up animation controllers when page is disposed
    _fadeController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  @override
  void tooglePasswordVisibility() {
    setState(() {
      hidenPassword = !hidenPassword;
    });
  }

  void _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      // عرض رسالة نجح تسجيل الدخول
      // Show successful login message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login successful!'),
          backgroundColor: Colors.green,
        ),
      );
      
      // تشغيل حركة التلاشي للخروج قبل الانتقال
      // Play fade out animation before navigation
      await _fadeController.reverse();
      
      if (mounted) {
        // الانتقال لصفحة الرئيسية مع استبدال الصفحة الحالية
        // Navigate to home page replacing current page
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            // مدة انتقال الصفحة
            transitionDuration: const Duration(seconds:1),
            pageBuilder: (context, animation, secondaryAnimation) => const Home(),
            // تأثير تلاشي عند الانتقال بين الصفحات
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
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
            'Login',
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

                  // نص الترحيب مع تأخير في الظهور
                  // Welcome text with delayed appearance
                  AnimatedBuilder(
                    animation: _fadeController,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: _fadeAnimation.value,
                        child: const Text(
                          "Welcome Back!",
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
                      "Please login to your account",
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                  ),

                  const SizedBox(height: 60),
                  
                  // حقل الإيميل مع حركة انزلاق
                  // Email field with slide animation
                  SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(-1, 0), // يأتي من اليسار
                      end: Offset.zero,
                    ).animate(CurvedAnimation(
                      parent: _slideController,
                      curve: const Interval(0.2, 1.0, curve: Curves.elasticOut),
                    )),
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
                          suffixIcon: const Icon(Icons.email, color: Colors.blue),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  
                  // حقل كلمة المرور مع حركة انزلاق من اليمين
                  // Password field with slide animation from right
                  SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(1, 0), // يأتي من اليمين
                      end: Offset.zero,
                    ).animate(CurvedAnimation(
                      parent: _slideController,
                      curve: const Interval(0.4, 1.0, curve: Curves.elasticOut),
                    )),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextFormField(
                        controller: passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          } else if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                        obscureText: hidenPassword,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          suffixIcon: IconButton(
                            icon: Icon(
                              hidenPassword ? Icons.visibility : Icons.visibility_off,
                            ),
                            onPressed: tooglePasswordVisibility,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 40),
                  
                  // زر تسجيل الدخول مع حركة تكبير
                  // Login button with scale animation
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
                          onPressed: _handleLogin,
                          child: const Text(
                            'Login',
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
                  
                  // نص التسجيل مع حركة تلاشي متأخرة
                  // Sign up text with delayed fade animation
                  FadeTransition(
                    opacity: Tween<double>(
                      begin: 0.0,
                      end: 1.0,
                    ).animate(CurvedAnimation(
                      parent: _fadeController,
                      curve: const Interval(0.8, 1.0), // يظهر في النهاية
                    )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account? ",
                          style: TextStyle(color: Color(0xFF757575)),
                        ),
                        TextButton(
                          onPressed: () async {
                            // تشغيل حركة التلاشي قبل الانتقال لصفحة التسجيل
                            // Play fade out before navigating to sign up
                            await _fadeController.reverse();
                            
                            if (mounted) {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  transitionDuration: const Duration(milliseconds: 600),
                                  pageBuilder: (context, animation, secondaryAnimation) => const SiginUp(),
                                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                    return FadeTransition(
                                      opacity: animation,
                                      child: child,
                                    );
                                  },
                                ),
                              );
                            }
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Color(0xFF2196F3),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}