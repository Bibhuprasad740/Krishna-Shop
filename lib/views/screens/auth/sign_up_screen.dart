// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

import '../../../utilities/constants.dart';
import '../../../utilities/stock_colors.dart';
import '../../../utilities/utility_functions.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_divider.dart';
import '../../widgets/custom_field.dart';
import '../../widgets/custom_progress_indicator.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  bool isLoading = false;

  void signUpUser() async {
    setState(() {
      isLoading = true;
    });
    String result = await C.authController.signUpUser(
      name: _nameController.text,
      email: _emailController.text,
      password: _passwordController.text,
      phoneNumber: _phoneNumberController.text,
    );

    if (result == C.success) {
      Utils.showSnackBar(
        context: context,
        message: 'Account created successfully',
      );
      // Navigator.of(context).pushReplacement(
      //   MaterialPageRoute(
      //     builder: (_) => const HomeScreen(),
      //   ),
      // );
    } else {
      Utils.showSnackBar(
        context: context,
        message: result,
        isError: true,
      );
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _phoneNumberController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = Utils.getScreenSize(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              isLoading ? const CustomProgressIndicator() : const SizedBox(),
              SizedBox(
                height: size.height,
                width: size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // LOGO SECTION
                        Hero(
                          tag: 'logo',
                          child: Image.asset(
                            C.logoLight,
                            height: size.height * 0.10,
                          ),
                        ),
                        // CONTAINER FOR SIGNIN FIELDS
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          height: size.height * 0.6,
                          width: size.width * 0.9,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: SC.border,
                              width: 1,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // SIGN-UP TEXT
                              const Text(
                                'Sign-Up',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 33,
                                ),
                              ),
                              // NAME TEXTFIELD
                              CustomField(
                                title: 'Name',
                                hintText: 'Enter your name',
                                controller: _nameController,
                                inputType: TextInputType.text,
                              ),
                              // EMAIL TEXTFIELD
                              CustomField(
                                title: 'Email',
                                hintText: 'Enter your email',
                                controller: _emailController,
                                inputType: TextInputType.emailAddress,
                              ),
                              // PASSWORD TEXTFIELD
                              CustomField(
                                title: 'Password',
                                hintText: 'Enter your password',
                                controller: _passwordController,
                                isPassword: true,
                              ),
                              // PHONE NUMBER TEXTFIELD
                              CustomField(
                                title: 'Phone Number',
                                hintText: 'Enter your phone number',
                                controller: _phoneNumberController,
                                inputType: TextInputType.phone,
                              ),
                              // SIGN-IN BUTTON
                              CustomButton(
                                color: SC.accent1,
                                onTap: signUpUser,
                                isLoading: isLoading,
                                title: 'Sign-Up',
                              ),
                            ],
                          ),
                        ),
                        const Row(
                          children: [
                            CustomDivider(),
                            Text(' Already have an account? '),
                            CustomDivider(),
                          ],
                        ),
                        CustomButton(
                          color: SC.accent1,
                          onTap: () {
                            Navigator.pop(context);
                          },
                          title: 'Return to login',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
