import 'package:flutter/material.dart';
import 'package:noor_alfadela_shopping_website/main.dart' as mpage;

class EnterMethodPage extends StatefulWidget {
  const EnterMethodPage({super.key, required this.title});

  final String title;

  @override
  State<EnterMethodPage> createState() => _EnterMethodPageState();
}

class _EnterMethodPageState extends State<EnterMethodPage> {

  bool _visibleSignInUpMethod = true;
  bool _visiblePhoneSignInUp = false;
  bool _visibleEmailSignInUp = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  void _handleEmailSignInUp() {
    _visibleSignInUpMethod = false;
    _visibleEmailSignInUp = true;

  }

  void _handlePhoneSignInUp() {
    _visibleSignInUpMethod = false;
    _visiblePhoneSignInUp = true;

  }


  @override
  Widget build(BuildContext context){
    return  Scaffold(
      backgroundColor: const Color(0xFFFEF9F6),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: mpage.SharedAppBar(),
      ),
      body: Stack(
        alignment: Alignment.center,
          children: [
            Positioned(
              top: 50,
              child: Image.asset(
                'images/hijabi.jpg',
                fit: BoxFit.fill,
                width: 100,
                height: 100,
              )
        // Icon(Icons.person_outline_rounded, size: 100,),
            ),

            if (_visibleSignInUpMethod)
              const Positioned(
                top: 170,
                child: Text("اختاري طريقة الدخول")
                  //, style: TextStyle(fontFamily: "Amiri"),)
              ),
              Positioned(
                top: 220,
                child: ElevatedButton(
                  onPressed: () => _handleEmailSignInUp(),
                  child: const Text("البريد الإلكتروني"),
                )
              ),
              Positioned(
                  top: 260,
                  width: 140,
                  child: ElevatedButton(
                    onPressed: () => _handlePhoneSignInUp(),
                    child: const Text("رقم الهاتف"),
                  )
              )
            ,
            if (_visibleEmailSignInUp)
              Positioned(
                top: 200,
                width: 350,
                child: Row(
                  children: [
                    const Icon(Icons.email_outlined),
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || (value.isEmpty)) {
                          return 'الرجاء كتابة البريد الإلكتروني';
                        }
                        if (!value.contains(RegExp(r'.+@.+\..+'))){
                          return 'example@gmail.com';
                        }
                        // emailValue = value;
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'البريد الإلكتروني',
                        hintText: 'your@email.com',
                      ),
                    ),
                  ]
                )
              ),
            if (_visiblePhoneSignInUp)
              Positioned(
                top: 230,
                width: 350,
                child: Row(
                  children: [
                    const Icon(Icons.phone_android_outlined),
                    TextFormField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'رقم الهاتف',
                      ),
                    ),
                  ]
                )
              )

          ]
      ),
    );
  }
}