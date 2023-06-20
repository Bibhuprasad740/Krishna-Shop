// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../utilities/constants.dart';
import '../../../utilities/stock_colors.dart';
import '../../../utilities/utility_functions.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_divider.dart';
import '../../widgets/custom_field.dart';
import '../../widgets/custom_progress_indicator.dart';
import '../../widgets/social_button.dart';
import './sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;

  void nativateToSignUpScreen() async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SignUpScreen(),
      ),
    );
  }

  void signInUser() async {
    setState(() {
      isLoading = true;
    });

    String result = await C.authController.signIn(
      email: _emailController.text,
      password: _passwordController.text,
    );
    if (result == C.success) {
      Utils.showSnackBar(
        context: context,
        message: 'Logged in successfully',
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
                // decoration: const BoxDecoration(
                //   image: DecorationImage(
                //     image: AssetImage('assets/images/background.jpg'),
                //     opacity: 0.5,
                //     fit: BoxFit.cover,
                //   ),
                // ),
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
                          height: size.height * 0.5,
                          width: size.width * 0.9,
                          decoration: BoxDecoration(
                            // color: Colors.orange,
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
                              // SIGN-IN TEXT
                              const Text(
                                'Sign-In',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 33,
                                ),
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
                              // SIGN-IN BUTTON
                              CustomButton(
                                color: SC.accent1,
                                onTap: signInUser,
                                isLoading: isLoading,
                                title: 'Sign-In',
                              ),
                              Row(
                                children: [
                                  const Text('Sign-In with '),
                                  SocialButton(
                                    icon: FontAwesomeIcons.google,
                                    onTap: () {},
                                    name: 'Gmail',
                                    color: SC.google,
                                    isLoading: isLoading,
                                  ),
                                  const SizedBox(width: 10),
                                  SocialButton(
                                    icon: FontAwesomeIcons.facebook,
                                    onTap: () {},
                                    name: 'Facebook',
                                    color: SC.facebook,
                                    isLoading: isLoading,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        const Row(
                          children: [
                            CustomDivider(),
                            Text(' Don\'t have an account? '),
                            CustomDivider(),
                          ],
                        ),
                        CustomButton(
                          color: SC.accent1,
                          onTap: nativateToSignUpScreen,
                          title: 'Create an account',
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
