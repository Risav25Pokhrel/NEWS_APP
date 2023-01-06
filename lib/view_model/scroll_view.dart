import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/resource/widget/arrow_button.dart';
import 'package:news_app/view/readnews.dart';
import 'package:news_app/view_model/allnewsdetails.dart';

class Homescrollwidget extends StatelessWidget {
  final List content;
  final String category;
  const Homescrollwidget({
    Key? key,
    required this.content, required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: content.length >= 4 ? 5 : content.length,
        itemBuilder: (context, index) {
          if (index + 1 < 5) {
            return AspectRatio(
              aspectRatio: 2 / 1,
              child: InkWell(
                onTap: () =>
                    navigateTo(context, Newspage(content: content[index])),
                child: Card(
                    color: const Color.fromARGB(255, 234, 234, 234),
                    elevation: 3,
                    margin: const EdgeInsets.only(bottom: 5, left: 10, top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 5, top: 3),
                              height: MediaQuery.of(context).size.width / 5,
                              width: MediaQuery.of(context).size.width / 4,
                              child: Image.network(
                                content[index].urlToImage ??
                                    "https://thumbs.dreamstime.com/b/no-image-available-icon-vector-illustration-flat-design-140633878.jpg",
                                filterQuality: FilterQuality.low,
                                fit: BoxFit.fill,
                              ),
                            ),
                            const Spacer(flex: 2),
                            Padding(
                              padding: const EdgeInsets.only(left: 4),
                              child: Text(
                                content[index].source.name,
                                style: GoogleFonts.sourceSans3(
                                    fontSize: 10, fontWeight: FontWeight.w700),
                              ),
                            ),
                            const SizedBox(height: 5)
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 5, top: 5),
                          height: MediaQuery.of(context).size.width / 5,
                          width: MediaQuery.of(context).size.width / 3.2,
                          child: AutoSizeText(
                            content[index].title,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 5,
                            minFontSize: 10,
                            style:
                                GoogleFonts.merriweather(color: Colors.indigo),
                          ),
                        )
                      ],
                    )),
              ),
            );
          } else {
            return Arrow_button(
                onpressed: () => navigateTo(
                    context,
                    Allnews(
                      all: content, categorytitle: category,
                    )));
          }
        });
  }

  void navigateTo(BuildContext context, Widget page) =>
      Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context) => page),
      );
}
