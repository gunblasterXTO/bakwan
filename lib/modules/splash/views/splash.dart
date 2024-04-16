import 'package:bakwan/common/style/ui.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(color: UIConst.primaryColor),
        Center(
          child: Container(
            width: 200,
            height: 200,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bakwan.png"),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
