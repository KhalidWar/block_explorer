import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.05,
      color: Colors.grey[200],
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Block Explorer',
            style: Theme.of(context).textTheme.headline6,
          ),
          // IconButton(
          //   icon: Icon(Icons.nights_stay_outlined),
          //   onPressed: () {},
          // ),
        ],
      ),
    );
  }
}
