import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/view_model/scroll_view.dart';

class Scrolldesign extends StatelessWidget {
  const Scrolldesign({
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
          aspectRatio: 3 / 1,
          child: news.when(
              data: (news) => Homescrollwidget(
                    content: news!.articles ?? [],
                    category: newscategory,
                  ),
              error: (error, stackTrace) => const Center(
                  child: Text(
                      "Server Error... Try again checking internet connection after 10")),
              loading: () => const Center(child: CircularProgressIndicator())),
        ),
      ],
    );
  }
}
