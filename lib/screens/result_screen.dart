import 'package:block_explorer/models/account_balance.dart';
import 'package:block_explorer/models/tx_model.dart';
import 'package:block_explorer/state_management/search_state_management.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getTxListProvider = FutureProvider<TxDataModel>((ref) {
  final walletAddress = ref.read(searchStateManagementProvider).walletAddress;
  return ref.read(searchStateManagementProvider).getTxList(walletAddress);
});

final getWalletBalanceProvider = FutureProvider<AccountBalance>((ref) {
  final walletAddress = ref.read(searchStateManagementProvider).walletAddress;
  return ref
      .read(searchStateManagementProvider)
      .getAccountBalance(walletAddress);
});

class ResultScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final size = MediaQuery.of(context).size;

    final walletBalanceAsyncValue = watch(getWalletBalanceProvider);
    final txListAsyncValue = watch(getTxListProvider);

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            walletBalanceAsyncValue.when(
              loading: () => CircularProgressIndicator(),
              data: (data) => Text(data.result),
              error: (error, stackTrace) => Container(),
            ),
            Container(
              padding: EdgeInsets.only(right: size.width * 0.1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Transactions',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  txListAsyncValue.when(
                    loading: () => CircularProgressIndicator(),
                    data: (data) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: data.result.length,
                        itemBuilder: (_, index) {
                          final transaction = data.result[index];

                          return ListTile(
                            dense: true,
                            leading: Icon(Icons.done),
                            title: Text(transaction.confirmations),
                            subtitle: Text(transaction.from),
                          );
                        },
                      );
                    },
                    error: (error, stackTrace) => Container(),
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
