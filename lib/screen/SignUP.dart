import 'package:flutter/material.dart';
import 'package:to_do_list/const/colors.dart';
import 'package:to_do_list/data/auth_data.dart';

class SignUp_Screen extends StatefulWidget {
  final VoidCallback show;
  const SignUp_Screen(this.show, {super.key});

  @override
  State<SignUp_Screen> createState() => _SignUp_ScreenState();
}

class _SignUp_ScreenState extends State<SignUp_Screen> {
  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  final FocusNode _focusNode3 = FocusNode();

  final email = TextEditingController();
  final password = TextEditingController();
  final PasswordConfirm = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _focusNode1.addListener(() {
      setState(() {});
    });
    _focusNode2.addListener(() {
      setState(() {});
    });
    _focusNode3.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColors,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              image(),
              const SizedBox(height: 50),
              textfield(email, _focusNode1, 'Email', Icons.email),
              const SizedBox(height: 10),
              textfield(password, _focusNode2, 'Mot de Passe', Icons.password),
              const SizedBox(height: 10),
              textfield(PasswordConfirm, _focusNode3, 'Confirmation Mot de Passe',
                  Icons.password),
              const SizedBox(height: 8),
              account(),
              const SizedBox(height: 20),
              SignUP_bottom(),
              const SizedBox(height: 200),
              Text('Sami MASMOUDI 2AINFO2'),
            ],
          ),
        ),
      ),
    );
  }

  Widget account() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "Vous avez deja un compte ?",
            style: TextStyle(color: Colors.grey[700], fontSize: 14),
          ),
          const SizedBox(width: 5),
          GestureDetector(
            onTap: widget.show,
            child: const Text(
              'Se Connecter',
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ),


        ],

      ),

    );
  }

  Widget SignUP_bottom() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70),
      child: GestureDetector(
        onTap: () {
          AuthenticationRemote()
              .register(email.text, password.text, PasswordConfirm.text);
        },
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            color: custom_green,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Text(
            'S\'inscrire',
            style: TextStyle(
              color: Colors.white,
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget textfield(TextEditingController controller, FocusNode focusNode,
      String typeName, IconData iconss) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
          controller: controller,
          focusNode: focusNode,
          style: const TextStyle(fontSize: 18, color: Colors.black),
          decoration: InputDecoration(
              prefixIcon: Icon(
                iconss,
                color: focusNode.hasFocus ? custom_green : const Color(0xffc5c5c5),
              ),
              contentPadding:
              const EdgeInsets.symmetric(horizontal: 70, vertical: 15),
              hintText: typeName,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Color(0xffc5c5c5),
                  width: 2.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: custom_green,
                  width: 2.0,
                ),
              )),
        ),
      ),
    );
  }

  Widget image() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70),
      child: FractionallySizedBox(
        widthFactor: 1.0,
        child: Container(
          height: MediaQuery.of(context).size.height / 4,
          color: backgroundColors, // Ensure you define backgroundColors
          child: Image.asset(
            'assets/images/7.png',
            fit: BoxFit.contain,
          ),
        ),
      ),
    );}
}