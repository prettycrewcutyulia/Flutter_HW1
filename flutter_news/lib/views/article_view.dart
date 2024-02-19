import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/models/article_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleView extends StatelessWidget {
  final ArticleModel article;

  const ArticleView({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          const Text('Flutter'),
          Text('News'.tr(),
              style: TextStyle(
                  color: Theme.of(context).textSelectionTheme.selectionColor))
        ]),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: CachedNetworkImage(
                    imageUrl: article.urlToImage,
                    height: 200,
                    width: 400,
                    fit: BoxFit.cover)),
            Text(
              article.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              article.description,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              onPressed: () async {
                String url = article.url;
                Uri uri = Uri.parse(url);
                try {
                  await launchUrl(uri);
                } catch (error) {
                  debugPrint('Could not launch $url');
                }
              },
              child: Text('Learn more...'.tr()),
            ),
          ],
        ),
      ),
    );
  }
}
