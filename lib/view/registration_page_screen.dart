import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../model/user_model.dart';
import '../controller/services/user_provider.dart';
import '../controller/utils/constant.dart';

class RegistrationPageScreen extends StatefulWidget {
  static const routeName = '/registrationPage';
  const RegistrationPageScreen({super.key});

  @override
  State<RegistrationPageScreen> createState() => _RegistrationPageScreenState();
}

class _RegistrationPageScreenState extends State<RegistrationPageScreen> {
  final TextEditingController firstName = TextEditingController();
  final TextEditingController emailAddress = TextEditingController();
  final TextEditingController accountPassword = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  File? pickedImage;
  late UserProvider userProvider;
  bool callOnce = false;
  User? signupUser;
  final _formKey = GlobalKey<FormState>();
  String _errMsg = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!callOnce) {
      userProvider = Provider.of<UserProvider>(context);
      callOnce = true;
    }
    super.didChangeDependencies();
  }

  // ignore: prefer_typing_uninitialized_variables
  var _mediaQuery;

  @override
  Widget build(BuildContext context) {
    _mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          'Register',
          style: Theme.of(context).textTheme.titleLarge?.apply(
                color: Colors.black,
              ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 50,
            ),
            Align(
              alignment: Alignment.center,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 5),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                    child: ClipOval(
                      child: pickedImage != null
                          ? Image.file(
                              pickedImage!,
                              width: mediaHeight * .2,
                              height: _mediaQuery.size.height * .2,
                              fit: BoxFit.cover,
                            )
                          : Image.asset(
                              'assets/images/man.png',
                              width: mediaHeight * .2,
                              height: _mediaQuery.size.height * .2,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 5,
                    child: Container(
                      height: 38,
                      width: 38,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                      ),
                      child: IconButton(
                        onPressed: () {
                          _imagePickerOption();
                        },
                        icon: const Icon(
                          Icons.camera_alt_outlined,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
              ),
              child: SizedBox(
                height: mediaHeight * .08,
                width: _mediaQuery.size.width * .02,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.grey.shade200),
                  onPressed: _imagePickerOption,
                  icon: const Icon(Icons.add_a_photo_sharp),
                  label: Text(
                    'UPLOAD IMAGE',
                    style: Theme.of(context).textTheme.titleLarge?.apply(
                          color: Colors.grey.shade200,
                          fontSizeFactor: .7,
                        ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 35),
            Form(
              key: _formKey,
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(0),
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                    child: TextFormField(
                      controller: firstName,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        filled: true,
                        hintText: 'Name',
                        hintStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.grey.shade500,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Provide a name';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                    child: TextFormField(
                      controller: emailAddress,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        filled: true,
                        hintText: 'Email Address',
                        hintStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.grey.shade500,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Provide a valid email address';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                    child: TextFormField(
                      controller: phoneNumber,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        filled: true,
                        hintText: 'Phone number',
                        hintStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.grey.shade500,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Provide a phone number';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                    child: TextFormField(
                      style: Theme.of(context).textTheme.titleMedium,
                      controller: accountPassword,
                      keyboardType: TextInputType.text,
                      // obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        hintText: 'Password(at least 6 characters)',
                        hintStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.grey.shade500,
                        ),
                      ),
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.length < 6) {
                          return 'Provide a valid password';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                    child: TextFormField(
                      style: Theme.of(context).textTheme.titleMedium,
                      controller: confirmPassword,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        hintText: 'Confirm Password',
                        hintStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.grey.shade500,
                        ),
                      ),
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            accountPassword.text != value) {
                          return 'Password is not matching';
                        }
                        return null;
                      },
                    ),
                  ),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     _signUpAuth();
                  //   },
                  //   child: const Text('Login'),
                  // ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      _errMsg,
                      style: const TextStyle(fontSize: 18, color: Colors.red),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: ElevatedButton(
                    onPressed: () {
                      _signUpAuth();

                      // userProvider.signupUser = User(
                      //   username: firstName.text,
                      //   password: accountPassword.text,
                      //   email: emailAddress.text,
                      //   phone: phoneNumber.text,
                      // );
                      // userProvider
                      //     .addUser(user: userProvider.signupUser!)
                      //     .then((response) {
                      //   print(response);
                      //   Navigator.pop(context);
                      // });
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 10,
                      ),
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.grey.shade200,
                    ),
                    child: Text(
                      'Confirm',
                      style: Theme.of(context).textTheme.titleLarge?.apply(
                            color: Colors.grey.shade200,
                            fontSizeFactor: .7,
                          ),
                    ),
                  ),
                ),
              ],
            ),
            // SignUpTextFiled(
            //   controller: firstName,
            //   hintText: 'Name',
            //   obscureText: false,
            // ),
            // const SizedBox(height: 20),
            // SignUpTextFiled(
            //   controller: emailAddress,
            //   hintText: 'Email',
            //   obscureText: false,
            // ),
            // const SizedBox(height: 20),
            // SignUpTextFiled(
            //   controller: phoneNumber,
            //   hintText: 'Number',
            //   obscureText: false,
            // ),
            // const SizedBox(height: 20),
            // SignUpTextFiled(
            //   controller: accountPassword,
            //   hintText: 'Password',
            //   obscureText: false,
            // ),
            // const SizedBox(height: 20),
            // SignUpTextFiled(
            //   controller: confirmPassword,
            //   hintText: 'Confirm Password',
            //   obscureText: false,
            // ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  void _signUpAuth() async {
    if (_formKey.currentState!.validate()) {
      EasyLoading.show(status: 'Please wait', dismissOnTap: false);
      Uint8List imagebytes =
          await pickedImage!.readAsBytes(); //convert to bytes
      String base64string = base64.encode(imagebytes);
      try {
        userProvider.signupUser = User(
          username: firstName.text,
          password: accountPassword.text,
          image: base64string,
          email: emailAddress.text,
          phone: phoneNumber.text,
        );
        userProvider.addUser(user: userProvider.signupUser!).then((response) {
          print(response);
          EasyLoading.dismiss();
          if (mounted) {
            Navigator.pop(context);
          }
        });
      } catch (error) {
        EasyLoading.dismiss();
        setState(() {
          _errMsg = error.toString();
        });
      }
    }
  }

  void _imagePickerOption() {
    Get.bottomSheet(
      SingleChildScrollView(
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
          child: Container(
            color: Colors.grey.shade200,
            height: mediaHeight * .32, // user it like this
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Pic Image From",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Quicksand',
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: mediaHeight * .05,
                    width: _mediaQuery.size.width * .02,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.grey.shade200,
                      ),
                      onPressed: () {
                        _pickImage(ImageSource.camera);
                      },
                      icon: const Icon(Icons.camera),
                      label: const Text(
                        "CAMERA",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Quicksand',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: mediaHeight * .05,
                    width: _mediaQuery.size.width * .02,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.grey.shade200,
                      ),
                      onPressed: () {
                        _pickImage(ImageSource.gallery);
                      },
                      icon: const Icon(Icons.image),
                      label: const Text(
                        "GALLERY",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Quicksand',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: mediaHeight * .05,
                    width: _mediaQuery.size.width * .02,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 177, 22, 11),
                        foregroundColor: Colors.grey.shade100,
                      ),
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(Icons.close),
                      label: const Text(
                        "CANCEL",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Quicksand',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _pickImage(ImageSource imageType) async {
    try {
      final photo = await ImagePicker().pickImage(source: imageType);
      if (photo == null) return;
      final tempImage = File(photo.path);
      setState(() {
        pickedImage = tempImage;
      });

      Get.back();
    } catch (error) {
      debugPrint(error.toString());
    }
  }
}
