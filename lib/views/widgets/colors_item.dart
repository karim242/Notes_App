import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constant.dart';
import 'package:notes_app/cubits/add_notes_cubit.dart';

class ColorsItem extends StatelessWidget {
  const ColorsItem({super.key, required this.isActive, required this.color});
  final bool isActive;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: isActive
          ? CircleAvatar(
              radius: 38,
              backgroundColor: Colors.blue,
              child: CircleAvatar(
                radius: 33,
                backgroundColor: color,
              ),
            )
          : CircleAvatar(
              radius: 35,
              backgroundColor: color,
            ),
    );
  }
}

class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int? currentIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: kColors.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              currentIndex = index;
              BlocProvider.of<AddNoteCubit>(context).color = kColors[index];
            });
          },
          child: ColorsItem(
            color: kColors[index],
            isActive: currentIndex == index,
          ),
        ),
      ),
    );
  }
}
