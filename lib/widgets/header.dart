import 'package:block_explorer/models/eth_price.dart';
import 'package:block_explorer/services/api_services.dart';
import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  final apiService = APIServices();

  EthPrice ethPrice = EthPrice();
  String ethSupply = '';

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
          Spacer(),
          Text('ETHUSD: \$${ethPrice.ethusd}'),
          SizedBox(width: size.width * 0.01),
          Text('ETHBTC: ${ethPrice.ethbtc}'),
        ],
      ),
    );
  }
}
