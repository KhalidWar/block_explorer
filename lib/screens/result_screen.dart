import 'package:block_explorer/models/tx_model.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key key, this.txModelList}) : super(key: key);

  final List<TxModel> txModelList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: txModelList.length,
          itemBuilder: (_, index) {
            return ListTile(
              dense: true,
              leading: Icon(Icons.done),
              title: Text(txModelList[index].confirmations),
              subtitle: Text(txModelList[index].from),
              trailing: IconButton(
                icon: Icon(Icons.done),
                onPressed: () {},
              ),
            );
          },
        ),
      ),
    );
  }
}
