import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'signup.dart';
import 'enter_method.dart';

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

class SharedAppBar extends StatelessWidget {
  SharedAppBar({super.key});

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
    // Navigator.pop(context);
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
                          textDirection: TextDirection.ltr,
                          keyboardType: TextInputType.phone,
                            decoration: const InputDecoration(
                              labelText: "رقم الهاتف",
                              // hintText: 'your@email.com',
                              icon: Icon(Icons.phone),
                            ),
                        ),
                      TextFormField(
                        textDirection: TextDirection.ltr,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: "كلمة السر",
                          hintText: 'كلمة السر مكونة من 8 خانات على الأقل',
                          icon: Icon(Icons.message),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            actions: [
              ElevatedButton(
                onPressed: _submitForm,
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
            icon: Image.asset(
              'images/hijabi.png',
              // fit: BoxFit.fill,
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
                const Text("اختاري طريقة الدخول"),
                const SizedBox(height: 30,),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () => _handleSignInUp(context, true),
                      child: const Text("البريد الإلكتروني"),
                    ),
                    SizedBox(
                      width: 140,
                      child: ElevatedButton(
                        onPressed: () => _handleSignInUp(context, false),
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
    return Stack(
      alignment: Alignment.center,
      children: [
        IconButton(
          hoverColor: const Color(0xFFFEF9F6),
          highlightColor: const Color(0xFFFEF9F6),
          onPressed: () => _handleLogoClick(context),
          icon: Image.asset(
            'images/logo.jpg',
            fit: BoxFit.fill,
            width: 100,
            height: 100,
          ),
        ),
        Positioned(
          right: 50,
          child: IconButton(
            icon: const Icon(
              Icons.person_outline_rounded
            ),
            hoverColor: const Color(0xFFF2E4D7),
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
            badgeContent: const Text("0"),
            child: IconButton(
              icon: const Icon(
                Icons.shopping_cart_outlined
              ),
              hoverColor: const Color(0xFFF2E4D7),
              onPressed: () => {},
            )
          ),
        ),
        const Align(
          alignment: Alignment.bottomCenter,
          child: Divider(
            thickness: 2,
            color: Color(0xFFFEE9F6),
          )
        ),
      ],
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
      // body: ,
    );
  }
}
