import 'package:flexfund_app/authentication/login.dart';
import 'package:flexfund_app/theme/color_theme.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController controller = TextEditingController();
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
                    Container(
                      margin: const EdgeInsets.only(right: 10, bottom: 10),
                      child: Image.asset('assets/intro_image.png'),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome!",
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
                      decoration: FlexFundTheme.textFieldDecoration(
                        labelText: 'Enter email address',
                        prefixIcon: Icons.email_outlined,
                      ),
                      onChanged: (value) {
                        setState(() {
                          finalPassword = value;
                        });
                      },
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
                    const SizedBox(height: 30),
                    TextFormField(
                      controller: passwordController,
                      obscureText: _obscurePassword,
                      decoration: FlexFundTheme.textFieldDecoration(
                        labelText: 'Re-enter password',
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
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: FlexFundTheme.primaryGreen,

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          "Create Account",
                          style: FlexFundTheme.buttonText,
                        ),
                      ),
                    ),
                    const SizedBox(height: 60),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: RichText(
                          text: TextSpan(
                            text: "Already have an account? ",
                            style: const TextStyle(color: Colors.black),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Login',
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
