import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:waste_exchange/presentation/misc/app_routes.dart';
import 'package:waste_exchange/presentation/misc/colors.dart';
import 'package:waste_exchange/presentation/misc/screen.dart';
import 'package:waste_exchange/presentation/misc/typography.dart';
import 'package:waste_exchange/presentation/providers/routes/router_provider.dart';
import 'package:waste_exchange/presentation/widgets/button/custom_button.dart';
import 'package:waste_exchange/presentation/widgets/textfield/custom_text_field.dart';

class ForgotPasswordPage extends ConsumerStatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  ConsumerState<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends ConsumerState<ForgotPasswordPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.only(top: 36),
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: () => ref.read(routerProvider).pop(),
              icon: SvgPicture.asset("assets/icons/arrow-left.svg"),
            ),
          ),
          const SizedBox(height: 12),
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Forgot Password",
                    style: Typogaphy.SemiBold.copyWith(fontSize: 20),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Please enter your email to reset the password",
                    style: Typogaphy.SemiBold.copyWith(
                      fontSize: 16,
                      color: AppColors.primarySoft,
                    ),
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    label: "Email",
                    hintText: "youremail@email.com",
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      const emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                      final regExp = RegExp(emailPattern);
                      if (!regExp.hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: AppScreens.width,
                    child: CustomButton(
                      title: "Reset Password",
                      onPressed: () {
                        ref.read(routerProvider).push(Routes.OTP);
                        if (_formKey.currentState!.validate()) {}
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
