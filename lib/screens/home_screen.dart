import 'package:block_explorer/screens/error_screen.dart';
import 'package:block_explorer/screens/result_screen.dart';
import 'package:block_explorer/services/form_validation.dart';
import 'package:block_explorer/state_management/providers.dart';
import 'package:block_explorer/state_management/search_state_management.dart';
import 'package:block_explorer/widgets/header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

import '../widgets/footer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final formKey = GlobalKey<FormState>();
  final textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    void search() async {
      if (formKey.currentState.validate()) {
        await context
            .read(apiServiceProvider)
            .getAccountBalance(textEditingController.text.trim())
            .then((value) {
          if (value == null) {
            Navigator.of(context)
                .push(
                  MaterialPageRoute(
                    builder: (context) => ErrorScreen(),
                  ),
                )
                .whenComplete(() => textEditingController.clear());
          } else {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  context.read(searchStateManagementProvider).walletAddress =
                      textEditingController.text.trim();
                  return ResultScreen();
                },
              ),
            ).whenComplete(() => textEditingController.clear());
          }
        });
      }
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Header(),
            Column(
              children: [
                Container(
                  height: size.height * 0.3,
                  child: Lottie.asset('lottie/search.json'),
                ),
                Container(
                  width: size.width * 0.3,
                  child: Form(
                    key: formKey,
                    child: TextFormField(
                      controller: textEditingController,
                      validator: (input) =>
                          FormValidation().validateSearchInput(input),
                      onFieldSubmitted: (input) => search(),
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
                ),
                SizedBox(height: size.height * 0.03),
                ElevatedButton(
                  child: Text('Search'),
                  onPressed: () => search(),
                ),
              ],
            ),
            Footer(),
          ],
        ),
      ),
    );
  }
}
