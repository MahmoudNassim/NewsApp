import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

import 'package:webview_flutter/webview_flutter.dart';

class Webview extends StatelessWidget {

  final String url;

  const Webview(this.url, {super.key});

  @override
  Widget build(BuildContext context) {
    NewsCubit.get(context).getwebView(url);
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
            var controller = NewsCubit.get(context).controller ;  
        return Scaffold(
          appBar: AppBar(),
          body: WebViewWidget(controller: controller ),
        );
      },
    );
  }
}
