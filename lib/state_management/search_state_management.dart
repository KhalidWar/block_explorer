import 'package:block_explorer/models/account_balance.dart';
import 'package:block_explorer/models/tx_model.dart';
import 'package:block_explorer/services/api_services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchStateManagementProvider =
    ChangeNotifierProvider((ref) => SearchStateManagement());

class SearchStateManagement extends ChangeNotifier {
  final _apiService = APIServices();

  List<TxModel> txModelList = [];
  String walletAddress = '0';

  Future<TxDataModel> getTxList(String walletAddress) async {
    return await _apiService.getTxList(walletAddress);
  }

  Future<AccountBalance> getAccountBalance(String walletAddress) async {
    return await _apiService.getAccountBalance(walletAddress);
  }
}
