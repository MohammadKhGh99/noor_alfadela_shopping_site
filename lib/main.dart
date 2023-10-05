import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart' as awesome;
import 'package:badges/badges.dart' as badges;

import 'signup.dart';
import 'enter_method.dart';

void main() {
  runApp(const MyApp());
}

final ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
  foregroundColor: const Color(0xFFAD7765),
  surfaceTintColor: const Color(0xFFFEF9F6),
);
final ButtonStyle rectangularButtonStyle = ElevatedButton.styleFrom(
  foregroundColor: const Color(0xFFAD7765),
  surfaceTintColor: const Color(0xFFFEF9F6),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(0),
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const TextStyle myTextStyle = TextStyle(fontFamily: 'Amiri');

    return MaterialApp(
      initialRoute: '/home',
      routes: {
        '/home': (context) => Directionality(
            textDirection: TextDirection.rtl,
            child: MyHomePage(title: 'الصفحة الرئيسية', cartItems: 0,)
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
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: MyHomePage(title: 'الصفحة الرئيسية', cartItems: 0,)
      )
    );
  }
}



class PasswordField extends StatefulWidget {
  const PasswordField({super.key});

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _obscureText,
      decoration: InputDecoration(
        labelText: "كلمة السر",
        hintText: 'كلمة السر مكونة من 8 خانات على الأقل',
        icon: const Icon(Icons.message),
        suffixIcon: IconButton(
          icon: _obscureText
              ? const Icon(awesome.FontAwesomeIcons.eyeSlash)
              : const Icon(awesome.FontAwesomeIcons.eye),
          onPressed: _togglePasswordVisibility,
        ),
      ),
      // Add other properties like validator, controller, etc. as needed
    );
  }
}


class SharedAppBar extends StatefulWidget {
  SharedAppBar({super.key, required this.cartItems});

  final int cartItems;

  @override
  State<SharedAppBar> createState() => _SharedAppBarState();

}

class _SharedAppBarState extends State<SharedAppBar> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _zipController = TextEditingController();

  void _handleLogoClick(BuildContext context) {
    Navigator.pop(context);
    Navigator.pushNamed(context, '/home');
  }

  void _submitForm()
  {
    if (_formKey.currentState!.validate()) {
      // Form is valid, handle the submission here
      String name = _nameController.text;
      String email = _emailController.text;
      String password = _passwordController.text;
      String phone = _phoneController.text;
      String city = _cityController.text;
      String street = _streetController.text;
      String zip = _zipController.text;

      // Perform your submission logic here
      print('Name: $name');
      print('Email: $email');
    }
  }

  void _handleSignInUp(BuildContext context, bool emailOrPhone) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          icon: Image.asset(
            'images/hijabi.png',
            width: 100,
            height: 100,
          ),
          scrollable: true,
          title: const Center(
              child: Text("تسجيل الدخول")
          ),
          surfaceTintColor: const Color(0xFFFEF9F6),
          backgroundColor: const Color(0xFFFEF9F6),
          content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        labelText: "الإسم",
                        icon: Icon(Icons.account_box),
                      ),
                    ),
                    if (emailOrPhone)
                      TextFormField(
                        textDirection: TextDirection.ltr,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: "البريد الإلكتروني",
                          hintText: 'your@email.com',
                          icon: Icon(Icons.email),
                        ),
                      ),
                    if (!emailOrPhone) // false for phone
                      TextFormField(
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          labelText: "رقم الهاتف",
                          hintText: "05xxxxxxxx",
                          icon: Icon(Icons.phone),
                        ),
                      ),
                    const PasswordField(),
                  ]
                ),
              ),
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: _submitForm,
              style: elevatedButtonStyle,
              child: const Text("تسجيل الدخول")
            )
          ],
        );
      }
    );
  }

  void _handleProfileClick(BuildContext context){
    // TODO - make the "sign in / up" thing, and profile page
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          surfaceTintColor: const Color(0xFFFEF9F6),
          icon: Image.asset(
            'images/hijabi.png',
            width: 100,
            height: 100,
          ),
          scrollable: true,
          title: const Center(
            child: Text("تسجيل الدخول"),
          ),
          content: Column(
            children: [
              const Divider(),
              const Text("اختاري طريقة الدخول المناسبة"),
              const SizedBox(height: 30,),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () => _handleSignInUp(context, true),
                    style: elevatedButtonStyle,
                    child: const Text("البريد الإلكتروني"),
                  ),
                  SizedBox(
                    width: 140,
                    child: ElevatedButton(
                      onPressed: () => _handleSignInUp(context, false),
                      style: elevatedButtonStyle,
                      child: const Text("رقم الهاتف"),
                    ),
                  )
                ],
              )
            ]
          )
        );
      }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEF9F6),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  IconButton(
                    hoverColor: const Color(0xFFFEF9F6),
                    highlightColor: const Color(0xFFFEF9F6),
                    onPressed: () => _handleLogoClick(context),
                    icon: Image.asset(
                      'images/logo.jpg',
                      fit: BoxFit.cover,
                      width: 90,
                      height: 90,
                    ),
                  ),
                  Positioned(
                    right: 50,
                    child: IconButton(
                      icon: const Icon(Icons.person_outline_rounded),
                      color: const Color(0xFFAD7765),
                      // TODO - make the "profile" thing
                      onPressed: () => _handleProfileClick(context),
                    )
                  ),
                  Positioned(
                    left: 50,
                    child: badges.Badge(
                      badgeStyle: const badges.BadgeStyle(
                        badgeColor: Color(0xFFF2E4D7)
                      ),
                      badgeContent: Text(widget.cartItems.toString()),
                      child: IconButton(
                        icon: const Icon(Icons.shopping_cart_outlined),
                        color: const Color(0xFFAD7765),
                        onPressed: () {
                          print("Added To Cart");
                        },
                      )
                    ),
                  ),
                  const Align(
                    alignment: Alignment.bottomCenter,
                    child: Divider(
                      thickness: 5,
                      height: 1,
                      color: Color(0xFFF2E4D7),
                    )
                  ),
                ],
              ),
            ),
            // Expanded(
            NavigationBar(
              height: 20,
              destinations: [
                ElevatedButton(
                  style: rectangularButtonStyle,
                  onPressed: () {
                    print("About");
                  },
                  child: const Text("من نحن")
                ),
                ElevatedButton(
                  style: rectangularButtonStyle,
                  onPressed: () {
                    print("Important Links");
                  },
                  child: const Text("روابط مهمة")
                ),
                ElevatedButton(
                  style: rectangularButtonStyle,
                  onPressed: () {
                    print("Contact Us");
                  },
                  child: const Text("تواصل معنا")
                ),
              ],
            ),
          ]
        )
      )
    );
  }

}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title, required this.cartItems});

  int cartItems;
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
        child: SharedAppBar(cartItems: widget.cartItems,)
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, // Number of columns in the grid
          crossAxisSpacing: 20.0, // Spacing between columns
          mainAxisSpacing: 20.0, // Spacing between rows
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return _buildItemCard(products[index] as Product);
        },
      ),
    );
  }

  void _handleCardClick(Product product) {
    print('Clicked on ${product.name}');
  }

  void addToCart() {
    setState(() {
      widget.cartItems++;
    });
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
          Text(
            product.name,
            style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          Text(
            product.price,
            style: const TextStyle(fontSize: 14.0),
          ),
          Row(
            children: [
              ElevatedButton(
                  style: elevatedButtonStyle,
                  onPressed: () {
                    print("Buy Now");
                  },
                  child: const Text("اشتر الآن")
              ),
              const SizedBox(width: 100,),
              IconButton(
                onPressed: addToCart,
                icon: const Icon(Icons.add_shopping_cart),
              ),
            ],
          )
        ],
      ),
    );
  }
}

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

// class ShoppingItemsPage extends StatefulWidget {
//   const ShoppingItemsPage({super.key});
//
//   @override
//   State<StatefulWidget> createState() => _ShoppingItemsPageState();
// }
//
// class _ShoppingItemsPageState extends State<ShoppingItemsPage> {
//
// }
