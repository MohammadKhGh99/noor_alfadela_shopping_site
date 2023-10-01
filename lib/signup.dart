import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key, required this.title});

  final String title;

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _zipController = TextEditingController();

  // String emailValue = '';
  // String phoneValue = '';


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

  void _handleLogoClick(BuildContext context) {
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: const Color(0xFFFEF9F6),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100.0), // Adjust the height as
          // needed

          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                  left: 0,
                  child: IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios_new),
                  )
              ),
              IconButton(
                hoverColor: const Color(0xFFFEF9F6),
                highlightColor: const Color(0xFFFEF9F6),
                onPressed: () => _handleLogoClick(context),
                icon: Image.asset(
                  'images/logo.jpg', // Replace with your image asset path
                  fit: BoxFit.fill,
                  width: 100,
                  height: 100,
                ),
              )
            ],
          ),

        ),
        body: SingleChildScrollView(
            child: Form(
                key: _formKey,
                child: Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                        width: 400,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppBar(
                              backgroundColor: const Color(0xFFFEF9F6),
                              title: Text(widget.title),
                              centerTitle: true,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: TextFormField(
                                controller: _nameController,
                                keyboardType: TextInputType.name,
                                validator: (value) {
                                  if (value == null || (value.isEmpty)) {
                                    return 'الرجاء كتابة الإسم';
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'الإسم',
                                ),

                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: TextFormField(
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
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: TextFormField(
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: true,
                                validator: (value) {
                                  if (value == null || value.isEmpty || value.length
                                      < 8) {
                                    return 'الرجاء كتابة كلمة السر';
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'كلمة السر',
                                    hintText: 'كلمة السر مكونة من 8 خانات على الأقل'
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: TextFormField(
                                keyboardType: TextInputType.phone,
                                // validator: (value) {
                                //   if (value == null || (value.isEmpty)) {
                                //     return 'الرجاء كتابة البريد الإلكتروني';
                                //   }
                                //   if (!value.contains(RegExp(r'.+@.+\..+'))){
                                //     return 'example@gmail.com';
                                //   }
                                //   emailValue = value;
                                //   return null;
                                // },
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'رقم الهاتف',
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'البلد',
                                  // hintText: 'Enter City'
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: TextFormField(
                                keyboardType: TextInputType.streetAddress,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'إسم الشارع',
                                  // hintText: 'Enter Street Name'
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'الرمز البريدي',
                                  // hintText: 'Enter ZIP Code'
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: _submitForm,
                              child: const Text("تسجيل الدخول")
                            )
                          ]
                        )
                    )
                )
              // )
            )
        )
    );
  }
}
