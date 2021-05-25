import 'package:flutter/material.dart';
import 'package:news_app/src/constants.dart';
import 'package:news_app/views/web_view.dart';

class ArticleItem extends StatelessWidget {

  final article;

  ArticleItem({this.article});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        navigateTo(context: context,screen: WebViewScreen(url: article['url'],));
      },
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Container(
              width:120 ,
              height:120 ,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage('${article['urlToImage']}'),
                      fit: BoxFit.cover
                  )
              ),


            ),
            SizedBox(width: 20,),
            Expanded(
              child: Container(
                height: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,

                  children: [
                    Expanded(
                      child: Text('${article['title']}',
                        style:Theme.of(context).textTheme.bodyText1 ,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                    ),

                    Text('${article['publishedAt']}',style: TextStyle(color: Colors.grey),)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
