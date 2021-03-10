import 'package:block_explorer/models/tx_model.dart';
import 'package:block_explorer/services/api_services.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({Key key, this.walletAddress}) : super(key: key);

  final String walletAddress;

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  final apiService = APIServices();
  List<TxModel> txModelList = [];
  String walletBalance = '0';

  void init() async {
    apiService
      ..getTxList(widget.walletAddress).then((value) {
        setState(() {
          txModelList = value.result;
        });
      })
      ..getAccountBalance(widget.walletAddress).then((value) {
        setState(() {
          walletBalance = value.result;
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

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(walletBalance),
            Container(
              padding: EdgeInsets.only(right: size.width * 0.1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Transactions',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: txModelList.length,
                    itemBuilder: (_, index) {
                      final tx = txModelList[index];

                      return ListTile(
                        dense: true,
                        leading: Icon(Icons.done),
                        title: Text(tx.confirmations),
                        subtitle: Text(tx.from),
                        // trailing: IconButton(
                        //   icon: Icon(Icons.open_in_new),
                        //   onPressed: () {},
                        // ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
