

//upload video
  import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jobly/modules/regular/profile/cubit/profile_cubit.dart';
import 'package:file_picker/file_picker.dart';
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


  //upload cv

  



Widget showUploadCvDialog(BuildContext context,) {
  return AlertDialog(
    title: const Text('Upload PDF'),
    content: const Text('Press the button below to upload a PDF file.'),
    actions: <Widget>[
      TextButton(
        child: const Text('Upload PDF'),
        onPressed: () async {
           ProfileCubit.get(context).file_picker = await FilePicker.platform.pickFiles(
            type: FileType.custom,
            allowedExtensions: ['pdf'],
          );
          
          if (ProfileCubit.get(context).file_picker != null && ProfileCubit.get(context).file_picker!.files.isNotEmpty) {
            final file = ProfileCubit.get(context).file_picker!.files.first;
            print('PDF selected: ${file.path}');
            // Add your upload logic here, for example:
             ProfileCubit.get(context).uploadCv();

          }
          Navigator.of(context).pop();
        },
      ),
    ],
  );
}

