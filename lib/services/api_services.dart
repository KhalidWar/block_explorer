import 'package:block_explorer/constant_secret.dart';
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

  Future getTxList() async {
    final url =
        '$kBaseURL?module=$kModule&action=$kActionTxList&address=$kMetaMask&tag=$kTagLatest&apikey=$kAPIKey';

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

// Stream<AliasModel> getAllAliasesData() async* {
//   try {
//     final accessToken = await AccessTokenService().getAccessToken();
//     _headers["Authorization"] = "Bearer $accessToken";
//
//     final response = await http.get(
//         Uri.encodeFull('$kBaseURL/$kAliasesURL?deleted=with'),
//         headers: _headers);
//
//     if (response.statusCode == 200) {
//       print('getAllAliasesData ${response.statusCode}');
//       yield AliasModel.fromJson(jsonDecode(response.body));
//     } else {
//       print('getAllAliasesData ${response.statusCode}');
//       throw APIMessageHandler().getStatusCodeMessage(response.statusCode);
//     }
//   } catch (e) {
//     throw e;
//   }
// }
// '$kBaseURL?module=$kModule&action=$kAction&address=$kAddress&tag=$kTagLatest&apikey=$kAPIKey',

}
