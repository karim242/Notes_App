import 'package:flutter/material.dart';

class EmptyView extends StatelessWidget {
  const EmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
            child: Expanded(
          child: Image.asset("assets/images/Notebook-rafiki.png"),
        )),
        const Text("Create your first note !"),
      ],
    );
  }
}
