import 'package:block_explorer/widgets/footer.dart';
import 'package:block_explorer/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ErrorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: size.height,
        width: double.infinity,
        child: Column(
          children: [
            Header(),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Couldn\'t find what you\'re looking for',
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          .copyWith(color: Colors.red),
                    ),
                    Lottie.asset('lottie/404.json'),
                  ],
                ),
              ),
            ),
            Footer(),
          ],
        ),
      ),
    );
  }
}
