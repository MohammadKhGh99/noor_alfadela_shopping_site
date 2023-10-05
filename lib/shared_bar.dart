import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart' as awesome;
import 'package:badges/badges.dart' as badges;


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
  SharedAppBar({super.key});

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

  int cartItems = 0;

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
              backgroundColor: const Color(0xFFFEF9F6),
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

  void addToCart() {
    setState(() {
      cartItems++;
    });
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
                      badgeContent: Text('$cartItems'),
                      child: IconButton(
                        icon: const Icon(
                            Icons.shopping_cart_outlined
                        ),
                        hoverColor: const Color(0xFFF2E4D7),
                        onPressed: addToCart,
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
                  style: ElevatedButton.styleFrom(
                    // backgroundColor: const Color(0xFFFEF9F6),
                    // disabledBackgroundColor: const Color(0xFFFEF9F6),
                    // shadowColor: const Color(0xFFFEF9F6),
                    foregroundColor: const Color(0xFFAD7765),
                    surfaceTintColor: const Color(0xFFFEF9F6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  onPressed: () {
                    print("About");
                  },
                  child: const Text("من نحن")
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: const Color(0xFFAD7765),
                    surfaceTintColor: const Color(0xFFFEF9F6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  onPressed: () {
                    print("Important Links");
                  },
                  child: const Text("روابط مهمة")
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: const Color(0xFFAD7765),
                    surfaceTintColor: const Color(0xFFFEF9F6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  onPressed: () {
                    print("Contact Us");
                  },
                  child: const Text("تواصل معنا")
                ),

              ],
            ),
            // )
          ]
        )
      )
    );
  }

}