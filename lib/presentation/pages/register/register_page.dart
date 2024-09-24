import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waste_exchange/domain/usecases/register/register_params.dart';
import 'package:waste_exchange/presentation/misc/colors.dart';
import 'package:waste_exchange/presentation/misc/typography.dart';
import 'package:waste_exchange/presentation/providers/routes/router_provider.dart';
import 'package:waste_exchange/presentation/providers/user_data/user_data_provider.dart';
import 'package:waste_exchange/presentation/widgets/button/custom_button.dart';
import 'package:waste_exchange/presentation/widgets/textfield/custom_text_field.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<RegisterPage> createState() => _SigninPageState();
}

class _SigninPageState extends ConsumerState<RegisterPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController = TextEditingController();

  bool _isTermsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 35 / 100,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(left: 32),
            decoration: BoxDecoration(
              gradient: AppColors.primaryGradient,
              image: const DecorationImage(
                image: AssetImage('assets/images/pattern-1-1.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Uniguard\nWaste Exchange App",
                  style: Typogaphy.SemiBold.copyWith(
                    fontSize: 28,
                    color: Colors.white,
                    height: 150 / 100,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            padding: const EdgeInsets.only(left: 20, right: 20, top: 36, bottom: 36),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 24),
                  child: Text(
                    'Register',
                    style: Typogaphy.SemiBold.copyWith(
                      fontSize: 18,
                    ),
                  ),
                ),
                CustomTextField(
                  label: "Name",
                  hintText: "Full Name",
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  label: "Phone Number",
                  hintText: "+62....",
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  label: "Email",
                  hintText: "youremail@email.com",
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  label: "Password",
                  hintText: "*************",
                  obscureText: true,
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  label: "Password Confirmation",
                  hintText: "*************",
                  obscureText: true,
                  controller: passwordConfirmController,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                ),
                const SizedBox(height: 16),
                // Checkbox for Terms and Conditions
                Row(
                  children: [
                    Checkbox(
                      value: _isTermsAccepted,
                      onChanged: (value) {
                        setState(() {
                          _isTermsAccepted = value ?? false;
                        });
                      },
                    ),
                    const Text("I accept the Terms and Conditions"),
                  ],
                ),
                const SizedBox(height: 16),
                switch (ref.watch(userDataProvider)) {
                  AsyncData(:final value) => value == null
                      ? SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: CustomButton(
                            onPressed: _isTermsAccepted
                                ? () async {
                                    ref.read(userDataProvider.notifier).register(
                                        params: RegisterParams(
                                            name: nameController.text,
                                            email: emailController.text,
                                            password: passwordController.text));
                                  }
                                : null, // Disable button if checkbox not checked
                            title: 'Register',
                          ),
                        )
                      : const Center(
                          child: CircularProgressIndicator(),
                        ),
                  _ => const Center(
                      child: CircularProgressIndicator(),
                    ),
                },
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account? "),
                    TextButton(
                      onPressed: () {
                        ref.read(routerProvider).pop();
                      },
                      child: Text(
                        'Login here',
                        style: Typogaphy.SemiBold,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}