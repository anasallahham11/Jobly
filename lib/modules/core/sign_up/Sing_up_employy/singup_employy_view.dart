import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jobly/modules/core/sign_up/Sing_up_employy/cubit/cubit.dart';
import 'package:jobly/modules/core/sign_up/Sing_up_employy/cubit/states.dart';

import '../../../../resources/assets_manager.dart';
import '../../../../resources/color_manager.dart';
import '../../../../resources/font_manager.dart';
import '../../../../resources/strings_manager.dart';
import '../../../../resources/values_manager.dart';
import '../../../../widgets/widgets.dart';

class SingupEmployy extends StatefulWidget {
  @override
  _SingupEmployyState createState() => _SingupEmployyState();
}

class _SingupEmployyState extends State<SingupEmployy> {
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _resumeController = TextEditingController();
  final TextEditingController _experienceController = TextEditingController();
  final TextEditingController _educationController = TextEditingController();
  final TextEditingController _portfolioController = TextEditingController();
  final TextEditingController _phone_numberController = TextEditingController();
  final List<String> workingStatusOptions = ['working', 'student', 'not working'];

  File? _image;
  String _imageName = '';

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        _imageName = pickedFile.name; // Get the name of the picked file
      });
      // TODO: Handle image file (_image) as needed (uploading, displaying, etc.)
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SignUpEmployyCubit(),
        child: BlocListener<SignUpEmployyCubit, SignUpEmployyState>(
          listener: (context, state) {
            if (state is SignUpEmployyError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('SIGNUP Failed: ${state.error}'),
                ),
              );
            } else if (state is SignUpEmployySuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('SIGNUP Success'),
                ),
              );
              // Navigate to another screen
              // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => HomeLayoutView()));
            }
          },
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  ColorManager.purple6,
                  ColorManager.purple5,
                  ColorManager.purple4,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: AppSize.s100),
                    Center(
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Card(
                            child: Container(
                              width: 300,
                              height: 500,
                              padding: const EdgeInsets.all(16),
                              child: SingleChildScrollView(
                                physics: BouncingScrollPhysics(),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Image(image: AssetImage(ImageAssets.purpleLogo)),
                                    const SizedBox(height: AppSize.s16),
                                    const SizedBox(height: AppSize.s32),
                                    defaultFormField(
                                      controller: _ageController,
                                      type: TextInputType.number,
                                      label: AppStrings.age,
                                      prefix: Icons.format_list_numbered_outlined,
                                    ),
                                    const SizedBox(height: AppSize.s16),
                                    defaultFormField(
                                      controller: _resumeController,
                                      type: TextInputType.emailAddress,
                                      label: AppStrings.lastname,
                                      prefix: Icons.person,
                                    ),
                                    const SizedBox(height: AppSize.s16),
                                    defaultFormField(
                                      controller: _experienceController,
                                      type: TextInputType.text,
                                      label: AppStrings.experience,
                                      prefix: Icons.work_history_sharp,
                                    ),
                                    const SizedBox(height: AppSize.s16),
                                    defaultFormField(
                                      controller: _educationController,
                                      type: TextInputType.text,
                                      label: AppStrings.education,
                                      prefix: Icons.cast_for_education,
                                    ),
                                    const SizedBox(height: AppSize.s16),
                                    defaultFormField(
                                      controller: _portfolioController,
                                      type: TextInputType.text,
                                      label: AppStrings.portfolio,
                                      prefix: Icons.description,
                                    ),
                                    const SizedBox(height: AppSize.s16),
                                    defaultFormField(
                                      controller: _phone_numberController,
                                      type: TextInputType.number,
                                      label: AppStrings.phone_number,
                                      prefix: Icons.phone,
                                    ),
                                    const SizedBox(height: AppSize.s16),
                                    BlocBuilder<SignUpEmployyCubit, SignUpEmployyState>(
                                      builder: (context, state) {
                                        String workingStatus = 'working';
                                        if (state is WorkingStatusState) {
                                          workingStatus = state.workingStatus;
                                        }
                                        return Column(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: ColorManager.purple2,
                                                borderRadius: BorderRadius.circular(30.0),
                                              ),
                                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                                              child: DropdownButton<String>(
                                                dropdownColor: ColorManager.purple3,
                                                iconEnabledColor: ColorManager.white,
                                                value: workingStatus,
                                                onChanged: (String? newValue) {
                                                  if (newValue != null) {
                                                    context.read<SignUpEmployyCubit>().changeWorkingStatus(newValue);
                                                  }
                                                },
                                                items: workingStatusOptions
                                                    .map<DropdownMenuItem<String>>((String value) {
                                                  return DropdownMenuItem<String>(
                                                    value: value,
                                                    child: Text(value),
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                    const SizedBox(height: AppSize.s16),
                                    BlocBuilder<SignUpEmployyCubit, SignUpEmployyState>(
                                      builder: (context, state) {
                                        String graduationStatus = 'Not Graduated';
                                        if (state is GraduationStatusState) {
                                          graduationStatus = state.graduationStatus;
                                        }
                                        return Row(
                                          children: [
                                            Switch(
                                              value: graduationStatus == 'Graduated',
                                              activeColor: ColorManager.purple4,
                                              inactiveThumbColor: ColorManager.purple6,
                                              inactiveTrackColor: ColorManager.purple2,
                                              onChanged: (value) {
                                                context.read<SignUpEmployyCubit>().changeGraduationStatus(value);
                                              },
                                            ),
                                            const SizedBox(width: 8),
                                            Text(
                                              graduationStatus,
                                              style: TextStyle(fontSize: FontSize.s12),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                    const SizedBox(height: AppSize.s16),
                                    _image != null
                                        ? Column(
                                            children: [
                                              Image.file(
                                                _image!,
                                                height: 100,
                                                width: 100,
                                                fit: BoxFit.cover,
                                              ),
                                              const SizedBox(height: 8),
                                              Text(
                                                _imageName,
                                                style: TextStyle(fontSize: FontSize.s12, color: Colors.black),
                                              ),
                                            ],
                                          )
                                        : Container(),
                                    ElevatedButton(
                                      onPressed: () {
                                        _showImagePicker(context);
                                      },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: ColorManager.purple2
                                          ),
                                      child: Text(AppStrings.PickImage,style: TextStyle(color: ColorManager.black),),
                                    ),
                                    const SizedBox(height: AppSize.s16),
                                    BlocBuilder<SignUpEmployyCubit, SignUpEmployyState>(
                                      builder: (context, state) {
                                        if (state is SignUpEmployyLoading) {
                                          return const CircularProgressIndicator();
                                        }

                                        return ElevatedButton(
                                          onPressed: () {
                                            final age = _ageController.text;
                                            final resume = _resumeController.text;
                                            final experience = _experienceController.text;
                                            final education = _educationController.text;
                                            final portfolio = _portfolioController.text;
                                            final phone_number = _phone_numberController.text;
                                            final image = _image;
                                            
                                         
                                            BlocProvider.of<SignUpEmployyCubit>(context).userSignUp(age: age, resume: resume, experience: experience, education: education ,portfolio:portfolio, phone_number: phone_number,file_path:_image  );
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: ColorManager.white,
                                          ),
                                          child: Text(
                                            AppStrings.next,
                                            style: TextStyle(color: ColorManager.purple6),
                                          ),
                                        );
                                      },
                                    ),
                                    const SizedBox(height: AppSize.s16),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: -40,
                            left: 120,
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: ColorManager.purple6,
                                  width: 5.0,
                                ),
                              ),
                              child: CircleAvatar(
                                radius: 35,
                                backgroundColor: ColorManager.white,
                                child: Icon(
                                  Icons.person,
                                  size: 40,
                                  color: ColorManager.purple6,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showImagePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Photo Library'),
                onTap: () {
                  _pickImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_camera),
                title: Text('Camera'),
                onTap: () {
                  _pickImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
