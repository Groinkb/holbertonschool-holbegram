import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:holbegram/methods/auth_methods.dart';
import 'package:holbegram/screens/auth/methods/user_storage.dart';
import 'package:holbegram/screens/main_screen.dart';

class AddPicture extends StatefulWidget {
  final String email;
  final String password;
  final String username;

  const AddPicture({
    Key? key,
    required this.email,
    required this.password,
    required this.username,
  }) : super(key: key);

  @override
  State<AddPicture> createState() => _AddPictureState();
}

class _AddPictureState extends State<AddPicture> {
  Uint8List? _image;
  bool _isLoading = false;
  final AuthMethode _authMethods = AuthMethode();
  final StorageMethods _storageMethods = StorageMethods();

  void selectImageFromGallery() async {
    final ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);

    if (file != null) {
      setState(() {
        _image = file.readAsBytes() as Uint8List?;
      });
    }
  }

  void selectImageFromCamera() async {
    final ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: ImageSource.camera);

    if (file != null) {
      setState(() {
        _image = file.readAsBytes() as Uint8List?;
      });
    }
  }

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });

    // Register user
    String res = await _authMethods.signUpUser(
      email: widget.email,
      password: widget.password,
      username: widget.username,
      file: _image,
    );

    setState(() {
      _isLoading = false;
    });

    if (res == "success") {
      // Navigate to main screen on success
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const MainScreen(),
        ),
      );
    } else {
      // Show error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(res)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Profile Picture'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Add a profile picture',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Stack(
                children: [
                  _image != null
                      ? CircleAvatar(
                          radius: 80,
                          backgroundImage: MemoryImage(_image!),
                        )
                      : const CircleAvatar(
                          radius: 80,
                          backgroundImage:
                              AssetImage('assets/images/default_profile.png'),
                          child: Icon(
                            Icons.person,
                            size: 80,
                            color: Colors.grey,
                          ),
                        ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.blue,
                          child: IconButton(
                            onPressed: selectImageFromCamera,
                            icon: const Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.green,
                          child: IconButton(
                            onPressed: selectImageFromGallery,
                            icon: const Icon(
                              Icons.photo_library,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              _isLoading
                  ? const CircularProgressIndicator()
                  : Column(
                      children: [
                        ElevatedButton(
                          onPressed: signUpUser,
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(200, 50),
                          ),
                          child: const Text('Continue'),
                        ),
                        const SizedBox(height: 20),
                        TextButton(
                          onPressed: () {
                            // Skip adding profile picture
                            signUpUser();
                          },
                          child: const Text('Skip for now'),
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
