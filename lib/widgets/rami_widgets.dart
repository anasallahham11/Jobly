

//upload video
  import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jobly/modules/regular/profile/cubit/profile_cubit.dart';
import 'package:file_picker/file_picker.dart';
import 'package:jobly/modules/regular/profile/cubit/profile_states.dart';
import 'package:video_player/video_player.dart';

import '../modules/regular/profile/profile_view.dart';
import '../utils/constants.dart';
// Widget showUploadDialog(BuildContext context,) {
//
//     return AlertDialog(
//       title: const Text('Upload Video'),
//       content: const Text('Press the button below to upload a video.'),
//       actions: <Widget>[
//
//         TextButton(
//           child: const Text('Upload Video'),
//           onPressed: () async {
//             final XFile? video = await ProfileCubit.get(context).picker.pickVideo(source: ImageSource.gallery);
//             if (video != null) {
//               print('Video selected: ${video.path}');
//               ProfileCubit.get(context).uploadVideo();
//
//             }
//             Navigator.of(context).pop();
//           },
//         ),
//       ],
//     );
//   }


  //upload cv









//display video




// class NetworkMediaWidgetState extends State<NetworkMediaWidget> {
//   late VideoPlayerController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//     // Base URL
//
//     // Video filename (this should come from your API response)
//     // String videoFilename = '${ProfileCubit.get(context).profile.employee.video.filename}';
//
//     // Construct the full URL (assuming videos are stored in a 'videos' directory)
//     String videoUrl = 'http://192.168.1.8:8000/videos/videos/1722627166-.mp4';
//
//     _controller = VideoPlayerController.networkUrl(Uri.parse(videoUrl))
//       ..initialize().then((_) {
//         setState(() {}); // Ensure the first frame is shown
//       });
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     _controller.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//
//       children: [
//         SizedBox(height: 10),
//         _controller.value.isInitialized
//             ? SizedBox(
//           width: 400,  // Specify the desired width
//           height: 400, // Specify the desired height
//           child: AspectRatio(
//             aspectRatio: _controller.value.aspectRatio,
//             child: VideoPlayer(_controller),
//           ),
//         )
//             : CircularProgressIndicator(),
//         SizedBox(height: 20),
//         ElevatedButton(
//           onPressed: () {
//             setState(() {
//               _controller.value.isPlaying
//                   ? _controller.pause()
//                   : _controller.play();
//             });
//           },
//           child: Icon(
//             _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
//           ),
//         ),
//       ],
//     );
//   }
// }