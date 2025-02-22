import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends
 StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ImageScreen(),
    );
  }
}

class ImageScreen extends StatelessWidget {
  const ImageScreen({super.key});

  @
override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Example'),
      ),
      body: Center(
        child: FittedBox(
          fit: BoxFit.contain,
          child: Image.network(
            'https://fastly.picsum.photos/id/8/5000/3333.jpg?hmac=OeG5ufhPYQBd6Rx1TAldAuF92lhCzAhKQKttGfawWuA',
          ),
        ),
      ),
    );
  }
}
