import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/helpers/data.dart';
import 'package:flutter_news/models/category_model.dart';
import 'package:flutter_news/views/components/category_card.dart';
import 'package:flutter_news/views/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewsAppBar extends StatefulWidget {
  const NewsAppBar({super.key});

  @override
  State<NewsAppBar> createState() => _NewsAppBarState();
}

class _NewsAppBarState extends State<NewsAppBar> {
  List<CategoryModel> categories = [];
  List<Tab> tabsCategories = [];
  List<Widget> windowCategories = [];
  bool isCategoryVisible = true;


  @override
  void initState() {
    super.initState();
    categories = getCategories();
    tabsCategories = categories.map(
            (e) => Tab(icon: CategoryCard(imageUrl: e.imageUrl, categoryName: e.categoryName))
    ).toList();
    windowCategories = categories.map((e) => Home(category: e.categoryName)).cast<Widget>().toList();
  }

  final IconData _iconlight = Icons.wb_sunny;
  final IconData _iconDark = Icons.nights_stay;
  bool isLight = false;

  @override
  DefaultTabController build(BuildContext context) {
    return DefaultTabController(
        length: categories.length,
        child:
        Scaffold (
          appBar: AppBar(
            title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('Flutter'),
                  Text(tr('News'), style: const TextStyle(color: Colors.blue))
                ]
            ),
              actions: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        //_changeTheme();
                        isLight = !isLight;
                      });
                      },
                    icon: Icon(isLight  ? _iconDark : _iconlight))
              ],
              centerTitle: true,
              elevation: 0.0,
            leading: IconButton(
              icon: const Icon(Icons.language),
              onPressed: () {
                if (context.locale == const Locale('ru')) {
                  context.setLocale(const Locale('en'));
                  rebuildAllChildren(context);
                } else {
                  context.setLocale(const Locale('ru'));
                  rebuildAllChildren(context);
                }
              },
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: TabBar(
                isScrollable: true,
                tabs: tabsCategories,
                padding: const EdgeInsets.only(bottom: 16),
              ),
            ),
          ),
          body: TabBarView(
            children: windowCategories,
          ),
        ));
  }

  void rebuildAllChildren(BuildContext context) {
    void rebuild(Element el) {
      el.markNeedsBuild();
      el.visitChildren(rebuild);
    }
    (context as Element).visitChildren(rebuild);
  }

  // Future<String> _getTheme() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return await prefs.getString('theme') ?? 'light';
  // }
  //
  // void _changeTheme() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String current = await prefs.getString('theme') ?? 'light';
  //   if (current == "light") {
  //     await prefs.setString('theme', "dark");
  //   } else {
  //     await prefs.setString('theme', "light");
  //   }
  // }
}
