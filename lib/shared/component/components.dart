import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

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

Widget buildArticleItem(article,context) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Expanded(
          child: Container(
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
                      style: Theme.of(context).textTheme.headline6
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
  );
}

Widget articleBuilder(list,context) => ConditionalBuilder(
  condition: list.isNotEmpty,
      builder: (context) => ListView.separated(
          itemBuilder: (context, index) => buildArticleItem(list[index],context),
          separatorBuilder: (context, index) => myDivider(),
          physics: const BouncingScrollPhysics(),
          itemCount: list.length),
      fallback: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
