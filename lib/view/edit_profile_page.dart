import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../controller/services/user_provider.dart';
import 'dart:convert';

class EditProfilePage extends StatefulWidget {
  static const routeName = '/editProfilePage';
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  File? pickedImage;
  var _mediaQuery;
  bool callOnce = false;
  late UserProvider userProvider;

  @override
  void didChangeDependencies() {
    if (!callOnce) {
      userProvider = Provider.of<UserProvider>(context);
      callOnce = true;
    }
    super.didChangeDependencies();
  }

  void _change() {
    Get.bottomSheet(
      SingleChildScrollView(
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
          child: Container(
            color: Colors.grey.shade200,
            height: _mediaQuery.size.height * .38,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                    child: TextField(
                      style: Theme.of(context).textTheme.titleMedium,
                      decoration: InputDecoration(
                          hintText: 'Enter Change',
                          hintStyle: TextStyle(
                            color: Colors.grey.shade500,
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 10,
                        ),
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.grey.shade200,
                      ),
                      child: Text(
                        'Done',
                        style: Theme.of(context).textTheme.titleLarge?.apply(
                              color: Colors.grey.shade200,
                              fontSizeFactor: .7,
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
            height: _mediaQuery.size.height * .32,
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
                    height: _mediaQuery.size.height * .05,
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
                    height: _mediaQuery.size.height * .05,
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
                    height: _mediaQuery.size.height * .05,
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
          'Edit Profile',
          style: Theme.of(context).textTheme.titleLarge?.apply(
                color: Colors.black,
              ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Center(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(800),
                    child: userProvider.currentUser!.image != null
                        ? Image.memory(
                            base64.decode(userProvider.currentUser!.image),
                            width: _mediaQuery.size.width * .38,
                            height: _mediaQuery.size.width * .38,
                            fit: BoxFit.cover,
                          )
                        : Image.asset(
                            'assets/images/man.png',
                            width: _mediaQuery.size.width * .38,
                            height: _mediaQuery.size.width * .38,
                            fit: BoxFit.cover,
                          ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 4,
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
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: <Widget>[
                            const Icon(Icons.person, size: 20),
                            const SizedBox(
                              width: 5,
                            ),
                            AutoSizeText(
                              'Tahmim Jawad',
                              maxLines: 1,
                              style:
                                  Theme.of(context).textTheme.titleLarge?.apply(
                                        fontSizeFactor: .6,
                                      ),
                            ),
                          ],
                        ),
                        IconButton(
                            onPressed: () {
                              _change();
                            },
                            icon: Icon(
                              Icons.edit,
                              size: 20,
                              color: Colors.grey.shade800,
                            )),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 2,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: <Widget>[
                            const Icon(Icons.mail, size: 20),
                            const SizedBox(
                              width: 5,
                            ),
                            AutoSizeText(
                              'tahamimjawad@gmail.com',
                              maxLines: 1,
                              style:
                                  Theme.of(context).textTheme.titleLarge?.apply(
                                        fontSizeFactor: .6,
                                      ),
                            ),
                          ],
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.edit,
                              size: 20,
                              color: Colors.grey.shade800,
                            )),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 2,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: <Widget>[
                            const Icon(Icons.call, size: 20),
                            const SizedBox(
                              width: 5,
                            ),
                            AutoSizeText(
                              '+8801790483839',
                              style:
                                  Theme.of(context).textTheme.titleLarge?.apply(
                                        fontSizeFactor: .6,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                            ),
                          ],
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.edit,
                              size: 20,
                              color: Colors.grey.shade800,
                            )),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 2,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: <Widget>[
                            const Icon(Icons.lock, size: 20),
                            const SizedBox(
                              width: 5,
                            ),
                            AutoSizeText(
                              'Password',
                              style:
                                  Theme.of(context).textTheme.titleLarge?.apply(
                                        fontSizeFactor: .6,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.edit,
                            size: 20,
                            color: Colors.grey.shade800,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 2,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 10,
                  ),
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.grey.shade200,
                ),
                child: Text(
                  'Save',
                  style: Theme.of(context).textTheme.titleLarge?.apply(
                        color: Colors.grey.shade200,
                        fontSizeFactor: .7,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
