import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.blue,
              Colors.pink,
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _inputField("Email", _emailController),
              SizedBox(height: 20),
              _inputField("Password", _passwordController, isPassword: true),
              SizedBox(height: 20),
              _inputField("Phone Number", _phoneNumberController),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Implement sign up functionality here
                  String email = _emailController.text;
                  String password = _passwordController.text;
                  String phoneNumber = _phoneNumberController.text;

                  // You can handle the sign-up logic here
                  debugPrint("Email: $email");
                  debugPrint("Password: $password");
                  debugPrint("Phone Number: $phoneNumber");
                },
                child: Text("Sign Up"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _inputField(String hintText, TextEditingController controller,
      {bool isPassword = false}) {
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.white),
    );

    return TextField(
      style: TextStyle(color: Colors.white),
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white),
        enabledBorder: border,
        focusedBorder: border,
      ),
      obscureText: isPassword,
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(), // Ensure background covers full screen
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.blue,
              Colors.red,
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30), // Add margins
              child: _page(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _page() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _icon(),
        const SizedBox(height: 30),
        _inputField("Username", _usernameController),
        const SizedBox(height: 10),
        _inputField("Password", _passwordController, isPassword: true),
        const SizedBox(height: 30),
        _loginBtn(),
        const SizedBox(height: 10),
        _signUpBtn(),
        const SizedBox(height: 10),
        _extraText(),
      ],
    );
  }

  Widget _icon() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 2),
        shape: BoxShape.circle,
      ),
      child: const Icon(Icons.person, color: Colors.white, size: 120),
    );
  }

  Widget _inputField(String hintText, TextEditingController controller,
      {bool isPassword = false}) {
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.white),
    );

    return Padding( // Add padding for left and right margins
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        style: const TextStyle(color: Colors.white),
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white),
          enabledBorder: border,
          focusedBorder: border,
        ),
        obscureText: isPassword,
      ),
    );
  }

  Widget _loginBtn() {
    return ElevatedButton(
      onPressed: () {
        debugPrint("Username: " + _usernameController.text);
        debugPrint("Password: " + _passwordController.text);
      },
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        backgroundColor: Color.fromARGB(255, 228, 226, 226),
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
      child: const Text(
        "Sign in",
        style: TextStyle(fontSize: 20),
      ),
    );
  }

  Widget _signUpBtn() {
    return TextButton(
      onPressed: () {
        // Navigate to sign up page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SignUpPage()),
        );
      },
      child: const Text(
        "Sign Up",
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }

  Widget _extraText() {
    return const Text(
      "Can't access to your account.",
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 16, color: Colors.white),
    );
  }
}
