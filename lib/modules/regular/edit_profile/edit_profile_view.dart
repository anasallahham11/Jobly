import 'package:flutter/material.dart';

import '../../../resources/color_manager.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: ColorManager.white, 
      body: const Center(child: Text('data'),),
    );
  }
}