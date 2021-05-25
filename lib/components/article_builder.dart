import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:news_app/components/article_item.dart';

class ArticleBuilder extends StatelessWidget {
  final list ;
  final bool isSearch;
  ArticleBuilder({this.list,this.isSearch=false});

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
        condition: list.length>0,
        fallback: (context) => isSearch?Container(): Center(child: CircularProgressIndicator()),
        builder: (context) => ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return ArticleItem(article: list[index],);
            },
            separatorBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(
                thickness: 4,
              ),
            ),
            itemCount: list.length));
  }
}
