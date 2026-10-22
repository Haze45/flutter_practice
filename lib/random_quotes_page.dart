import 'dart:math';
import 'package:flutter/material.dart';

class RandomQuotesPage extends StatefulWidget {
  const RandomQuotesPage({super.key});

  @override
  State<RandomQuotesPage> createState() => _RandomQuotesPageState();
}

class _RandomQuotesPageState extends State<RandomQuotesPage> {

  // List containing quotes and their authors
  final List<Map<String, String>> quotes = [
    {
      'quote': 'The only way to do great work is to love what you do.',
      'author': 'Steve Jobs',
    },
    {
      'quote': 'It always seems impossible until it is done.',
      'author': 'Nelson Mandela',
    },
    {
      'quote': 'Believe you can and you are halfway there.',
      'author': 'Theodore Roosevelt',
    },
    {
      'quote': 'Success is not final, failure is not fatal.',
      'author': 'Winston Churchill',
    },
    {
      'quote': 'The future depends on what you do today.',
      'author': 'Mahatma Gandhi',
    },
  ];

  int quoteIndex = 0;
  
  final Random random = Random();

  void showRandomQuote() {
    setState(() {
      quoteIndex = random.nextInt(quotes.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Quotes'),
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [

              // Quote
              Text(
                '"${quotes[quoteIndex]['quote']}"',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  fontStyle: FontStyle.italic,
                ),
              ),

              const SizedBox(height: 20),

              // Author
              Text(
                '- ${quotes[quoteIndex]['author']}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 40),

              // Button
              ElevatedButton(
                onPressed: showRandomQuote,
                child: const Text(
                  'New Quote',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}