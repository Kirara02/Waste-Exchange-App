import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:waste_exchange/domain/usecases/edit_profile/edit_profile_params.dart';
import 'package:waste_exchange/presentation/extensions/build_context_extension.dart';
import 'package:waste_exchange/presentation/providers/user_data/user_data_provider.dart';
import 'package:waste_exchange/presentation/widgets/common/custom_app_bar.dart';
import 'package:waste_exchange/presentation/widgets/textfield/custom_text_field.dart';

class EditProfilePage extends ConsumerStatefulWidget {
  const EditProfilePage({super.key});

  @override
  ConsumerState<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends ConsumerState<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  File? _profileImage;
  final ImagePicker _picker = ImagePicker();
  bool _isEditMode = false;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  Future<void> _pickImage() async {
    final pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _profileImage = File(pickedImage.path);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _nameController.text = ref.read(userDataProvider).valueOrNull?.name ?? "";
    _emailController.text = ref.read(userDataProvider).valueOrNull?.email ?? "";
    _phoneController.text = ref.read(userDataProvider).valueOrNull?.phone ?? "";
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      userDataProvider,
      (previous, next) {
        if (next is AsyncData && next.value != null) {
          context.showSnackBar("Profile updated successfully!");

          setState(() {
            _isEditMode = false;
            _profileImage = null;
          });

          final updatedUser = next.value;
          if (updatedUser != null) {
            _nameController.text = updatedUser.name;
            _emailController.text = updatedUser.email;
            _phoneController.text = updatedUser.phone;
          }
        } else if (next is AsyncError) {
          context.showSnackBar("Failed to update profile: ${next.error}");
        }
      },
    );

    return Scaffold(
      appBar: CustomAppBar(
        title: "Update Profile",
        actions: [
          // Toggle Edit Mode Button
          IconButton(
            icon: Icon(_isEditMode ? Icons.save : Icons.edit),
            onPressed: () {
              if (_isEditMode) {
                if (_formKey.currentState!.validate()) {
                  final currentUser = ref.read(userDataProvider).valueOrNull;

                  if (currentUser != null &&
                      (currentUser.name != _nameController.text ||
                          currentUser.phone != _phoneController.text ||
                          currentUser.email != _emailController.text)) {
                    ref.read(userDataProvider.notifier).editProfile(
                          params: EditProfileParams(
                            name: _nameController.text,
                            phone: _phoneController.text,
                            email: _emailController.text,
                          ),
                        );
                  } else {
                    context.showSnackBar("No changes to save.");
                  }
                }
              }

              // Toggle between edit and view mode
              setState(() {
                _isEditMode = !_isEditMode;
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Profile Picture
                GestureDetector(
                  onTap: _isEditMode ? _pickImage : null, // Only allow picking image in edit mode
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.grey[300],
                    backgroundImage: _profileImage != null ? FileImage(_profileImage!) : null,
                    child: _profileImage == null ? const Icon(Icons.add_a_photo, size: 40, color: Colors.grey) : null,
                  ),
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  label: 'Name',
                  hintText: 'Enter your name',
                  controller: _nameController,
                  readOnly: !_isEditMode,
                  textInputAction: TextInputAction.done,
                  validator: (value) {
                    if (_isEditMode && (value == null || value.isEmpty)) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),
                CustomTextField(
                  label: 'Phone Number',
                  hintText: 'Enter your phone number',
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  readOnly: !_isEditMode,
                  textInputAction: TextInputAction.done,
                  validator: (value) {
                    if (_isEditMode && (value == null || value.isEmpty)) {
                      return 'Please enter your phone number';
                    }
                    if (_isEditMode && !RegExp(r'^\d{10,15}$').hasMatch(value!)) {
                      return 'Please enter a valid phone number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  label: 'Email',
                  hintText: 'Enter your email',
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  readOnly: !_isEditMode,
                  textInputAction: TextInputAction.done,
                  validator: (value) {
                    if (_isEditMode && (value == null || value.isEmpty)) {
                      return 'Please enter your email';
                    }
                    if (_isEditMode && !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value!)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
