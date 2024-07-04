import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobly/resources/color_manager.dart';
import 'package:jobly/resources/values_manager.dart';
import 'package:jobly/widgets/anas_widgets.dart';
import '../../../widgets/widgets.dart';
import 'cubit/search_cubit.dart';
import 'cubit/search_states.dart';


class SearchView extends StatelessWidget {
  SearchView({super.key});
  var text = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit()..getCategories()..getSections(),
      child: BlocConsumer<SearchCubit, SearchStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = SearchCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(AppSize.s20),
                  child: Row(
                    children:[
                      Expanded(
                        child: defaultFormField(
                          controller: text,
                          type: TextInputType.text,
                          label: "Search",
                          suffix: Icons.search,
                          suffixPressed: (){cubit.getSearch(text: text);},
                          onChange: (text){cubit.getSearch(text: text);}
                        ),
                      ),
                      const SizedBox(width: AppSize.s20,),
                      InkWell(
                          child: Icon(
                            Icons.filter_alt,
                            color: ColorManager.primary,
                            size: AppSize.s30,
                          ),
                          onTap: (){
                            showDialog<void>(
                              context: context,
                              builder: (BuildContext context) {
                                return filterOptions(cubit, context);
                              },
                            );
                          },
                      )
                    ]
                  ),
                ),
                Expanded(
                    child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: jobsBuilder(cubit.jobs, cubit, context, state)
                    ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
