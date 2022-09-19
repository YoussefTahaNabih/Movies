import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:movies/core/utils/colors_manger.dart';
import 'package:movies/core/utils/string_manger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ImagePicker picker = ImagePicker();
  File? _image;
  String _selectedLang = 'en';
  Future<void> pickPhotoFromGallery() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final image = await picker.pickImage(source: ImageSource.gallery);
    File? imagefile = File(image!.path);
    prefs.setString('image', imagefile.toString());
    setState(() {
      _image = imagefile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            color: ColorManager.mainPrimary,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: CircleAvatar(
                        backgroundColor: ColorManager.white,
                        backgroundImage:
                            _image == null ? null : FileImage(_image!),
                        radius: 50,
                      ),
                    ),
                    IconButton(
                      padding: const EdgeInsets.only(bottom: 30, top: 10),
                      onPressed: pickPhotoFromGallery,
                      icon: const Icon(
                        Icons.edit_note,
                        size: 40,
                      ),
                      color: ColorManager.primary,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Youssef Taha',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'youssftaha@gmail.com',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 7,
          child: Container(
            color: ColorManager.primary,
            child: ListView(
              padding: const EdgeInsets.all(8),
              children: [
                ListTile(
                    leading: Icon(
                      Icons.language,
                      color: ColorManager.white,
                    ),
                    title: Text(
                      StringManger.language.tr,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    trailing: DropdownButton(
                      items: const [
                        DropdownMenuItem(
                          child: Text('en'),
                          value: 'en',
                        ),
                        DropdownMenuItem(
                          child: Text('ar'),
                          value: 'ar',
                        ),
                      ],
                      value: _selectedLang,
                      onChanged: (value) {
                        setState(() {
                          _selectedLang = value.toString();
                        });
                        Get.updateLocale(Locale(_selectedLang));
                      },
                      dropdownColor: ColorManager.mainPrimary,
                      elevation: 16,
                      style: TextStyle(color: ColorManager.white),
                      underline: Container(
                        color: ColorManager.white,
                      ),
                    )),
                Divider(
                  color: ColorManager.mainPrimary,
                  endIndent: 20,
                  indent: 20,
                  thickness: 2,
                ),
                ListTile(
                  leading: Icon(
                    Icons.favorite_border,
                    color: ColorManager.white,
                  ),
                  title: Text(
                    StringManger.favorite.tr,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                Divider(
                  color: ColorManager.mainPrimary,
                  endIndent: 20,
                  indent: 20,
                  thickness: 2,
                ),
                ListTile(
                  leading: Icon(
                    Icons.watch_later,
                    color: ColorManager.white,
                  ),
                  title: Text(
                    StringManger.watchLater.tr,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                Divider(
                  color: ColorManager.mainPrimary,
                  endIndent: 20,
                  indent: 20,
                  thickness: 2,
                ),
                ListTile(
                  leading: Icon(
                    Icons.login,
                    color: ColorManager.white,
                  ),
                  title: Text(
                    StringManger.login.tr,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                Divider(
                  color: ColorManager.mainPrimary,
                  endIndent: 20,
                  indent: 20,
                  thickness: 2,
                ),
                ListTile(
                  leading: Icon(
                    Icons.movie,
                    color: ColorManager.white,
                  ),
                  title: Text(
                    StringManger.movies.tr,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                Divider(
                  color: ColorManager.mainPrimary,
                  endIndent: 20,
                  indent: 20,
                  thickness: 2,
                ),
                ListTile(
                  leading: Icon(
                    Icons.tv,
                    color: ColorManager.white,
                  ),
                  title: Text(
                    StringManger.tvs.tr,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
