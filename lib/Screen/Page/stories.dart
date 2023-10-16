import 'package:flutter/material.dart';
import 'package:news_app/Constants/enums.dart';
import 'package:news_app/Database/database_helper.dart';
import 'package:news_app/Networking/news_api.dart';
import 'package:news_app/Screen/widgets/news_tile.dart';
import 'package:news_app/locator.dart';


class Stories extends StatefulWidget {
  const Stories({super.key, required this.story});
  final STORY story;
  @override
  State<Stories> createState() => _StoriesState();
}

class _StoriesState extends State<Stories> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: (widget.story == STORY.EVERYTHING)
            ? locator<NewsAPI>().getEveryNewsArticles()
            : (widget.story == STORY.TOP_HEADLINES)
            ? locator<NewsAPI>().getTopHeadlineNewsArticles()
            : locator<DatabaseHelper>().getAllArticles(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              // child: Text('Error: ${snapshot.error}'),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/no_internet.png'),
                  const SizedBox(height: 10,),
                  const Text("Check your internet connection and try again",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500,),)
                ],
              ),
            );
          } else {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return NewsTile(
                      article: snapshot.data![index],);
                });
          }
        }));
  }
}
