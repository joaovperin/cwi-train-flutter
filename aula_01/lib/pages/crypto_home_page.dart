import 'package:crypto_portfolio_and_wallet/colors.dart';
import 'package:crypto_portfolio_and_wallet/pages/widgets/crypto_coin_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CryptoHomePage extends StatelessWidget {
  const CryptoHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Current Portfolio'),
        elevation: 0,
        backgroundColor: darkBlueBg,
        centerTitle: true,
      ),
      body: Container(
        color: darkBlueBg,
        child: Container(
          margin: const EdgeInsets.fromLTRB(19, 0, 19, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 50),
                    const Text(
                      'BALANCE',
                      style: TextStyle(
                        color: Color(0x80FFFFFF),
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      '\$103,463.59',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 41,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: const [
                        Text(
                          '28.20%',
                          style: TextStyle(
                            color: Color(0xFF2AF598),
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(width: 12),
                        Text(
                          'today',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Your Coins',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                      CupertinoButton(
                        child: const Text(
                          '+',
                          style: TextStyle(
                            color: Color(0xFF2AF598),
                            fontSize: 31,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const CryptoCoinWidget(
                    'BTC',
                    coinName: 'Bitcoin',
                    coinValue: 6730.94,
                    coinRaise: 6.20,
                    bgColor: Color(0xFFF5317F),
                  ).listTile,
                  const SizedBox(height: 12),
                  const CryptoCoinWidget(
                    'ETH',
                    coinName: 'Ethereum',
                    coinValue: 490.26,
                    coinRaise: 18.05,
                    bgColor: Color(0xFF8739E5),
                  ).vanilla,
                  const SizedBox(height: 12),
                  const CryptoCoinWidget(
                    'LTC',
                    coinName: 'Litecoin',
                    coinValue: 130.31,
                    coinRaise: 51.80,
                    bgColor: Color(0xFFE56336),
                  ).listTile,
                  const SizedBox(height: 12),
                  const CryptoCoinWidget(
                    'XRP',
                    coinName: 'Ripple',
                    coinValue: 0.49,
                    coinRaise: 819000,
                    bgColor: Color(0xFF7DBD28),
                  ).vanilla,
                ]),
              ),
            ],
          ),
        ),
      ),
    );
    // return Container();
  }
}
