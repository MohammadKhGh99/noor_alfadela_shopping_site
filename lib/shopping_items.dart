import 'package:flutter/material.dart';


class Product{
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

// Widget lastSection = Column(
//   children: [
//     const Column(
//       children: [
//         Text("من نحن"),
//         Divider(),
//         Text("نور الفضيلة موقع أزياء شرعية"),
//       ],
//     ),
//     const Column(
//       children: [
//         Text("روابط مهمة"),
//         Divider(),
//         Row(
//           children: [
//             Column(
//               children: [
//                 Text("طريقة إختيار المقاس"),
//                 Text("سياسة الخصوصية"),
//                 Text("سياسة الاستبدال والاسترجاع"),
//               ],
//             ),
//             Column(
//               children: [
//                 Text("الشكاوى والاقتراحات"),
//                 Text("عروض الخصومات"),
//               ],
//             )
//           ],
//         )
//       ],
//     ),
//     Column(
//       children: [
//         const Text("تواصل معنا"),
//         const Divider(),
//         IconButton(
//             onPressed: () {
//               print("Instagram");
//             },
//             icon: const Icon(FontAwesomeIcons.instagram)
//         )
//       ],
//     )
//   ],
// );

List<Object> products = [
  Product(name: 'Product 1', price: '\$10', imageUrl: 'images/product1.jpg'),
  Product(name: 'Product 2', price: '\$15', imageUrl: 'images/product2.jpg'),
  Product(name: 'Product 3', price: '\$25', imageUrl: 'images/product1.jpg'),
  Product(name: 'Product 4', price: '\$35', imageUrl: 'images/product2.jpg'),
  Product(name: 'Product 5', price: '\$10', imageUrl: 'images/product1.jpg'),
  Product(name: 'Product 6', price: '\$15', imageUrl: 'images/product2.jpg'),
  Product(name: 'Product 7', price: '\$25', imageUrl: 'images/product1.jpg'),
  Product(name: 'Product 8', price: '\$35', imageUrl: 'images/product2.jpg'),
  // lastSection
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
        // if (index == products.length - 1){
        //   return products[index] as Widget;
        // }
        return _buildItemCard(products[index] as Product);
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
        foregroundColor: const Color(0xFFAD7765),
        surfaceTintColor: const Color(0xFFFEF9F6),
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
                style: ElevatedButton.styleFrom(
                  foregroundColor: const Color(0xFFAD7765),
                  surfaceTintColor: const Color(0xFFFEF9F6),
                ),
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
