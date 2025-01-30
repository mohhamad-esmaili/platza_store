import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:platza_store/app/routes/app_pages.dart';

import 'package:platza_store/app/gen/assets.gen.dart';
import 'package:platza_store/app/utils/textfield_extension.dart';
import 'package:platza_store/app/utils/textfield_validators.dart';
import 'package:platza_store/app/widgets/custom_button.dart';

class SigninView extends StatefulWidget {
  const SigninView({super.key});

  @override
  State<SigninView> createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView> {
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _passTextEditingController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passFocusNode = FocusNode();
  bool _isPasswordVisible = true;
  @override
  void dispose() {
    super.dispose();
    _emailTextEditingController.dispose();
    _passTextEditingController.dispose();
    _emailFocusNode.dispose();
    _passFocusNode.dispose();
  }

  void _onSubmit() {
    if (_formKey.currentState?.validate() == true) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            _emailFocusNode.unfocus();
            _passFocusNode.unfocus();
          },
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                Positioned(
                  top: -100,
                  left: -260,
                  child: Assets.images.blob1.svg(
                    width: 600,
                    colorFilter: ColorFilter.mode(
                      const Color(0xffFF7A00).withOpacity(0.4),
                      BlendMode.dstIn,
                    ),
                  ),
                ),
                Positioned(
                  bottom: -200,
                  right: -400,
                  child: Assets.images.blob2.svg(
                    colorFilter: ColorFilter.mode(
                      const Color(0xffFF7A00).withOpacity(0.4),
                      BlendMode.dstIn,
                    ),
                  ),
                ),
                Center(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Sign In",
                          style: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Gap(40),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: const Text(
                            "Welcome back 👋🏻, login to your account.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        const Gap(10),
                        Form(
                          key: _formKey,
                          autovalidateMode: AutovalidateMode.always,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 5,
                                ),
                                child: TextFormField(
                                  autocorrect: true,
                                  controller: _emailTextEditingController,
                                  validator: TextfieldValidators.emailValidator,
                                  focusNode: _emailFocusNode,
                                  onFieldSubmitted: (value) =>
                                      _passFocusNode.requestFocus(),
                                  decoration: const InputDecoration()
                                      .platzaInputDecoration(
                                    textFieldLabel: "Email",
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 5,
                                ),
                                child: TextFormField(
                                  controller: _passTextEditingController,
                                  focusNode: _passFocusNode,
                                  obscureText: _isPasswordVisible,
                                  validator:
                                      TextfieldValidators.passwordValidator,
                                  onFieldSubmitted: (value) => _onSubmit(),
                                  decoration: const InputDecoration()
                                      .platzaInputDecoration(
                                    textFieldLabel: "Password",
                                    suffixWidget: IconButton(
                                      icon: AnimatedSwitcher(
                                        duration:
                                            const Duration(milliseconds: 300),
                                        switchInCurve: Curves.bounceIn,
                                        child: _isPasswordVisible
                                            ? Icon(
                                                key: const ValueKey("1"),
                                                Icons.visibility,
                                              )
                                            : Icon(
                                                key: const ValueKey("2"),
                                                Icons.visibility_off,
                                              ),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _isPasswordVisible =
                                              !_isPasswordVisible;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              Gap(10),
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 5,
                                ),
                                child: CustomButton(
                                  title: "Login",
                                  onTap: _onSubmit,
                                ),
                              )
                            ],
                          ),
                        ),
                        Text(
                          "or",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 5,
                          ),
                          child: CustomButton(
                            title: "SignUp",
                            outlineMode: true,
                            onTap: () => Get.offAndToNamed(AppRoutes.signUpUrl),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
