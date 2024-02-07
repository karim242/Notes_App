import 'package:flutter/material.dart';

class NotesItems extends StatelessWidget {
  const NotesItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffFFCC80),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.only(top: 24, bottom: 24, left: 16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
        ListTile(
          title: const Text(
            'Flutter Tips',
            style: TextStyle(
              fontSize: 26,
              color: Colors.black,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text(
              "Build your career with tharwat samy",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black.withOpacity(.4),
              ),
            ),
          ),
          trailing: IconButton(
            icon: const Icon(
              Icons.delete,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            "May 21,2022",
            style: TextStyle(
              color: Colors.black.withOpacity(.4),
            ),
          ),
        )
      ]),
    );
  }
}