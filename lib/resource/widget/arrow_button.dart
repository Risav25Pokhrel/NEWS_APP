import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Arrow_button extends StatelessWidget {
  final VoidCallback onpressed;
  const Arrow_button({
    Key? key,
    required this.onpressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: IconButton(
          onPressed: onpressed,
          icon: const Icon(
            CupertinoIcons.arrow_right,
            size: 30,
          )),
    );
  }
}
