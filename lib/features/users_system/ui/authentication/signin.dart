import 'package:flutter/material.dart';
import 'package:translator_app/constants/const.dart';
import 'package:translator_app/constants/globals.dart';
import 'package:translator_app/routes.dart';

class SignInSection extends StatefulWidget {
  const SignInSection({super.key});

  @override
  State<SignInSection> createState() => _SignInSectionState();
}

class _SignInSectionState extends State<SignInSection> {
  String _role = "Translator";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: textColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.4,
            decoration: BoxDecoration(
                color: myPrimaryColor, borderRadius: BorderRadius.circular(20)),
            child: Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Localisation Project Tracker',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: textColor,
                            fontSize: 45,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 40.0),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _buildRoleOption("Translator"),
                            const SizedBox(width: 10),
                            _buildRoleOption("Project Manager"),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Text(
                        'Signing in as: $_role',
                        style: TextStyle(color: textColor, fontSize: 16),
                      ),
                      const SizedBox(height: 40.0),
                      TextField(
                        style: TextStyle(
                          color: textColor,
                          fontSize: 14,
                        ),
                        decoration: InputDecoration(
                          labelText: '$_role Email',
                          labelStyle: TextStyle(color: Colors.grey),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                        onChanged: (value) {
                          authenticationController.email.value = value;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      TextField(
                        style: TextStyle(
                          color: textColor,
                          fontSize: 14,
                        ),
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(color: Colors.grey),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                        onChanged: (value) {
                          authenticationController.password.value = value;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      // Row(
                      //   children: [
                      //     // Checkbox(
                      //     //   value: false,
                      //     //   onChanged: (value) {},
                      //     //   activeColor: Colors.blue,
                      //     // ),
                      //     // const Text(
                      //     //   'Remember me',
                      //     //   style: TextStyle(color: Colors.grey),
                      //     // ),
                      //     const Spacer(),
                      //     TextButton(
                      //       onPressed: () {},
                      //       child: const Text(
                      //         'Forgot password?',
                      //         style: TextStyle(color: Colors.orange),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      const SizedBox(height: 16.0),
                      ElevatedButton(
                        onPressed: () async {
                          await authenticationController.signinUser(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: mySecondaryColor,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Sign In',
                            style: TextStyle(color: textColor),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      TextButton(
                        onPressed: () =>
                            Navigator.of(context).pushReplacementNamed(signup),
                        child: Text(
                          "Don't have an account yet? Register Here",
                          style: TextStyle(color: textColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRoleOption(String role) {
    bool isSelected = _role == role;
    return GestureDetector(
      onTap: () {
        setState(() {
          _role = role;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected ? mySecondaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          role,
          style: TextStyle(
            color: isSelected ? textColor : Colors.black,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}

class PasswordResetScreen extends StatefulWidget {
  const PasswordResetScreen({super.key});

  @override
  _PasswordResetScreenState createState() => _PasswordResetScreenState();
}

class _PasswordResetScreenState extends State<PasswordResetScreen> {
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reset Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Enter your email address',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                hintText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Implement password reset functionality here
                print('Reset password for ${_emailController.text}');
              },
              child: const Text('Send Reset Link'),
            ),
          ],
        ),
      ),
    );
  }
}
