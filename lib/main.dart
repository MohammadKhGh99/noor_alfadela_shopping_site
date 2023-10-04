import 'package:flutter/material.dart';

import 'signup.dart';
import 'enter_method.dart';
import 'shared_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const TextStyle myTextStyle = TextStyle(fontFamily: 'Amiri');

    return MaterialApp(
      initialRoute: '/home',
      routes: {
        '/home': (context) => const Directionality(
            textDirection: TextDirection.rtl,
            child: MyHomePage(title: 'الصفحة الرئيسية')
        ),
        '/signup': (context) => const Directionality(
            textDirection: TextDirection.rtl,
            child: SignUpPage(title: "تسجيل")
        ),
        '/enter_method': (context) => const Directionality(
            textDirection: TextDirection.rtl,
            child: EnterMethodPage(title: "تسجيل الإشتراك أو تسجيل الدخول")
        ),
      },
      title: 'نور الفضيلة للأزياء الشرعية',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
          textTheme: const TextTheme (
            bodyLarge: myTextStyle,
            bodyMedium: myTextStyle,
            bodySmall: myTextStyle,
            labelLarge: myTextStyle,
            labelMedium: myTextStyle,
            labelSmall: myTextStyle,
            titleLarge: myTextStyle,
            titleMedium: myTextStyle,
            titleSmall: myTextStyle,
            headlineLarge: myTextStyle,
            headlineMedium: myTextStyle,
            headlineSmall: myTextStyle
          )
      ),
      home: const Directionality(
        textDirection: TextDirection.rtl,
        child: MyHomePage(title: 'الصفحة الرئيسية')
      )
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEF9F6),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: SharedAppBar()
      ),
      body: const ShoppingItemsPage(),
    );
  }
}

class Product {
  String name = '';
  String price = '';
  String imageUrl = '';
  Product({
    required String name,
    required String price,
    required String imageUrl}){
    this.name = name;
    this.price = price;
    this.imageUrl = imageUrl;
  }

}

List<Product> products = [
  Product(name: 'Product 1', price: '\$10', imageUrl: 'images/product1.jpg'),
  Product(name: 'Product 2', price: '\$15', imageUrl: 'images/product2.jpg'),
  Product(name: 'Product 3', price: '\$25', imageUrl: 'images/product1.jpg'),
  Product(name: 'Product 4', price: '\$35', imageUrl: 'images/product2.jpg'),
  Product(name: 'Product 5', price: '\$10', imageUrl: 'images/product1.jpg'),
  Product(name: 'Product 6', price: '\$15', imageUrl: 'images/product2.jpg'),
  Product(name: 'Product 7', price: '\$25', imageUrl: 'images/product1.jpg'),
  Product(name: 'Product 8', price: '\$35', imageUrl: 'images/product2.jpg'),
  // Add more products here
];


class ShoppingItemsPage extends StatelessWidget {
  const ShoppingItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(20),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, // Number of columns in the grid
          crossAxisSpacing: 20.0, // Spacing between columns
          mainAxisSpacing: 20.0, // Spacing between rows
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return _buildItemCard(products[index]);
        },

      );
  }

  void _handleCardClick(Product product) {
    // Implement your click handling logic here
    print('Clicked on ${product.name}');
    // You can navigate to a product details page or perform any other action.
  }

  Widget _buildItemCard(Product product) {
    return ElevatedButton(
      onPressed: () {
        _handleCardClick(product);
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        backgroundColor: const Color(0xFFFEF9F6),
        elevation: 4,
        // foregroundColor: const Color(0xFFFEF9F6),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            product.imageUrl,
            width: 150.0,
            height: 150.0,
            fit: BoxFit.cover,
          ),
          // const SizedBox(height: 8.0),
          Text(
            product.name,
            style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          Text(
            product.price,
            style: const TextStyle(fontSize: 14.0),//, color: Colors.grey),
          ),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    print("Buy Now");
                  },
                  child: const Text("اشتر الآن")
              ),
              const SizedBox(width: 100,),
              IconButton(
                  onPressed: () {
                    print("Add To Cart");
                  },
                  icon: const Icon(Icons.add_shopping_cart),
              ),
            ],
          )
        ],
      ),
    );
  }
}

