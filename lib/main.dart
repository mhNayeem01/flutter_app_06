import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart'; // Import the CachedNetworkImage package

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ImageScreen());
  }
}

class ImageScreen extends StatelessWidget {
  const ImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cached Image Example')),
      body: Center(
        child: FittedBox(
          fit: BoxFit.contain,
          child: CachedNetworkImage(
            imageUrl:
                'https://fastly.picsum.photos/id/8/5000/3333.jpg?hmac=OeG5ufhPYQBd6Rx1TAldAuF92lhCzAhKQKttGfawWuA',
            placeholder:
                (context, url) =>
                    const CircularProgressIndicator(), // Placeholder widget while loading
            errorWidget:
                (context, url, error) => const Icon(
                  Icons.error,
                ), // Error widget if the image fails to load
          ),
        ),
      ),
    );
  }
}
