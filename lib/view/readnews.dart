import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/resource/Mystyle.dart';
import 'package:text_scroll/text_scroll.dart';
import 'package:url_launcher/url_launcher.dart';

class Newspage extends StatelessWidget {
  final Articles content;
  const Newspage({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            automaticallyImplyLeading: false,
            title: TextScroll(
              content.title ?? "",
              intervalSpaces: 50,
              velocity: const Velocity(pixelsPerSecond: Offset(50, 0)),
              style: appbarstyle,
            ),
            expandedHeight: 200,
            pinned: true,
            floating: true,
            snap: false,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              background: Image.network(
                content.urlToImage ??
                    "https://thumbs.dreamstime.com/b/no-image-available-icon-vector-illustration-flat-design-140633878.jpg",
                fit: BoxFit.fill,
              ),
            ),
          )
        ],
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Text(content.description ?? "",
                  style: GoogleFonts.barlow(
                      color: Colors.indigo, fontWeight: FontWeight.w400)),
              const SizedBox(height: 40),
              Text(content.content ?? "", style: contentstyle),
              const Spacer(flex: 1),
              ElevatedButton.icon(
                  onPressed: () async {
                    if (await launchUrl(Uri.parse(content.url ?? ""))) {
                    } else {
                      print("no data");
                    }
                  },
                  icon: const Icon(Icons.web),
                  label: const Text("Read Complete news")),
              const Spacer(flex: 1)
            ],
          ),
        ),
      )),
    );
  }
}
