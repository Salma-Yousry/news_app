import 'package:app_news/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsScreenDetails extends StatelessWidget {
   String newImage;
   String newTitle;
   String newData;
  String author;
  String description;
 String content;
  String source;
   String url;

  NewsScreenDetails({
    required this.description,
    required this.author,
    required this.source,
    required this.content,
    required this.newData,
    required this.newImage,
    required this.newTitle,
    required this.url,
  });


  Future<void> _launchUrl() async {
    final Uri _url = Uri.parse(url);

    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
      Container(
      color: AppColors.whiteColor,
      child: Image.asset('assets/images/background.png',
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
      ),
    ),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(newTitle),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(newImage),
                SizedBox(height: 15),
                Text(
                  newTitle,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppColors.blackColor
                  ),
                ),
                SizedBox(height: 15),
                Text('By $author \t on $newData',style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontSize:14,
                ),),
                SizedBox(height: 16),
               // Text('description :\n',style:Theme.of(context).textTheme.titleMedium),
               Text(' $description', style:Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                )),
                SizedBox(height: 16),
                //Text('content :\n',style:Theme.of(context).textTheme.titleMedium),
                Text(content),
                SizedBox(height: 16),
                GestureDetector(
                  onTap: () => _launchUrl(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'View Full Article',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      SizedBox(width: 5),
                      Icon(
                        Icons.arrow_right,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      ],
    );


  }
}







