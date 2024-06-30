import 'package:flutter/material.dart';

import '../../../resources/color_manager.dart';
import '../../../widgets/widgets.dart';


class JobDetailsView extends StatelessWidget {
  final String imageUrl;
  final String companyName;
  final String salary;

  const JobDetailsView({
    super.key,
    required this.salary,
    required this.companyName,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> items = [
      {
        'title': 'Salary',
        'subtitle': salary,
        'icon': Icons.attach_money,
        'isSubtitle': true,
      },
      {
        'title': 'Type',
        'subtitle': 'Full-time',
        'icon': Icons.work,
        'isSubtitle': true,
      },
      {
        'title': 'Work Hour',
        'subtitle': '40 hrs/week',
        'icon': Icons.access_time,
        'isSubtitle': true,
      },
      {
        'title': 'Experience',
        'subtitle': '2 years',
        'icon': Icons.school,
        'isSubtitle': true,
      },
    ];

    return Scaffold(
      appBar: myAppBar(context, '          Job Details', false),
      backgroundColor: ColorManager.white, 
      body: SingleChildScrollView(
        child: Column(
          children: [
            //image
            circularImage(
                context, imageUrl, MediaQuery.of(context).size.width * 0.2),
            //role
            const Text('Digital designer'),
            //company
            Text(
              companyName,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            //location
            const Text('LA-california'),
            //gridview
            buildGridView(items, (
              backgroundColor,
              iconColor,
              icon,
              title,
              subtitle,
              isSubtitle,
            ) {
              return customListTile(
                backgroundColor,
                iconColor,
                icon,
                title,
                subtitle,
                isSubtitle,
              );
            }),
            //job description
            titleAndDescription(context),
            //company info
            companyListTile(context, imageUrl, companyName),
            //apply button
            myButton(
              context,
              'Apply',
              () {},
              ColorManager.white, 
              ColorManager.purple5, 
              double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
