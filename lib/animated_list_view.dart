import 'package:flutter/material.dart';

import 'object_model.dart';

class AnimatedListView extends StatelessWidget {
  final List<ObjectModel> list;
  final Widget? Function(int)? singleItem;
  const AnimatedListView({super.key, required this.list, this.singleItem});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 50, vertical: 50),
      physics: BouncingScrollPhysics(),
      itemCount: list.length,
      itemBuilder: (context, index) {
        return singleItem!(index);
      },
    );
  }
}
