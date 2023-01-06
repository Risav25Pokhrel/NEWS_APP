import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/providers/futureproviders.dart';
import 'package:news_app/resource/widget/Scrollwidget.dart';
import 'package:news_app/resource/widget/autoscrollwidget.dart';

class Core extends StatefulWidget {
  const Core({super.key});

  @override
  State<Core> createState() => _CoreState();
}

class _CoreState extends State<Core> {
  List<String> Contentname = [
    "Trending News",
    "Business News",
    "Health News",
    "Technology News",
    "Science News",
    "Sports News"
  ];
  List<String> extranewsname = ["Tesla News", "Apple News", "Tech Cruch News"];
  @override
  Widget build(BuildContext context) {
    int j = 0;
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: ((context, innerBoxIsScrolled) => [
                SliverAppBar(
                  centerTitle: true,
                  floating: true,
                  snap: false,
                  backgroundColor: Colors.transparent,
                  title: AutoSizeText("NEWS",
                      minFontSize: 15,
                      style: GoogleFonts.eczar(
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.w500)),
                )
              ]),
          body: Consumer(builder: ((context, ref, child) {
            final trendingnews = ref.watch(tnewsprovider);
            final businessnews = ref.watch(bnewsprovider);
            final healthnews = ref.watch(healnewsprovider);
            final technews = ref.watch(technewsprovider);
            final sciencenews = ref.watch(scnewsprovider);
            final sportsnews = ref.watch(spnewsprovider);
            final teslanews = ref.watch(tesnewsprovider);
            final applenews = ref.watch(appleNewsprovider);
            final techcruchnews = ref.watch(techCruchprovider);

            List news = [
              trendingnews,
              businessnews,
              healthnews,
              technews,
              sciencenews,
              sportsnews
            ];
            List extranews = [teslanews, applenews, techcruchnews];

            return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      if (index % 2 == 0) {
                        print(index);
                      }
                      return Scrolldesign(
                        news: news[index],
                        newscategory: Contentname[index],
                      );
                    },
                    separatorBuilder: ((context, index) {
                      if (index % 2 == 0) {
                        return AutoScrolldesign(
                            news: applenews, newscategory: extranewsname[1]);
                      } else {
                        return const SizedBox.shrink();
                      }
                    }),
                    itemCount: Contentname.length));
          }))),
    );
  }
}
