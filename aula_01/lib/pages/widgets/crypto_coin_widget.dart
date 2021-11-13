import 'package:flutter/material.dart';

class CryptoCoinWidget {
  const CryptoCoinWidget(
    this.coinAbbreviation, {
    required this.coinName,
    required this.coinValue,
    required this.coinRaise,
    required this.bgColor,
  });

  final Color bgColor;
  final String coinAbbreviation;
  final String coinName;
  final num coinValue;
  final num coinRaise;

  StatelessWidget get listTile => _CryptoCoinCardUsingListTile(
        coinAbbreviation,
        coinName: coinName,
        coinValue: coinValue,
        coinRaise: coinRaise,
        bgColor: bgColor,
      );

  StatelessWidget get vanilla => _CryptoCoinCardUsingColumnsAndRows(
        coinAbbreviation,
        coinName: coinName,
        coinValue: coinValue,
        coinRaise: coinRaise,
        bgColor: bgColor,
      );
}

class _CryptoCoinCardUsingListTile extends StatelessWidget {
  const _CryptoCoinCardUsingListTile(
    this.coinAbbreviation, {
    required this.coinName,
    required this.coinValue,
    required this.coinRaise,
    required this.bgColor,
    Key? key,
  }) : super(key: key);

  final Color bgColor;
  final String coinAbbreviation;
  final String coinName;
  final num coinValue;
  final num coinRaise;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(6),
      ),
      height: 70,
      child: ListTile(
        leading: Container(
          // alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Color(0x30FFFFFF),
            shape: BoxShape.circle,
          ),
          width: 38,
          height: 38,
          child: Center(
            child: Text(
              coinAbbreviation[0],
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ),
        ),
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: '$coinAbbreviation ',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              TextSpan(
                text: coinName,
                style: const TextStyle(
                  color: Color(0x80FFFFFF),
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        subtitle: Text(
          '\$$coinValue',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        trailing: Text(
          '$coinRaise',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

class _CryptoCoinCardUsingColumnsAndRows extends StatelessWidget {
  const _CryptoCoinCardUsingColumnsAndRows(
    this.coinAbbreviation, {
    required this.coinName,
    required this.coinValue,
    required this.coinRaise,
    required this.bgColor,
    Key? key,
  }) : super(key: key);

  final Color bgColor;
  final String coinAbbreviation;
  final String coinName;
  final num coinValue;
  final num coinRaise;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(6),
      ),
      height: 70,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color(0x30FFFFFF),
                shape: BoxShape.circle,
              ),
              width: 38,
              height: 38,
              child: Center(
                child: Text(
                  coinAbbreviation[0],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '$coinAbbreviation ',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      '$coinName ',
                      style: const TextStyle(
                        color: Color(0x80FFFFFF),
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Text(
                  '\$$coinValue',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Text(
              '$coinRaise',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
