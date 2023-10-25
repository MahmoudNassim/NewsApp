
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:news_app/modules/webview.dart';

  void navigateTo(context, widget) =>Navigator.push(context,
  MaterialPageRoute( builder: (context) => widget));

Widget myDivider() {
  return Padding(
    padding: const EdgeInsetsDirectional.only(start: 20),
    child: Container(
      width: double.infinity,
      height: 1,
      color: Colors.grey[300],
    ),
  );
}

Widget defaultFormField(
        {required TextInputType type,
        required TextEditingController controller,
        var onSumbit,
        var onChanged,
        required String label,
        required String? Function(String?)? validate,
        required var prefix,
        var suffix,
        var obsecuretext = false,
        var suffixpressed,
        var onTap,
        var isClickable = true}) =>
    TextFormField(
      keyboardType: type,
      controller: controller,
      obscureText: obsecuretext,
      onFieldSubmitted: onSumbit,
      onChanged: onChanged,
      validator: validate,
      onTap: onTap,
      enabled: isClickable,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(prefix),
        suffix: suffix != null
            ? IconButton(onPressed: suffixpressed, icon: Icon(suffix))
            : null,
        border: const OutlineInputBorder(),
      ),
    );

Widget buildArticleItem(article, context) {
  return GestureDetector(
    onTap: () {
      navigateTo(context, Webview(article['url']));
    },
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 120,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text(
                        '${article['title']}',
                        style: const TextStyle(
                          fontSize: 18, 
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    '${article['publishedAt']}',
                    style: const TextStyle(color: Colors.grey),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}
Widget articleBuilder(list, context) => ConditionalBuilder(
      condition: list.isNotEmpty,
      builder: (context) => ListView.separated(
          itemBuilder: (context, index) =>
              buildArticleItem(list[index], context),
          separatorBuilder: (context, index) => myDivider(),
          physics: const BouncingScrollPhysics(),
          itemCount: list.length),
      fallback: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
