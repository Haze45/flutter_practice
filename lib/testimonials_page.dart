import 'package:flutter/material.dart';

class TestimonialsPage extends StatefulWidget {
  const TestimonialsPage({super.key});

  @override
  State<TestimonialsPage> createState() => _TestimonialsPageState();
}

class _TestimonialsPageState extends State<TestimonialsPage> {
  final List<Map<String, dynamic>> testimonials = [
    {
      'name': 'Kate Rogers',
      'role': 'Graphic Designer',
      'rating': 5,
      'title': 'AMAZING CUSTOMER SERVICE',
      'message':
      'I needed a refund for tickets to an event that was changed last minute. I experienced great customer service and the issue was resolved in a timely manner. Thanks to agent Sandra!',
      'image': 'assets/pexels-sebastiaan9977-1480690.jpg',
    },

    {
      'name': 'John Smith',
      'role': 'Software Developer',
      'rating': 5,
      'title': 'GREAT EXPERIENCE',
      'message':
      'The service was excellent and the support team was very helpful. My problem was solved quickly and professionally.',
      'image': 'assets/pexels-stywo-1261728.jpg',
    },

    {
      'name': 'Sarah Wilson',
      'role': 'Marketing Manager',
      'rating': 4,
      'title': 'VERY PROFESSIONAL',
      'message':
      'I had a wonderful experience with the team. They were friendly, professional and made the entire process very easy.',
      'image': 'assets/sebastian-svenson-d2w-_1LJioQ-unsplash.jpg',
    },

    {
      'name': 'Michael Brown',
      'role': 'Business Owner',
      'rating': 5,
      'title': 'HIGHLY RECOMMENDED',
      'message':
      'The support team went above and beyond to help me. Everything was handled smoothly and I would definitely recommend their service.',
      'image': 'assets/—Pngtree—blade and blood moon_16536658.jpg',
    },

    {
      'name': 'Emily Davis',
      'role': 'Product Designer',
      'rating': 5,
      'title': 'EXCELLENT SERVICE',
      'message':
      'From beginning to end, the experience was fantastic. The team responded quickly and solved my issue without any hassle.',
      'image': 'assets/—Pngtree—surreal landscape floating rock island_16243391.jpg',
    },
  ];

  int currentIndex = 0;

  void nextTestimonial() {
    setState(() {
      if (currentIndex < testimonials.length - 1) {
        currentIndex++;
      } else {
        currentIndex = 0;
      }
    });
  }

  void previousTestimonial() {
    setState(() {
      if (currentIndex > 0) {
        currentIndex--;
      } else {
        currentIndex = testimonials.length - 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final testimonial = testimonials[currentIndex];

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,

        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFC81770),
              Color(0xFFFF765E),
            ],
            stops: [0.5, 0.5],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),

        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20),

              child: GestureDetector(
                onHorizontalDragEnd: (details) {
                  if (details.primaryVelocity! < 0) {
                    nextTestimonial();
                  } else if (details.primaryVelocity! > 0) {
                    previousTestimonial();
                  }
                },

                child: Container(

                  // ==========================
                  // SMALLER RECTANGLE
                  // ==========================

                  width: 850,
                  height: 430,

                  padding: const EdgeInsets.symmetric(
                    horizontal: 35,
                    vertical: 25,
                  ),

                  decoration: BoxDecoration(
                    color: const Color(0xFFC81770),

                    borderRadius: BorderRadius.circular(25),

                    border: Border.all(
                      color: Colors.white,
                      width: 4,
                    ),
                  ),

                  child: Column(
                    children: [

                      // ==========================
                      // MAIN CONTENT
                      // ==========================

                      Expanded(
                        child: Row(
                          children: [

                            // ==========================
                            // LARGE CIRCULAR IMAGE
                            // ==========================

                            Expanded(
                              flex: 3,

                              child: Center(
                                child: Container(
                                  width: 250,
                                  height: 250,

                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),

                                  clipBehavior:
                                  Clip.antiAlias,

                                  child: Image.asset(
                                    testimonial['image'],

                                    width: 250,
                                    height: 250,

                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(width: 30),

                            // ==========================
                            // TESTIMONIAL CONTENT
                            // ==========================

                            Expanded(
                              flex: 6,

                              child: Stack(
                                children: [

                                  // Main testimonial text
                                  Center(
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,

                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,

                                      children: [

                                        // Opening quote
                                        const Text(
                                          '“',

                                          style: TextStyle(
                                            color:
                                            Colors.cyanAccent,

                                            fontSize: 65,

                                            fontWeight:
                                            FontWeight.bold,

                                            height: 0.5,
                                          ),
                                        ),

                                        const SizedBox(height: 8),

                                        // Name + Role
                                        Text.rich(
                                          TextSpan(
                                            children: [

                                              TextSpan(
                                                text:
                                                testimonial[
                                                'name'],

                                                style:
                                                const TextStyle(
                                                  color:
                                                  Colors.white,

                                                  fontSize: 17,

                                                  fontWeight:
                                                  FontWeight.bold,
                                                ),
                                              ),

                                              TextSpan(
                                                text:
                                                ' - ${testimonial['role']}',

                                                style:
                                                const TextStyle(
                                                  color:
                                                  Colors.white70,

                                                  fontSize: 17,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                        const SizedBox(height: 8),

                                        // Stars
                                        Row(
                                          children:
                                          List.generate(
                                            5,
                                                (index) {
                                              return Icon(
                                                index <
                                                    testimonial[
                                                    'rating']
                                                    ? Icons.star
                                                    : Icons.star_border,

                                                color:
                                                Colors.yellow,

                                                size: 22,
                                              );
                                            },
                                          ),
                                        ),

                                        const SizedBox(height: 8),

                                        // Title
                                        Text(
                                          testimonial['title'],

                                          style:
                                          const TextStyle(
                                            color: Colors.white,

                                            fontSize: 24,

                                            fontWeight:
                                            FontWeight.bold,
                                          ),
                                        ),

                                        const SizedBox(height: 8),

                                        // Message
                                        Text(
                                          testimonial['message'],

                                          style:
                                          const TextStyle(
                                            color: Colors.white,

                                            fontSize: 15,

                                            height: 1.4,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  // ==========================
                                  // CLOSING QUOTE
                                  // ==========================

                                  const Positioned(
                                    right: 0,
                                    bottom: 0,

                                    child: Text(
                                      '”',

                                      style: TextStyle(
                                        color:
                                        Colors.cyanAccent,

                                        fontSize: 65,

                                        fontWeight:
                                        FontWeight.bold,

                                        height: 0.5,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      // ==========================
                      // INDICATORS
                      // ==========================

                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.center,

                        children: List.generate(
                          testimonials.length,

                              (index) {
                            return AnimatedContainer(
                              duration:
                              const Duration(
                                milliseconds: 300,
                              ),

                              margin:
                              const EdgeInsets.symmetric(
                                horizontal: 4,
                              ),

                              width: currentIndex == index
                                  ? 55
                                  : 12,

                              height: 7,

                              decoration:
                              BoxDecoration(
                                color: Colors.white,

                                borderRadius:
                                BorderRadius.circular(10),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}