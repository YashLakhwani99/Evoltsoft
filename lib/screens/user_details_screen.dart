import 'dart:typed_data';
import 'package:evoltsoft/services/auth/auth_methods.dart';
import 'package:evoltsoft/services/auth/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:evoltsoft/components/my_button.dart';
import 'package:evoltsoft/components/my_textfield.dart';

class UserDetailsScreen extends StatefulWidget {
  final bool isEditing;
  final String? fullName;
  final String? userName;
  final String? phoneNumber;
  final dynamic image;

  const UserDetailsScreen({
    super.key,
    this.isEditing = false,
    this.fullName,
    this.userName,
    this.phoneNumber,
    this.image,
  });

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  late TextEditingController nameController;
  late TextEditingController userNameController;
  late TextEditingController phoneNumberController;
  Uint8List? _image;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.fullName);
    userNameController = TextEditingController(text: widget.userName);
    phoneNumberController = TextEditingController(text: widget.phoneNumber);
    if (widget.image is Uint8List) {
      _image = widget.image;
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    userNameController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  void selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        title: widget.isEditing
            ? const Text(
                "Edit Profile",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 30,
                ),
              )
            : const Text(
                "Enter your Credentials",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 30,
                ),
              ),
        leading: widget.isEditing
            ? IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 30,
                ),
              )
            : null,
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: Stack(
                        children: [
                          Container(
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.grey.shade900,
                                width: 3,
                              ),
                            ),
                            child: ClipOval(
                              child: _image != null
                                  ? CircleAvatar(
                                      backgroundImage: MemoryImage(_image!),
                                    )
                                  : widget.image is String
                                      ? Image.network(
                                          widget.image,
                                          fit: BoxFit.cover,
                                        )
                                      : Image.network(
                                          "https://www.shutterstock.com/image-vector/default-avatar-profile-icon-social-600nw-1677509740.jpg",
                                          fit: BoxFit.cover,
                                        ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade900,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 3,
                                ),
                              ),
                              child: IconButton(
                                icon: const Icon(
                                  CupertinoIcons.add,
                                  color: Colors.white,
                                ),
                                onPressed: selectImage,
                              ),
                            ),
                          ),
                          const Positioned(
                            top: 1,
                            right: 0,
                            child: Text(
                              "*",
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 30),
                          child: Row(
                            children: [
                              Text(
                                "Full Name ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                "*",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                        MyTextField(
                          controller: nameController,
                          hintText: "",
                          obscureText: false,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 30),
                          child: Row(
                            children: [
                              Text(
                                "Username ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                "*",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                        MyTextField(
                          controller: userNameController,
                          hintText: "",
                          obscureText: false,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 30),
                          child: Row(
                            children: [
                              Text(
                                "Phone Number ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                "*",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                        MyTextField(
                          controller: phoneNumberController,
                          hintText: "",
                          obscureText: false,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    MyButton(
                      text: "Submit",
                      onTap: () async {
                        if (_image == null) {
                          showSnackBar("Please select an image.", context);
                          return;
                        }

                        setState(() {
                          _isLoading = true;
                        });

                        await AuthMethods().submitDetails(
                          fullName: nameController.text,
                          userName: userNameController.text,
                          phoneNumber: phoneNumberController.text,
                          file: _image!,
                        );

                        setState(() {
                          _isLoading = false;
                        });

                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
            if (_isLoading)
              Center(
                child: CircularProgressIndicator(
                  color: Colors.blue.shade900,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
