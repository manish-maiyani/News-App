import 'package:flutter/material.dart';
import 'package:newsapp/model/article_model.dart';
// import 'package:newsapp/pages/article_detail_page.dart';
import 'package:url_launcher/url_launcher.dart';

Widget customListTile(Article article, BuildContext context) {
  return InkWell(
    onTap: () async {
      _launchURL(article.url);
    },
    //() async {
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) => ArticlePage(
    //               article: article,
    //             )));
    // },
    child: Container(
      margin: EdgeInsets.all(12.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.horizontal(),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 3.0,
            ),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200.0,
            width: double.infinity,
            decoration: BoxDecoration(
              //let's add the height

              image: DecorationImage(
                  image: (article.urlToImage == null)
                      ? AssetImage('image/pic.png')
                      : NetworkImage(article.urlToImage),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.horizontal(),
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Container(
            padding: EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              color: Colors.blue[300],
              borderRadius: BorderRadius.horizontal(),
            ),
            child: Text(
              article.author,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            article.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          )
        ],
      ),
    ),
  );
}

void _launchURL(url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
