import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sprints_project_app/screens/login.dart';
import 'package:sprints_project_app/screens/sign_up.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isRTL = context.locale.languageCode == 'ar';
    
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color.fromARGB(255, 255, 255, 255),
              const Color(0xFF1976D2),
              const Color.fromARGB(255, 0, 0, 0),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Enhanced AppBar
              _buildCustomAppBar(context, isRTL),
              
              // Main Content
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      
                      // Welcome Content
                      _buildWelcomeContent(context, isRTL),
                      
                      const SizedBox(height: 40),
                      
                      // Product Showcase
                      _buildProductShowcase(),
                      
                      const SizedBox(height: 50),
                      
                      // Action Buttons
                      _buildActionButtons(context, isRTL),
                      
                      const SizedBox(height: 30),
                      
                      // Footer
                      _buildFooter(context, isRTL),
                      
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCustomAppBar(BuildContext context, bool isRTL) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Row(
        children: [
          // App Logo/Icon
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: const Icon(
              Icons.shopping_bag,
              color: Color(0xFF2196F3),
              size: 28,
            ),
          ),
          
          const SizedBox(width: 16),
          
          // App Title
          Expanded(
            child: Text(
              tr('app_title'),
              style: const TextStyle(
                fontFamily: 'Suwannaphum',
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
                shadows: [
                  Shadow(
                    offset: Offset(0, 2),
                    blurRadius: 4,
                    color: Colors.black26,
                  ),
                ],
              ),
            ),
          ),
          
          // Enhanced Language Switcher
          Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: PopupMenuButton<Locale>(
              icon: Container(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.language, color: Colors.white, size: 20),
                    const SizedBox(width: 4),
                    Text(
                      isRTL ? 'ع' : 'En',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              onSelected: (Locale locale) {
                context.setLocale(locale);
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              itemBuilder: (BuildContext context) => [
                PopupMenuItem(
                  value: const Locale('en', 'US'),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Text('🇺🇸', style: TextStyle(fontSize: 20)),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'English',
                          style: TextStyle(
                            fontWeight: context.locale.languageCode == 'en'
                                ? FontWeight.bold
                                : FontWeight.normal,
                            color: context.locale.languageCode == 'en'
                                ? const Color(0xFF2196F3)
                                : Colors.black,
                          ),
                        ),
                        if (context.locale.languageCode == 'en')
                          const Spacer()
                        else
                          const SizedBox.shrink(),
                        if (context.locale.languageCode == 'en')
                          const Icon(Icons.check, 
                                     color: Color(0xFF2196F3), size: 20),
                      ],
                    ),
                  ),
                ),
                PopupMenuItem(
                  value: const Locale('ar', 'EG'),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Text('🇪🇬', style: TextStyle(fontSize: 20)),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'العربية',
                          style: TextStyle(
                            fontWeight: context.locale.languageCode == 'ar'
                                ? FontWeight.bold
                                : FontWeight.normal,
                            color: context.locale.languageCode == 'ar'
                                ? const Color(0xFF2196F3)
                                : Colors.black,
                          ),
                        ),
                        if (context.locale.languageCode == 'ar')
                          const Spacer()
                        else
                          const SizedBox.shrink(),
                        if (context.locale.languageCode == 'ar')
                          const Icon(Icons.check, 
                                     color: Color(0xFF2196F3), size: 20),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWelcomeContent(BuildContext context, bool isRTL) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          // Welcome Icon
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color.fromARGB(255, 241, 241, 241).withOpacity(0.1),
                  const Color.fromARGB(255, 255, 255, 255).withOpacity(0.1),
                ],
              ),
              borderRadius: BorderRadius.circular(20),
              ),

            child: const Icon(
              Icons.shopping_cart,
              color: Color.fromARGB(255, 255, 255, 255),
              size: 50,
            ),
          ),
          
          const SizedBox(height: 20),
          
          // Welcome Text
          Text(
            tr('welcome_message') ?? 'Welcome to Our Shopping App',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            textAlign: isRTL ? TextAlign.right : TextAlign.left,
          ),
          
          const SizedBox(height: 10),
          
          // Description Text
          Text(
            tr('welcome_description') ?? 'Discover the best products at unbeatable prices.',
            style: const TextStyle(fontSize: 16, color: Colors.black54),
            textAlign: isRTL ? TextAlign.right : TextAlign.left,
          ),
        
      ],));
    
  }        
    
  

  Widget _buildProductShowcase() {
    return SizedBox(
      height: 200,
      child: PageView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          final images = [
            'https://images.unsplash.com/photo-1441986300917-64674bd600d8?w=400',
            'https://images.unsplash.com/photo-1472851294608-062f824d29cc?w=400',
            'https://images.unsplash.com/photo-1560472354-b33ff0c44a43?w=400',
          ];
          
          final titles = [
            tr('featured_products') ?? 'Featured Products',
            tr('trending_items') ?? 'Trending Items', 
            tr('best_deals') ?? 'Best Deals',
          ];
          
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 15,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                children: [
                  // Background Image
                  Image.network(
                    images[index],
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[300],
                        child: const Icon(
                          Icons.image_not_supported,
                          size: 50,
                          color: Colors.grey,
                        ),
                      );
                    },
                  ),
                  
                  // Gradient Overlay
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.7),
                        ],
                      ),
                    ),
                  ),
                  
                  // Text Overlay
                  Positioned(
                    bottom: 20,
                    left: 20,
                    right: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          titles[index],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF2196F3),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            tr('explore_now') ?? 'Explore Now',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context, bool isRTL) {
    return Column(
      children: [
        // Enhanced Login Button
        Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF2196F3), Color(0xFF1976D2)],
            ),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF2196F3).withOpacity(0.4),
                blurRadius: 15,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Login(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.login_rounded,
                  color: Colors.white,
                  size: 24,
                ),
                const SizedBox(width: 12),
                Text(
                  tr('login'),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 20),

        // Enhanced Sign Up Button
        SizedBox(
          width: double.infinity,
          height: 60,
          child: OutlinedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignUp(),
                ),
              );
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.white.withOpacity(0.1),
              side: const BorderSide(
                color: Colors.white,
                width: 2,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.person_add_rounded,
                  color: Colors.white,
                  size: 24,
                ),
                const SizedBox(width: 12),
                Text(
                  tr('sign_up'),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFooter(BuildContext context, bool isRTL) {
    return Column(
      children: [
        // Features Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildFeatureItem(Icons.security, tr('secure_shopping') ?? 'Secure'),
            _buildFeatureItem(Icons.local_shipping, tr('fast_delivery') ?? 'Fast'),
            _buildFeatureItem(Icons.verified_user, tr('verified_products') ?? 'Verified'),
          ],
        ),
        
        const SizedBox(height: 20),
        
        // Get Started Text
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            tr('get_started'),
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _buildFeatureItem(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 24,
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}