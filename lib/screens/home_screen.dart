import 'package:flutter/material.dart';
import 'dart:async';
import 'homeScreen_detils.dart'; // Import the details file

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  Timer? _timer;

  final List<String> _sliderImages = [
    'https://images.unsplash.com/photo-1445205170230-053b83016050?w=800&q=80',
    'https://images.unsplash.com/photo-1441984904996-e0b6ba687e04?w=800&q=80',
    'https://images.unsplash.com/photo-1558769132-cb1aea458c5e?w=800&q=80',
    'https://images.unsplash.com/photo-1490481651871-ab68de25d43d?w=800&q=80',
    'https://images.unsplash.com/photo-1516762689617-e1cffcef479d?w=800&q=80',
  ];

  final List<String> _sliderTitles = [
    'Welcome to Fashion ALI',
    'Latest Fashion Trends',
    'Style & Comfort',
    'Women\'s Collection',
    'Men\'s Fashion',
  ];

  final List<String> _sliderSubtitles = [
    'Discover your perfect style',
    'Stay ahead of fashion',
    'Quality meets elegance',
    'Feminine & trendy',
    'Classic & modern',
  ];

  final List<Map<String, dynamic>> _products = [
    {
      'name': 'Summer Dress',
      'price': '\$89',
      'image':
          'https://images.unsplash.com/photo-1515372039744-b8f02a3ae446?w=400&q=80',
      'rating': 4.5,
    },
    {
      'name': 'Denim Jacket',
      'price': '\$129',
      'image':
          'https://images.unsplash.com/photo-1551698618-1dfe5d97d256?w=400&q=80',
      'rating': 4.8,
    },
    {
      'name': 'Classic T-Shirt',
      'price': '\$39',
      'image':
          'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=400&q=80',
      'rating': 4.3,
    },
    {
      'name': 'Casual Sneakers',
      'price': '\$149',
      'image':
          'https://images.unsplash.com/photo-1549298916-b41d501d3772?w=400&q=80',
      'rating': 4.6,
    },
    {
      'name': 'Leather Handbag',
      'price': '\$199',
      'image':
          'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=400&q=80',
      'rating': 4.7,
    },
    {
      'name': 'Sunglasses',
      'price': '\$79',
      'image':
          'https://images.unsplash.com/photo-1473496169904-658ba7c44d8a?w=400&q=80',
      'rating': 4.4,
    },
    {
      'name': 'Winter Coat',
      'price': '\$249',
      'image':
          'https://images.unsplash.com/photo-1544966503-7cc5ac882d5f?w=400&q=80',
      'rating': 4.2,
    },
    {
      'name': 'Formal Shoes',
      'price': '\$179',
      'image':
          'https://images.unsplash.com/photo-1614252369475-531eba835eb1?w=400&q=80',
      'rating': 4.9,
    },
  ];

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (_currentIndex < _sliderImages.length - 1) {
        _currentIndex++;
      } else {
        _currentIndex = 0;
      }

      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    });
  }

  void _showCartPopup(String productName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Row(
            children: [
              Icon(Icons.shopping_cart, color: Color(0xFF2196F3), size: 24),
              SizedBox(width: 8),
              Text(
                'THANKS FOR SHOPPING WITH US!',
                style: TextStyle(
                  fontSize: 1,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2196F3),
                ),
              ),
            ],
          ),
          content: Text(
            '$productName is in the cart',
            style: TextStyle(fontSize: 16, color: Colors.black87),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'OK',
                style: TextStyle(
                  color: Color(0xFF2196F3),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2196F3),
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          'E-commerce Sprints App',
          style: TextStyle(
            fontFamily: 'Suwannaphum',
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Welcome to Fashion ALI! Explore the latest trends and shop your favorite styles.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            Container(
              height: 250,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Stack(
                children: [
                  PageView.builder(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    itemCount: _sliderImages.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.network(
                                _sliderImages[index],
                                fit: BoxFit.cover,
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Container(
                                        color: Colors.grey[300],
                                        child: const Center(
                                          child: CircularProgressIndicator(
                                            color: Color(0xFF2196F3),
                                          ),
                                        ),
                                      );
                                    },
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    color: Colors.grey[400],
                                    child: const Center(
                                      child: Icon(
                                        Icons.image_not_supported,
                                        size: 50,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  );
                                },
                              ),

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

                              Positioned(
                                bottom: 20,
                                left: 20,
                                right: 20,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _sliderTitles[index],
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Suwannaphum',
                                        shadows: [
                                          Shadow(
                                            offset: Offset(0, 1),
                                            blurRadius: 3,
                                            color: Colors.black54,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      _sliderSubtitles[index],
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        shadows: [
                                          Shadow(
                                            offset: Offset(0, 1),
                                            blurRadius: 3,
                                            color: Colors.black54,
                                          ),
                                        ],
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

                  Positioned(
                    bottom: 15,
                    right: 20,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(
                        _sliderImages.length,
                        (index) => AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 3),
                          width: _currentIndex == index ? 20 : 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: _currentIndex == index
                                ? Colors.white
                                : Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    left: 10,
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          if (_currentIndex > 0) {
                            _currentIndex--;
                            _pageController.animateToPage(
                              _currentIndex,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.chevron_left,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    top: 0,
                    bottom: 0,
                    right: 10,
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          if (_currentIndex < _sliderImages.length - 1) {
                            _currentIndex++;
                            _pageController.animateToPage(
                              _currentIndex,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.chevron_right,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Shop Our Fashion Collection',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  height: 1.5,
                ),
              ),
            ),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: _products.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Selected: ${_products[index]['name']}',
                          ),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    },
                    child: ProductCard(
                      product: _products[index],
                      showCartPopup: _showCartPopup,
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Explore More',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Improved Header
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              padding: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 20.0,
              ),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFFF6B35), Color(0xFFFF8E53)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.orange.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Text(
                'Hot Offers 🔥',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),

            const SizedBox(height: 30),

            // First Offer
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16.0),
                title: const Text(
                  "50% Off Electronics",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2196F3),
                  ),
                ),
                subtitle: const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    "Limited time offer!",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ),
                trailing: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Home()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2196F3),
                    foregroundColor: Colors.white,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                  child: const Text(
                    "Shop 50% Off❤️‍🔥",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Second Offer
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.green.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16.0),
                title: const Text(
                  "Extra 20% off with valid student ID",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4CAF50),
                  ),
                ),
                subtitle: const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    "Student Discount",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ),
                trailing: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Home()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4CAF50),
                    foregroundColor: Colors.white,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                  child: const Text(
                    "Shop Now❤️‍🔥",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Third Offer
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.purple.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16.0),
                title: const Text(
                  "Buy 2 Get 1 Free",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF9C27B0),
                  ),
                ),
                subtitle: const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    "On selected accessories and peripherals!",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ),
                trailing: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Home()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF9C27B0),
                    foregroundColor: Colors.white,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                  child: const Text(
                    "Free shopping❤️‍🔥",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Fourth Offer
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.orange.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16.0),
                title: const Text(
                  "Save more when you buy complete setups",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFF9800),
                  ),
                ),
                subtitle: const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    "Bundle deals available",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ),
                trailing: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Home()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF9800),
                    foregroundColor: Colors.white,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                  child: const Text(
                    "Shop Now❤️‍🔥",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
