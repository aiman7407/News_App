import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/blocs/news_blocs/news_cubit.dart';
import 'package:news_app/views/main_screen.dart';


class AppRoot extends StatelessWidget {

  final isDark;


  AppRoot({this.isDark});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(

      providers: [
        BlocProvider(
        create: ( BuildContext context)=>NewsCubit()..changeAppMode(fromShared: isDark)..getBusiness()..getSports()..getSports(),)
      ],
      child: BlocConsumer<NewsCubit,NewsState>(
        listener: (context,state){},
        builder: (context,state){

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                scaffoldBackgroundColor: Colors.white,
                primarySwatch: Colors.deepOrange,
                floatingActionButtonTheme: FloatingActionButtonThemeData(
                    backgroundColor: Colors.deepOrange
                ),
                appBarTheme: AppBarTheme(
                    iconTheme: IconThemeData(
                        color: Colors.black
                    ),
                    backwardsCompatibility: false,
                    systemOverlayStyle: SystemUiOverlayStyle(

                        statusBarIconBrightness: Brightness.dark ,
                        statusBarColor: Colors.white
                    ),
                    color: Colors.white,
                    elevation: 0,
                    titleTextStyle: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: Colors.deepOrange,
                    elevation: 20,
                    backgroundColor: Colors.white,
                    unselectedItemColor: Colors.grey
                ),
                textTheme: TextTheme(
                    bodyText1: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black
                    )
                )
            ),
            darkTheme: ThemeData(
                scaffoldBackgroundColor: Color(0xff333739),
                primarySwatch: Colors.deepOrange,
                floatingActionButtonTheme: FloatingActionButtonThemeData(
                    backgroundColor: Colors.deepOrange
                ),
                appBarTheme: AppBarTheme(
                    backgroundColor: Color(0xff333739),
                    iconTheme: IconThemeData(
                        color: Colors.white
                    ),
                    backwardsCompatibility: false,
                    systemOverlayStyle: SystemUiOverlayStyle(

                        statusBarIconBrightness: Brightness.light ,
                        statusBarColor: Color(0xff333739)
                    ),

                    elevation: 0,
                    titleTextStyle: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: Colors.deepOrange,
                    elevation: 20,
                    backgroundColor: Color(0xff333739),
                    unselectedItemColor: Colors.grey
                ),

                textTheme: TextTheme(
                    bodyText1: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white
                    )
                )
            ),
            themeMode:
            NewsCubit.get(context).isDark
                ?ThemeMode.dark
                :ThemeMode.light,

            home: Directionality(
                textDirection: TextDirection.rtl,
                child: MainScreen()),
          );
        },
      ),
    );
  }
}
