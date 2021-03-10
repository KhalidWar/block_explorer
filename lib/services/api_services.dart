import 'dart:convert';

import 'package:block_explorer/constant_secret.dart';
import 'package:block_explorer/models/tx_model.dart';
import 'package:http/http.dart' as http;

import '../constant_secret.dart';
import '../constants.dart';

class APIServices {
  Future getAccountBalance() async {
    final url =
        '$kBaseURL?module=$kModule&action=$kActionBalance&address=$kMetaMask&tag=$kTagLatest&apikey=$kAPIKey';

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        print(response.body);
        return response.body;
      }
    } catch (e) {
      throw e;
    }
  }

  Future<TxDataModel> getTxList(String address) async {
    final url =
        '$kBaseURL?module=$kModule&action=$kActionTxList&address=$address&tag=$kTagLatest&apikey=$kAPIKey';

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        return TxDataModel.fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    } catch (e) {
      throw e;
    }
  }
}
