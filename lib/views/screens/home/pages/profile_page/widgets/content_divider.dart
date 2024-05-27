import 'package:flutter/material.dart';

class ContentDivider extends StatelessWidget {
  final Color? color;
  const ContentDivider({super.key,this.color});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        const SizedBox(height: 10,),
        Divider(
                        color:  Theme.of(context).brightness == Brightness.light
              ? color ?? const Color.fromARGB(251, 237, 237, 237) : const Color.fromARGB(250, 20, 20, 20)
              ),
              const SizedBox(height: 10,)
      ],
    );
  }
}