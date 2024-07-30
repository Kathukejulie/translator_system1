import 'package:flutter/material.dart';
import 'package:translator_app/constants/const.dart';
import 'package:translator_app/constants/globals.dart';
import 'package:translator_app/routes.dart';
import 'package:translator_app/widgets/main.dart';

class SignUpSection extends StatefulWidget {
  SignUpSection({super.key});

  @override
  State<SignUpSection> createState() => _SignUpSectionState();
}

class _SignUpSectionState extends State<SignUpSection> {
  // String email;
  String? _language;

  bool _isWriter = false;

  // String phoneNumber;
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
              color: myPrimaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Text(
                      //   'Translator App',
                      //   style: TextStyle(
                      //       color: textColor,
                      //       fontSize: 25,
                      //       fontWeight: FontWeight.bold),
                      // ),
                      // const SizedBox(height: 25.0),
                      TextField(
                        style: TextStyle(
                          color: textColor,
                          fontSize: 14,
                        ),
                        decoration: const InputDecoration(
                          labelText: 'Full names',
                          labelStyle: TextStyle(color: Colors.grey),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                        onChanged: (value) {
                          authenticationController.fullName.value = value;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      TextField(
                        style: TextStyle(
                          color: textColor,
                          fontSize: 14,
                        ),
                        decoration: const InputDecoration(
                          labelText: 'Email',
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
                        decoration: const InputDecoration(
                          labelText: 'Phone Number',
                          labelStyle: TextStyle(color: Colors.grey),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                        onChanged: (value) {
                          authenticationController.phoneNumber.value = value;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      DropdownButtonFormField<String>(
                        dropdownColor: myThirdColor,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0,
                          color: Colors.grey,
                        ),
                        value: _language,
                        onChanged: (value) {},
                        items: const [
                          DropdownMenuItem(
                            value: 'Choose Expertise Language',
                            child: Text('Choose Expertise Language'),
                          ),
                          DropdownMenuItem(
                            value: 'English (US)',
                            child: Text('English (US)'),
                          ),
                          DropdownMenuItem(
                            value: 'France (Fr)',
                            child: Text('France (Fr)'),
                          ),
                          DropdownMenuItem(
                            value: 'Kiswahili (KE)',
                            child: Text('Kiswahili (KE)'),
                          ),
                          // Add more languages here
                        ],
                        decoration: const InputDecoration(
                          hintText: 'Expertise Language',
                          hintStyle: TextStyle(
                            // fontWeight: FontWeight.bold,
                            fontSize: 12.0,
                            color: Colors.grey,
                          ),
                        ),
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
                      TextField(
                        style: TextStyle(
                          color: textColor,
                          fontSize: 14,
                        ),
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Confirm Password',
                          labelStyle: TextStyle(color: Colors.grey),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                        onChanged: (value) {
                          authenticationController.passwordTwo.value = value;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      Row(
                        children: [
                          customText(
                            text: 'Are you a Translator?',
                            weight: FontWeight.bold,
                            font: 12.0,
                            textColor: Colors.grey,
                          ),
                          const SizedBox(width: 16.0),
                          Switch(
                            value: _isWriter,
                            onChanged: (value) {
                              setState(() {
                                _isWriter = value;
                              });
                              authenticationController.isWriter.value = value;
                            },
                          ),
                        ],
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
                          authenticationController.registerUser();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: mySecondaryColor,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)))),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Sign Up',
                            style: TextStyle(color: textColor),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      TextButton(
                        onPressed: () =>
                            Navigator.of(context).pushReplacementNamed(signin),
                        child: Text(
                          "Already have an account? Login Here",
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
