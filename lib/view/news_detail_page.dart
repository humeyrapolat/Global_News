import 'package:flutter/cupertino.dart';
import 'package:my_app/model/news_detail_model.dart';
import 'package:my_app/viewmodel/new_view_model.dart';
import 'package:my_app/viewmodel/news_detail_vm.dart';
import 'package:provider/src/provider.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NewsDetailPage extends StatelessWidget {
  const NewsDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    News? comingNews = context.read<NewsDetailViewModel>().comingNews;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                context.read<NewsViewModel>().controlSaved(comingNews!);
              },
              icon: Icon(context.watch<NewsViewModel>().isSaved(comingNews!)
                  ? (Icons.save)
                  : (Icons.save_outlined),color: Colors.white,size: 30,
              )
          )
        ],
      ),
      body: SizedBox(
        height: 500,
        child: Card(
          margin: const EdgeInsets.all(5),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 1,
          color: Colors.white,
          child: Column(
            children: [
              CachedNetworkImage(
                  imageUrl: comingNews.image!,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.warning)),
              const SizedBox(
                height: 15,
              ),
              Text(
                comingNews.title!,
                style: const TextStyle(fontFamily: 'RobotoMono', fontSize: 20),
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: Text(
                  comingNews.description!.toString(),
                  style:
                      const TextStyle(fontFamily: 'RobotoMono', fontSize: 15),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
