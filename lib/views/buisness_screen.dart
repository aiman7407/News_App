import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/blocs/news_blocs/news_cubit.dart';
import 'package:news_app/components/article_builder.dart';
import 'package:news_app/components/article_item.dart';

class BuisnessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var list= NewsCubit.get(context).business;

        return ArticleBuilder(list: list,);
      },
    );
  }
}
