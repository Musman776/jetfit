import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jetfit/utilis/theme_data.dart';
import 'package:jetfit/view/screens/profile/profile_controller.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final profileController = Get.put(ProfileController());
  var height, width;

  @override
  void initState() {
    profileController.getUserId();
    profileController.getUserInfo(id: profileController.userId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.sizeOf(context).height;
    width = MediaQuery.sizeOf(context).width;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: MyThemeData.surface,
        body: OrientationBuilder(builder: (context, orientation) {
          return GetBuilder<ProfileController>(initState: (state) {
            Get.put(ProfileController());
          }, builder: (controller) {
            return controller.isLoading.value == true
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : orientation == Orientation.portrait
                    ? portraitMode()
                    : landscapeMode();
          });
        }));
  }

  Widget portraitMode() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width * 0.08),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.1,
            ),
            InkWell(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => Container(
                            color: MyThemeData.secoundry20,
                            height: height * 0.1,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                InkWell(
                                  onTap: () {
                                    profileController.getGalleryImage();
                                    Navigator.pop(context);
                                  },
                                  child: BtmSheetIcon(
                                      height: height * 0.035,
                                      text: 'Gallery',
                                      icon: Icons.photo),
                                ),
                                InkWell(
                                  onTap: () {
                                    profileController.getCameraImage();
                                    Navigator.pop(context);
                                  },
                                  child: BtmSheetIcon(
                                    height: height * 0.035,
                                    text: 'Camera',
                                    icon: Icons.camera_alt,
                                  ),
                                )
                              ],
                            ),
                          ));
                },
                child: profileController.selectedImage.value == null
                    ? profileController.profileImage.isEmpty ||
                            profileController.profileImage == ''
                        ? CircleAvatar(
                            child: Icon(Icons.person), radius: width * 0.14)
                        : CircleAvatar(
                            backgroundImage:
                                NetworkImage(profileController.profileImage),
                            radius: width * 0.14)
                    : CircleAvatar(
                        backgroundImage: FileImage(
                            File(profileController.selectedImage.value!.path)),
                        radius: width * 0.14)),
            SizedBox(height: height * 0.1),
            customTextFilled(
                enabled: false,
                hint: 'Name',
                controller: profileController.nameController),
            customTextFilled(
                enabled: false,
                hint: 'emaxple@gmail.com',
                controller: profileController.emailController),
            customTextFilled(
                enabled: false,
                hint: 'Status',
                controller: profileController.statusController),
            customTextFilled(
                enabled: false,
                hint: 'Role',
                controller: profileController.roleController),
            customButton(width: width * 0.8)
          ],
        ),
      ),
    );
  }

  Widget landscapeMode() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: height * 0.08),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: InkWell(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => Container(
                            color: MyThemeData.secoundry20,
                            height: height * 0.2,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                InkWell(
                                  onTap: () {
                                    profileController.getGalleryImage();
                                    Navigator.pop(context);
                                  },
                                  child: BtmSheetIcon(
                                      height: height * 0.035,
                                      text: 'Gallery',
                                      icon: Icons.photo),
                                ),
                                InkWell(
                                  onTap: () {
                                    profileController.getCameraImage();
                                    Navigator.pop(context);
                                  },
                                  child: BtmSheetIcon(
                                    height: height * 0.035,
                                    text: 'Camera',
                                    icon: Icons.camera_alt,
                                  ),
                                )
                              ],
                            ),
                          ));
                },
                child: profileController.selectedImage.value == null
                    ? profileController.profileImage.isEmpty ||
                            profileController.profileImage == ''
                        ? CircleAvatar(
                            child: Icon(Icons.person), radius: width * 0.1)
                        : CircleAvatar(
                            backgroundImage:
                                NetworkImage(profileController.profileImage),
                            radius: width * 0.1)
                    : CircleAvatar(
                        backgroundImage: FileImage(
                            File(profileController.selectedImage.value!.path)),
                        radius: width * 0.1)),
          ),
          Expanded(
              flex: 2,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: height * 0.1),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      customTextFilled(
                          enabled: false,
                          hint: 'Name',
                          controller: profileController.nameController),
                      SizedBox(height: height * 0.07),
                      customTextFilled(
                          enabled: false,
                          hint: 'example@gmail.com',
                          controller: profileController.emailController),
                      SizedBox(height: height * 0.07),
                      customTextFilled(
                          enabled: false,
                          hint: 'Status',
                          controller: profileController.statusController),
                      SizedBox(height: height * 0.07),
                      customTextFilled(
                          enabled: false,
                          hint: 'Role',
                          controller: profileController.roleController),
                      SizedBox(height: height * 0.07),
                      customButton(width: height * 0.8)
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }

  Widget customTextFilled({enabled, controller, hint}) {
    return SizedBox(
      height: height * 0.1,
      child: TextFormField(
        controller: controller,
        enabled: enabled,
        style: const TextStyle(
          color: Colors.white,
        ),
        autofocus: false,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: InputBorder.none,
          filled: true,
          fillColor: MyThemeData.background,
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.grey.withOpacity(0.2),
              width: 2,
            ),
          ),
          hintText: hint,
          hintStyle: const TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget customButton({width}) {
    return InkWell(
      onTap: () {
        profileController.uploadImage();
      },
      child: Container(
          height: 40,
          width: width,
          decoration: BoxDecoration(
              color: MyThemeData.secoundry20,
              borderRadius: BorderRadius.circular(50)),
          child: const Center(
            child: Text(
              "Save",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          )),
    );
  }
}

class BtmSheetIcon extends StatelessWidget {
  double height;
  String text;
  IconData icon;

  BtmSheetIcon(
      {super.key,
      required this.height,
      required this.text,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: height,
          color: Colors.white,
        ),
        Text(text, style: const TextStyle(color: Colors.white))
      ],
    );
  }
}
