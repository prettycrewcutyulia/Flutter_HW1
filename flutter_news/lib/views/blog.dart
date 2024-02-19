import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/helpers/news_service.dart';
import 'package:flutter_news/models/article_model.dart';

import 'components/news_card.dart';

class Blog extends StatefulWidget {
  final String category;

  const Blog({super.key, required this.category});

  @override
  State<Blog> createState() => _BlogState();
}

class _BlogState extends State<Blog> {
  final List<ArticleModel> _articles = [];

  late bool _loading;

  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    _loading = true;
    _getNews();
    _loading = false;

    _controller.addListener(() {
      _loadMore();
    });
    super.initState();
  }

  final NewsService _news = NewsService();

  Future<void> _getNews() async {
    await _news.getNews(widget.category.toLowerCase());
    if (_news.news.isNotEmpty) {
      setState(() {
        _articles.addAll(_news.news);
      });
    } else {
      setState(() {
        _hasNextPage = false;
      });
    }
  }

  bool _isLoadMoreRunning = false;
  bool _hasNextPage = true;

  void _loadMore() async {
    if (_hasNextPage == true &&
        _isLoadMoreRunning == false &&
        _controller.position.pixels == _controller.position.maxScrollExtent) {
      setState(() {
        _isLoadMoreRunning = true;
      });
      await _getNews();
      setState(() {
        _isLoadMoreRunning = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: _loading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          itemCount: _articles.length,
                          shrinkWrap: true,
                          controller: _controller,
                          itemBuilder: (context, index) {
                            return NewsCard(article: _articles[index]);
                          },
                          padding: const EdgeInsets.symmetric(horizontal: 16)),
                    ),
                    if (_isLoadMoreRunning == true)
                      const Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 40),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    if (_hasNextPage == false)
                      Container(
                        padding: const EdgeInsets.only(top: 30, bottom: 40),
                        color: Colors.amber,
                        child: Center(
                          child:
                              Text('You have fetched all of the content'.tr()),
                        ),
                      ),
                  ],
                )),
    );
  }
}
