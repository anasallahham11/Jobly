  import 'package:flutter/material.dart';
import '../resources/font_manager.dart';
import '../resources/style_manager.dart';

//onboarding
class BoardingModle{
  final String image;
  final String title;
  final String body;
  BoardingModle({
    required this.body,
    required this.title,
    required this.image,

  });
} 

Widget BulidBoardingItem(BoardingModle modle)=>Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Expanded(child: Image(image:AssetImage('${modle.image}'))),
          const SizedBox(height: 30,),
          Text('${modle.title}',style: getBoldStyle(color: Colors.black,fontSize: FontSize.s22),),
           const SizedBox(height: 15,),
          Text('${modle.body}',style:getRegularStyle(color: Colors.black,fontSize:FontSize.s14),),
          const   SizedBox(height: 15,),
        ],
      );


//text from feld

Widget TextFieldComponant(TextEditingController _passwordController, String AppStrings,InputBorder? border,bool obscureText){
                   return TextField(
                     controller: _passwordController,
                       decoration: InputDecoration(
                         labelText: AppStrings,
                           border:border,
                              ),
                           obscureText: obscureText,
                                  );
}


PreferredSizeWidget myAppBar(context, String title, bool searchVisible) {
  return AppBar(
    shadowColor: Colors.white,
    forceMaterialTransparency: true,
    iconTheme: const IconThemeData(
      color: Color.fromARGB(255, 164, 78, 179), // Change the color to red
    ),
    actions: [
      if (searchVisible)
        IconButton(
          icon: const Icon(Icons.search,
              color: Color.fromARGB(255, 164, 78, 179)),
          onPressed: () {
            // navigateTo(context, const SearchScreen());
          },
        ),
    ],
    backgroundColor: Colors.white,
    title: Text(
      title,
      textAlign: TextAlign.center,
      style: const TextStyle(color: Color.fromARGB(255, 164, 78, 179)),
    ),
  );
}



Widget myDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 115, 1, 115),
          ),
          child: Text(
            'Menu',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.person),
          title: const Text('Profile'),
          onTap: () {
            // Handle the home tap
            Navigator.of(context).pop(); // Close the drawer
          },
        ),
        const Divider(
          indent: 10,
          endIndent: 10,
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text('Settings'),
          onTap: () {
            // Handle the company list tap
            Navigator.of(context).pop(); // Close the drawer
          },
        ),
        const Divider(
          indent: 10,
          endIndent: 10,
        ),
        ListTile(
          leading: const Icon(Icons.assignment),
          title: const Text('job applications'),
          onTap: () {
            // Handle the company list tap
            Navigator.of(context).pop(); // Close the drawer
          },
        ),
      ],
    ),
  );
}
