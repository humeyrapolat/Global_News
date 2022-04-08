import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/model/news_detail_model.dart';
import 'package:my_app/viewmodel/new_view_model.dart';
import 'package:provider/src/provider.dart';

class SavedNewsPage extends StatelessWidget {
  const SavedNewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Saved News", style: TextStyle(fontSize: 20),),
      ),
      body: ListView.builder(itemCount: context
          .watch<NewsViewModel>()
          .savedList
          ?.length ?? 0,
        itemBuilder: (c, i) {
          News savedNews = context.read<NewsViewModel>().savedList![i];
          return ListTile(
            title: Text(
              savedNews.title!.toString(), style: TextStyle(fontSize: 20),),
            trailing:
            IconButton(
              onPressed: () {
                context.read<NewsViewModel>().controlSaved(savedNews);
              },
                icon: Icon(context.watch<NewsViewModel>().isSaved(savedNews)
                    ? (Icons.save_outlined)
                    : (Icons.save))),
          );
        },),
    );
  }
}
