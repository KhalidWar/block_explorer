import 'package:block_explorer/services/api_services.dart';
import 'package:block_explorer/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../widgets/footer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final textEditingController = TextEditingController();
  final apiService = APIServices();
  String test = '';

  doIt() async {
    test = await apiService.getAccountBalance();
  }

  @override
  void initState() {
    super.initState();
    // doIt();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Header(),
            Column(
              children: [
                // Text(
                //   'Block Explorer',
                //   style: Theme.of(context)
                //       .textTheme
                //       .headline4
                //       .copyWith(fontSize: size.width * 0.03),
                // ),
                Container(
                  height: size.height * 0.3,
                  child: Lottie.asset('lottie/search.json'),
                ),
                Container(
                  width: size.width * 0.3,
                  child: TextFormField(
                    controller: textEditingController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      hintText: 'Search for anything',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                RaisedButton(
                  child: Text('Search'),
                  onPressed: () {},
                ),
              ],
            ),
            // Text(test),
            Container(),
            Footer(),
          ],
        ),
      ),
    );
  }
}
