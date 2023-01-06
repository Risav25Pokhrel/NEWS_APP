import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:news_app/view/readnews.dart';

class Allnews extends StatelessWidget {
  final List all;
  final String categorytitle;
  const Allnews({super.key, required this.all, required this.categorytitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverAppBar(
                  title: Text(categorytitle),
                  floating: true,
                  snap: false,
                )
              ],
          body: ListView.builder(
              itemCount: all.length,
              itemBuilder: ((context, index) {
                return InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => Newspage(content: all[index]))),
                  child: Card(
                      elevation: 20,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AspectRatio(
                              aspectRatio: 16 / 9,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        image: NetworkImage(all[index]
                                                .urlToImage ??
                                            "https://thumbs.dreamstime.com/b/no-image-available-icon-vector-illustration-flat-design-140633878.jpg"),
                                        fit: BoxFit.cover)),
                              ),
                            ),
                            Text(
                              all[index].title.toString(),
                              style: GoogleFonts.merriweather(
                                  color: Colors.indigo,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              all[index].description ?? "",
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 10),
                            AutoSizeText.rich(TextSpan(
                                text: "Author:\t\t",
                                style: const TextStyle(color: Colors.blue),
                                children: [
                                  TextSpan(
                                      text: all[index].author.toString(),
                                      style:
                                          const TextStyle(color: Colors.green))
                                ])),
                            const SizedBox(height: 10),
                            AutoSizeText.rich(TextSpan(
                                text: "Published date:\t\t",
                                style: const TextStyle(color: Colors.blue),
                                children: [
                                  TextSpan(
                                      text: DateFormat("MMMM d")
                                          .format(DateTime.parse(
                                              all[index].publishedAt))
                                          .toString(),
                                      style:
                                          const TextStyle(color: Colors.green))
                                ]))
                          ],
                        ),
                      )),
                );
              }))),
    );
  }
}
