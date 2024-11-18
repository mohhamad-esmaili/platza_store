import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:platza_store/core/config/app_router.dart';
import 'package:platza_store/core/gen/assets.gen.dart';
import 'package:platza_store/core/utils/textfield_extension.dart';
import 'package:platza_store/core/utils/textfield_validators.dart';
import 'package:platza_store/core/widgets/custom_button.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final TextEditingController _nameTextEditingController =
      TextEditingController();
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _passTextEditingController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final FocusNode _nameFocusNode = FocusNode();

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passFocusNode = FocusNode();
  bool _isPasswordVisible = true;
  @override
  void dispose() {
    super.dispose();
    _nameTextEditingController.dispose();
    _emailTextEditingController.dispose();
    _passTextEditingController.dispose();
    _nameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passFocusNode.dispose();
  }

  void _onSubmit() {
    if (_formKey.currentState?.validate() == true) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            _emailFocusNode.unfocus();
            _passFocusNode.unfocus();
            _nameFocusNode.unfocus();
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
                        Gap(30),
                        const Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Gap(40),
                        //TODO: SHOULD GET AN AVATAR FROM USER
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black54, width: 5),
                          ),
                          child: CircleAvatar(
                            radius: 60,
                            backgroundImage: Assets.images.avatar.provider(),
                          ),
                        ),
                        const Gap(5),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: const Text(
                            "Welcome to Platza Store\ncreate your account.",
                            softWrap: true,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        const Gap(5),
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
                                  keyboardType: TextInputType.name,
                                  validator: TextfieldValidators.nameValidator,
                                  focusNode: _nameFocusNode,
                                  onFieldSubmitted: (value) =>
                                      _emailFocusNode.requestFocus(),
                                  decoration: const InputDecoration()
                                      .platzaInputDecoration(
                                    textFieldLabel: "Name",
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 5,
                                ),
                                child: TextFormField(
                                  autocorrect: true,
                                  controller: _emailTextEditingController,
                                  keyboardType: TextInputType.emailAddress,
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
                                  keyboardType: TextInputType.visiblePassword,
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
                                  title: "SignUp",
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
                            title: "Login",
                            outlineMode: true,
                            onTap: () => Get.offAndToNamed(AppRouter.signInUrl),
                          ),
                        ),
                        Gap(30)
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
