import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/blocs/news_blocs/news_cubit.dart';
import 'package:news_app/service/network/dio_helper.dart';
import 'package:news_app/src/constants.dart';
import 'package:news_app/views/search_screen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        NewsCubit cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('News APP'),
            actions: [
              IconButton(icon: Icon(Icons.search), onPressed: () {
                navigateTo(context:context ,screen:SearchScreen() );
              }),
              IconButton(
                  icon: Icon(Icons.brightness_4_sharp),
                  onPressed: () {
                    NewsCubit.get(context).changeAppMode();
                  }),
            ],
          ),
          body: cubit.screen[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.bottomItems,
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeBottomNavBar(index);
            },
          ),
        );
      },
    );
  }
}
