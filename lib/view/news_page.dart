import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/model/languages_list_model.dart';
import 'package:my_app/model/news_detail_model.dart';
import 'package:my_app/viewmodel/new_view_model.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "News",
          style: TextStyle(fontFamily: 'RobotoMono', fontSize: 25),
        ),
        actions: <Widget>[
          IconButton(
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              }),
          IconButton(
              icon: const Icon(
                Icons.favorite,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pushNamed(context, "/savedNews");
              })
        ],
      ),
      body: context.watch<NewsViewModel>().newsList!.news!.isEmpty &&
          context.watch<NewsViewModel>().languagesListModel!.languages!.toJson().values.isNotEmpty
          ? Center(child: Image.asset("assets/loading_two.gif"))
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 40,
                    child: ListView.builder(scrollDirection: Axis.horizontal,itemCount:
                    context.watch<NewsViewModel>().languagesListModel!.languages!.toJson().values.length,
                        itemBuilder: (c,i) {
                      String? languageItem =
                          context.watch<NewsViewModel>().languagesListModel!.languages!.toJson().keys.elementAt(i);

                      return Padding(
                        padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                        child: OutlinedButton(

                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(110,30),
                                primary: Colors.red[800],
                                alignment: Alignment.center,
                                onPrimary: Colors.white
                            ),
                            onPressed: () {
                              String keyValue = context.read<NewsViewModel>().languagesListModel!.languages!.toJson().values.elementAt(i);
                              context.read<NewsViewModel>().getData(keyValue);

                            },
                            child: Text(languageItem),

                        ),
                      );
                    }),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount:
                          context.watch<NewsViewModel>().newsList!.news!.length,
                      itemBuilder: (c, i) {
                        News newItem =
                            context.watch<NewsViewModel>().newsList!.news![i];
                        return InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, "/detail",
                                arguments: newItem);
                          },
                          child: Card(
                            elevation: 4.0,
                            shadowColor: Colors.grey[100],
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(children: [
                                CachedNetworkImage(
                                    imageUrl: newItem.image!,
                                    placeholder: (context, url) =>
                                        CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.warning)),
                                Text(
                                  newItem.title!,
                                  style: const TextStyle(
                                      fontFamily: 'RobotoMono', fontSize: 20),
                                ),
                                Text(
                                  newItem.description!.toString(),
                                  style: const TextStyle(
                                      fontFamily: 'RobotoMono', fontSize: 14),
                                )
                              ]),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  late Widget _lastFutureBuilder;

  List<News> recentTitle = [];

  @override
  List<Widget>? buildActions(BuildContext context) {
    //actions for app bar
    return [
      IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    //leading icon on the left of the app bar
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, "");
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return _lastFutureBuilder;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when someone searches for something

    final suggestionTitle = query.isEmpty
        ? recentTitle
        : context
            .watch<NewsViewModel>()
            .newsList!
            .news!
            .where((element) => element.title!.contains(query))
            .toList();

    return ListView.builder(
        itemBuilder: (context, index) => ListTile(
              onTap: () {
                recentTitle.add(suggestionTitle[index]);
                Navigator.pushNamed(context, "/detail",
                    arguments: suggestionTitle[index]);
              },
              title: Text(suggestionTitle[index].title as String),
              leading: const Icon(Icons.category),
            ),
        itemCount: suggestionTitle.length);
  }
}
