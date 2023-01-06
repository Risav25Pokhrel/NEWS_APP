import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/resource/Mystyle.dart';
import 'package:news_app/resource/widget/arrow_button.dart';
import 'package:news_app/view/readnews.dart';
import 'package:news_app/view_model/allnewsdetails.dart';

class AutoScrolldesign extends StatelessWidget {
  const AutoScrolldesign({
    Key? key,
    required this.news,
    required this.newscategory,
  }) : super(key: key);

  final AsyncValue<newsdecode?> news;

  final String newscategory;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$newscategory:-",
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        AspectRatio(
          aspectRatio: 16 / 9,
          child: news.when(
              data: (news) => CarouselSlider.builder(
                  itemCount: 5,
                  itemBuilder: ((context, index, realIndex) {
                    if (index + 1 < 5) {
                      return InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>
                                    Newspage(content: news.articles![index]))),
                        child: Card(
                          child: Column(
                            children: [
                              AspectRatio(
                                aspectRatio: 16 / 6,
                                child: Image.network(
                                  news?.articles?[index].urlToImage ??
                                      "https://images.hindustantimes.com/img/2022/03/18/1600x900/pooja-hegde-1299286_1647620377611_1647620385049.jpg",
                                  fit: BoxFit.fill,
                                  filterQuality: FilterQuality.low,
                                ),
                              ),
                              const Spacer(flex: 2),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  news!.articles![index].title.toString(),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: scrollcontentstyle,
                                ),
                              ),
                              const Spacer(flex: 1),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text("Read All:-"),
                          Arrow_button(
                              onpressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => Allnews(
                                          all: news!.articles ?? [],
                                          categorytitle: newscategory)))),
                        ],
                      );
                    }
                  }),
                  options: CarouselOptions(
                    aspectRatio: 16 / 9,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: true,
                    viewportFraction: 1,
                  )),
              error: (error, stackTrace) => const Center(
                  child: Text(
                      "Server Error... Try again checking internet connection after 10")),
              loading: () => const Center(child: CircularProgressIndicator())),
        ),
      ],
    );
  }
}
