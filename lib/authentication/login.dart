import 'package:flexfund_app/authentication/signup.dart';
import 'package:flexfund_app/dashboard/bottom_navigation/bottom_navbar.dart';
import 'package:flexfund_app/services/api_service.dart';
import 'package:flexfund_app/theme/color_theme.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String phoneNoController = '';
  String finalPassword = '';

  String initialCountry = 'KE';
  bool _obscurePassword = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome!!",
                          style: FlexFundTheme.headlineMedium.copyWith(
                            color: FlexFundTheme.primaryGreen,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Please fill in the correct details",
                          style: FlexFundTheme.headlineSmall,
                        ),
                      ],
                    ),

                    SizedBox(height: 20),
                    TextFormField(
                      controller: emailcontroller,
                      decoration: FlexFundTheme.textFieldDecoration(
                        labelText: 'Enter email address',
                        prefixIcon: Icons.email_outlined,
                      ),
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      controller: passwordController,
                      obscureText: _obscurePassword,
                      decoration: FlexFundTheme.textFieldDecoration(
                        labelText: 'Enter password',
                        prefixIcon: Icons.password,
                        suffixIcon:
                            _obscurePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                        suffixIconOnPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                      onChanged: (value) {
                        setState(() {
                          finalPassword = value;
                        });
                      },
                    ),
                    SizedBox(height: 40),
                    SizedBox(
                      height: 48,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          final name = passwordController.text.trim();
                          final email = emailcontroller.text.trim();

                          if (email.isEmpty || name.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Please enter both email and password',
                                ),
                              ),
                            );
                            return;
                          }

                          final apiService = ApiService(
                            'https://fundraise-3fdcd0d20b2d.herokuapp.com',
                          );

                          try {
                            final result = await apiService.createUser(
                              email,
                              name,
                            );
                            // Optionally check result contents
                            print('Login Success: $result');

                            // Navigate to dashboard
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BottomNavBar(),
                              ),
                            );
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Login failed: $e')),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: FlexFundTheme.primaryGreen,

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text("Login", style: FlexFundTheme.buttonText),
                      ),
                    ),
                    const SizedBox(height: 60),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUp()),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: RichText(
                          text: TextSpan(
                            text: "Don't have an account yet? ",
                            style: const TextStyle(color: Colors.black),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Signup',
                                style: TextStyle(
                                  color: FlexFundTheme.primaryGreen,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
