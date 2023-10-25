import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/component/components.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

class SearchScreen extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();

  SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                defaultFormField(
                  type: TextInputType.text,
                  controller: searchController,
                  label: 'Search',
                  onChanged: (value) {
                    NewsCubit.get(context).getSearch(value);
                  },
                  validate: (value) {
                    if (value?.isEmpty??true) {
                      return 'Search must not be empty';
                    } else {
                      return null;
                    }
                  },
                  prefix: Icons.search,
                ),
                Expanded(
                  child: articleBuilder(list, context,isSearch: true),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}