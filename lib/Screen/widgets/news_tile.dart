import 'package:flutter/material.dart';
import 'package:news_app/Database/database_helper.dart';
import 'package:news_app/Model/news_article.dart';
import 'package:news_app/locator.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsTile extends StatelessWidget {
  final Article article;

  const NewsTile({super.key, required this.article});

  _launchUrl() async {
    var result = await canLaunchUrl(Uri.parse(article.url));
    if (result) {
      await launchUrl(Uri.parse(article.url));
    } else {
      throw 'Could not launch URL';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.amberAccent,
            // border: Border(),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            Container(
              decoration: BoxDecoration(
                  // color: Colors.amber,
                  borderRadius: BorderRadius.circular(10)),
              // width: double.infinity,
              // height: 150,
              child: Image.network(
                article.urlToImage ?? "null",
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    );
                  }
                },
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset('assets/images/no_internet.png');
                },
              ),
            ),
            // const Spacer(),
            Text(
              article.title,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              article.description ?? "null",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () async {
                      await locator<DatabaseHelper>().addArticle(article);
                    },
                    icon: Icon(
                      Icons.bookmark_outline,
                      size: 30,
                    )),
                IconButton(
                    onPressed: _launchUrl,
                    icon: Icon(
                      Icons.launch,
                      size: 30,
                    ))
              ],
            )
          ]),
        ),
      ),
    );
  }
}
