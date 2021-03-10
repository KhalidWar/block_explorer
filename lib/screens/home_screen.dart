import 'package:block_explorer/models/eth_price.dart';
import 'package:block_explorer/screens/result_screen.dart';
import 'package:block_explorer/services/api_services.dart';
import 'package:block_explorer/widgets/header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../widgets/footer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final apiService = APIServices();
  final formKey = GlobalKey<FormState>();
  final textEditingController = TextEditingController();

  EthPrice ethPrice = EthPrice();
  String ethSupply = 'asdfasdf';

  String validateInput(String input) {
    if (input.isEmpty || input == null) {
      return 'Please provide a valid Eth Wallet Address';
    }
    return null;
  }

  void init() {
    apiService
      ..getEtherPrice().then((value) {
        setState(() {
          ethPrice = value.result;
        });
      })
      ..getEtherSupply().then((value) {
        setState(() {
          ethSupply = value.result;
        });
      });
  }

  @override
  void initState() {
    super.initState();
    init();
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
                      validator: (input) => validateInput(input),
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
                  onPressed: () async {
                    if (formKey.currentState.validate()) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return ResultScreen(
                              walletAddress: textEditingController.text.trim(),
                            );
                          },
                        ),
                      ).whenComplete(() => textEditingController.clear());
                    }
                  },
                ),
              ],
            ),
            // Text(test),
            Container(),
            Footer(
              ethPrice: ethPrice,
              ethSupply: ethSupply,
            ),
          ],
        ),
      ),
    );
  }
}
