import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/blocs/news_blocs/news_cubit.dart';
import 'package:news_app/components/article_builder.dart';
import 'package:news_app/components/custome_text_field.dart';

class SearchScreen extends StatelessWidget {
var searchController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsState>(
      listener: (context,state){

      },
      builder: (context,state){

        var list =NewsCubit.get(context).search;
        return Scaffold(

          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: defaultFormField(

                    controller: searchController,
                    textInputType: TextInputType.text,
                    validate: (String value){
                      if(value.isEmpty)
                      {
                        return 'Search is empty';
                      }
                      return null;
                    },
                    label: 'Search ',
                    prefixIcon: Icons.search,
                    onChanged: (value){
                      NewsCubit.get(context).getSearch(value);

                    }
                ),

              ),
              Expanded(child: ArticleBuilder(list: list,isSearch: true,))
            ],
          ),
        );
      },
    );
  }
}
