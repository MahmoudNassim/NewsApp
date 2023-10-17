import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/layout/news_layout.dart';
import 'package:news_app/shared/app_cupit/cubit/cubit.dart';
import 'package:news_app/shared/app_cupit/cubit/states.dart';
import 'package:news_app/shared/bloc_observer.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  DioHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            home: const NewsLayout(),
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: const AppBarTheme(
                titleSpacing: 20,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.white,
                      statusBarIconBrightness: Brightness.dark,
                      ),
                      titleTextStyle: TextStyle(color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                      ),
                  backgroundColor: Colors.white,
                  elevation: 0.0,
                  iconTheme: IconThemeData(color: Colors.black)),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.deepOrange),
              textTheme: const TextTheme(
                titleMedium: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            darkTheme: ThemeData(
              
              scaffoldBackgroundColor: HexColor('333739'),
              appBarTheme: AppBarTheme(
                titleSpacing: 20,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: HexColor('333739'),
                      statusBarIconBrightness: Brightness.light),
                  backgroundColor: HexColor('333739'),
                  elevation: 0.0,
                  titleTextStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  iconTheme: const IconThemeData(color: Colors.white)),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                backgroundColor: HexColor('333739'),
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey,
              ),
              textTheme: const TextTheme(
                headline6: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                    
              ),
              primarySwatch: Colors.deepOrange
            ),
            themeMode:
                AppCubit.get(context).isdark ? ThemeMode.dark : ThemeMode.light,
                
          );
        },
      ),
    );
  }
}
