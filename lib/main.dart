import 'package:flutter/material.dart';
import 'package:practice_ui/snake_game.dart';
import 'package:practice_ui/testimonials_page.dart';
import 'package:practice_ui/tick_tack_toe.dart';
import 'package:practice_ui/todo_list_page.dart';

import 'background_image_slider.dart';
import 'background_image_slider_v2.dart';
import 'calculator_page.dart';
import 'counter_controller.dart';
import 'background_color_page.dart';
import 'neumorphism.dart';
import 'random_quotes_page.dart';
import 'message_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Flutter App',

      theme: ThemeData(
        colorScheme: .fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),

      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My App'),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(
            title: const Text('Counter'),
            subtitle: const Text('Increment and decrement'),

            trailing: const Icon(Icons.arrow_forward),

            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CounterPage(),
                ),
              );
            },
          ),

          const Divider(),

          ListTile(
            title: const Text('Change Background Color'),
            subtitle: const Text('Change screen background color'),
            trailing: const Icon(Icons.arrow_forward),

            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const BackgroundColorPage(),
                ),
              );
            },
          ),

          const Divider(),

          ListTile(
            title: const Text('Random Quotes'),
            subtitle: const Text('Get a random quote'),
            trailing: const Icon(Icons.arrow_forward),

            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RandomQuotesPage(),
                ),
              );
            },
          ),

          const Divider(),

          ListTile(
            title: const Text('Message'),
            subtitle: const Text('Submit a message using Enter'),

            trailing: const Icon(Icons.arrow_forward),

            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MessagePage(),
                ),
              );
            },
          ),

          const Divider(),

          ListTile(
            title: const Text('Background Image Slider'),
            subtitle: const Text('Change background images'),

            trailing: const Icon(Icons.arrow_forward),

            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                  const BackgroundImageSlider(),
                ),
              );
            },
          ),

          const Divider(),

          ListTile(
            title: const Text('Background Image Slider carousel '),
            subtitle: const Text('Change background images'),

            trailing: const Icon(Icons.arrow_forward),

            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                  const BackgroundImageSliderCarousel(),
                ),
              );
            },
          ),

          const Divider(),

          ListTile(
            title: const Text('Testimonials'),
            subtitle: const Text('View customer testimonials'),
            trailing: const Icon(Icons.arrow_forward),

            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TestimonialsPage(),
                ),
              );
            },
          ),

          const Divider(),

          ListTile(
            title: const Text('Calculator'),
            subtitle: const Text('Basic calculator'),
            trailing: const Icon(Icons.arrow_forward),

            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CalculatorPage(),
                ),
              );
            },
          ),

          const Divider(),

          ListTile(
            title: const Text('Todo List'),
            subtitle: const Text('Manage your tasks'),
            trailing: const Icon(Icons.arrow_forward),

            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TodoListPage(),
                ),
              );
            },
          ),

          const Divider(),

          ListTile(
            title: const Text('Neumorphism'),
            subtitle: const Text('Dark and Light Theme'),
            trailing: const Icon(Icons.arrow_forward),

            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Neumorphism(),
                ),
              );
            },
          ),
          const Divider(),

          ListTile(
            title: const Text('Tic Tac Toe'),
            subtitle: const Text('Play Tic Tac Toe'),
            trailing: const Icon(Icons.arrow_forward),

            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TickTackToe(),
                ),
              );
            },
          ),

          const Divider(),

          ListTile(
            title: const Text('Snake Game'),
            subtitle: const Text('Play Snake Game'),
            trailing: const Icon(Icons.arrow_forward),

            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SnakeGame(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}