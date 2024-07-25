

//upload video
  import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jobly/modules/regular/profile/cubit/profile_cubit.dart';
Widget showUploadDialog(BuildContext context,) {
    
    return AlertDialog(
      title: const Text('Upload Video'),
      content: const Text('Press the button below to upload a video.'),
      actions: <Widget>[

        TextButton(
          child: const Text('Upload Video'),
          onPressed: () async {
            final XFile? video = await ProfileCubit.get(context).picker.pickVideo(source: ImageSource.gallery);
            if (video != null) {
              print('Video selected: ${video.path}');
              ProfileCubit.get(context).uploadVideo();

            }
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }