import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/app_cupit/cubit/states.dart';
import 'package:news_app/shared/cubit/states.dart';
class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
    bool isdark = false ;
  changeAppMode(){
    isdark =! isdark ;
    emit(AppChangeModeState());
  }

}
