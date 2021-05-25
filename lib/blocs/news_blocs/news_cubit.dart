import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import 'package:news_app/service/network/dio_helper.dart';
import 'package:news_app/service/storage/cache_helper.dart';
import 'package:news_app/views/buisness_screen.dart';
import 'package:news_app/views/science_screen.dart';
import 'package:news_app/views/settings_screen.dart';
import 'package:news_app/views/sports.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context)=>BlocProvider.of(context);

  int currentIndex=0;
  List<BottomNavigationBarItem> bottomItems=[
    BottomNavigationBarItem(
      icon: Icon(Icons.business,

    ),
      label: 'Business'
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.sports,
        ),
        label: 'Sports'
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.science,

        ),
        label: 'Science'
    ),

  ];


  List<Widget>screen=[
    BuisnessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];


  List<dynamic>business=[];
  getBusiness()
  {
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(url: 'v2/top-headlines',
        query: {
          'country':'eg',
          'category':'business',
          'apiKey':'cf148e23f4f84d03af586483e3fba9e7'
        }
    ).then((value) {

      business=value.data['articles'];
      print(business[0]['title']);
      emit(NewsGetBusinessSucssesState());

    }).catchError((error){
      emit(NewsGetBusinessErrorState(error: error.toString()));
      print(error.toString());
    });
  }



  List<dynamic>sports=[];
  getSports()
  {
    if(sports.length==0)
      {
        emit(NewsGetBusinessLoadingState());
        DioHelper.getData(url: 'v2/top-headlines',
            query: {
              'country':'eg',
              'category':'sports',
              'apiKey':'cf148e23f4f84d03af586483e3fba9e7'
            }
        ).then((value) {

          sports=value.data['articles'];
          print(business[0]['title']);
          emit(NewsGetSportsSucssesState());

        }).catchError((error){
          emit(NewsGetSportsErrorState(error: error.toString()));
          print(error.toString());
        });
      }
    else
      {
        emit(NewsGetSportsSucssesState());
      }
  }


  List<dynamic>science=[];
  getScience()
  {

    if(science.length==0)
      {
        emit(NewsGetBusinessLoadingState());
        DioHelper.getData(url: 'v2/top-headlines',
            query: {
              'country':'eg',
              'category':'science',
              'apiKey':'cf148e23f4f84d03af586483e3fba9e7'
            }
        ).then((value) {
          science=value.data['articles'];
          print(science[0]['title']);
          emit(NewsGetScienceSucssesState());
        }
        ).catchError((error){
          emit(NewsGetScienceErrorState(error: error.toString()));
          print(error.toString());
        });
      }
    else {emit(NewsGetScienceSucssesState());}
  }



  List<dynamic>search=[];
  getSearch(String value)
  {

    emit(NewsGetSearchLoadingState());



      DioHelper.getData(url: 'v2/everything',
          query: {

            'q':'$value',
            'apiKey':'cf148e23f4f84d03af586483e3fba9e7'
          }
      ).then((value) {
        search=value.data['articles'];
        print(search[0]['title']);
        emit(NewsGetSearchSucssesState());
      }
      ).catchError((error){
        emit(NewsGetSearchErrorState(error: error.toString()));
        print(error.toString());
      });


  }



  void changeBottomNavBar(int index)
  {
    currentIndex=index;

    if(index==1)
      {
        getSports();
      }
    else if(index==2)
    {
      getScience();
    }
    emit(ChangeBottomNavBarState());
  }

ThemeMode appMode=ThemeMode.light;
 bool isDark=false;

 void changeAppMode({bool fromShared})
 {

   if(fromShared!=null)
     {
    isDark=fromShared;
    emit(ChangeModeState());
     }
   else
     {
       isDark=!isDark;
       CacheHelper.putData(key: 'isDark',value:isDark ).then((value) {
         emit(ChangeModeState());
       });
     }

 }




}
