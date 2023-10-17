import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/app_cupit/cubit/cubit.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..getBusiness(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {
        },
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
        appBar: AppBar(
          title: const Text('News App'),
          actions: [
            IconButton(onPressed: (){}, icon: const Icon(Icons.search)),
            IconButton(onPressed: (){
              AppCubit.get(context).changeAppMode();
            }, icon: const Icon(Icons.dark_mode_outlined)),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: cubit.currentIndex,
          onTap: (int index){
            cubit.changeBottomNavBar(index);
          },
          items: cubit.bottomItems
        ),
        body:cubit.screens[cubit.currentIndex] ,
          );
        },
      )
    );    
  }
}