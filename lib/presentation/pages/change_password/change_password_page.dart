import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waste_exchange/domain/usecases/change_password/change_password_params.dart';
import 'package:waste_exchange/presentation/extensions/build_context_extension.dart';
import 'package:waste_exchange/presentation/misc/screen.dart';
import 'package:waste_exchange/presentation/providers/api/user_change_password_provider.dart';
import 'package:waste_exchange/presentation/providers/routes/router_provider.dart';
import 'package:waste_exchange/presentation/widgets/button/custom_button.dart';
import 'package:waste_exchange/presentation/widgets/common/custom_app_bar.dart';
import 'package:waste_exchange/presentation/widgets/textfield/custom_text_field.dart';

class ChangePasswordPage extends ConsumerStatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  ConsumerState<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends ConsumerState<ChangePasswordPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _retypePasswordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _retypePasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      userChangePasswordProvider,
      (previous, next) {
        if (next is AsyncData && next.value != null) {
          context.showSnackBar("Profile updated successfully!");

          _oldPasswordController.clear();
          _newPasswordController.clear();
          _retypePasswordController.clear();

          ref.read(routerProvider).pop();
        } else if (next is AsyncError) {
          context.showSnackBar("${next.error}");
        }
      },
    );

    return Scaffold(
      appBar: const CustomAppBar(
        title: "Change Password",
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextField(
                  label: 'Old Password',
                  hintText: '******',
                  controller: _oldPasswordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter old password';
                    }
                    return null;
                  },
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).nextFocus(); // Move to next field
                  },
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  label: 'New Password',
                  hintText: '******',
                  controller: _newPasswordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter new password';
                    }
                    if (value.length < 8) {
                      return 'Password must be at least 8 characters long';
                    }
                    return null;
                  },
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).nextFocus(); // Move to next field
                  },
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  label: 'Retype Password',
                  hintText: '******',
                  controller: _retypePasswordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter retype password';
                    }
                    if (value != _newPasswordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).unfocus(); // Move to next field
                  },
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: AppScreens.width,
                  child: CustomButton(
                    title: "Confirm",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ref.read(userChangePasswordProvider.notifier).changePassword(
                            params: ChangePasswordParams(
                                currentPassword: _oldPasswordController.text,
                                newPassword: _newPasswordController.text));
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
