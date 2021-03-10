import 'package:block_explorer/models/eth_price.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({Key key, this.ethSupply, this.ethPrice}) : super(key: key);

  final String ethSupply;
  final EthPrice ethPrice;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.05,
      color: Colors.grey[200],
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text('ETH/USD: \$${ethPrice.ethusd}'),
          SizedBox(width: size.width * 0.01),
          Text('ETH/BTC: ${ethPrice.ethbtc}'),
          Spacer(),
          InkWell(
            child: Text(
              'Crafted by KhalidWar',
            ),
            onTap: () {
              //todo navigate URL launcher to KhalidWar's website
            },
          ),
          SizedBox(width: size.width * 0.01),
          InkWell(
            child: Text('Powered by Etherscan.io\'s API'),
            onTap: () {
              //todo navigate URL launcher to Etherscan's API page
            },
          ),
        ],
      ),
    );
  }
}
