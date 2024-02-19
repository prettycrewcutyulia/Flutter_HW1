import 'package:flutter/material.dart';
import 'package:flutter_news/models/article_model.dart';
import 'package:flutter_news/views/article_view.dart';

class NewsCard extends StatelessWidget {
  final ArticleModel article;
  const NewsCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => ArticleView(
              article: article,
            )
        ));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: Column(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(article.urlToImage)
            ),
            Text(article.title, style: const TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold
            ),
            ),
            Text(article.description, style: const TextStyle(
              color: Colors.grey,
            ),)
          ],
        ),
      ),
    );
  }
}