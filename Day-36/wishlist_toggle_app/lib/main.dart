import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wishlist Toggle',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const WishlistScreen(),
    );
  }
}

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {

  List<Map<String, dynamic>> items = [
    {"name": "Shoes", "isFavorite": false},
    {"name": "Watch", "isFavorite": false},
    {"name": "Laptop", "isFavorite": false},
    {"name": "Phone", "isFavorite": false},
    {"name": "Headphones", "isFavorite": false},
  ];

  @override
  void initState() {
    super.initState();
    debugPrint("Widget Initialized");
  }

  @override
  void dispose() {
    debugPrint("Widget Disposed");
    super.dispose();
  }

  void toggleFavorite(int index) {
    setState(() {
      items[index]["isFavorite"] =
          !items[index]["isFavorite"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wishlist Toggle"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 6,
            ),
            child: ListTile(
              title: Text(items[index]["name"]),
              trailing: IconButton(
                icon: Icon(
                  items[index]["isFavorite"]
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: items[index]["isFavorite"]
                      ? Colors.red
                      : Colors.grey,
                ),
                onPressed: () {
                  toggleFavorite(index);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}