import 'package:criptoapp/models/crpto_models.dart';
import 'package:criptoapp/screens/coins/coins_bloc/coins_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoinCardWidget extends StatelessWidget {
  const CoinCardWidget({
    super.key,
    required this.criptoObject,
  });
  final CryptoCoins criptoObject;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.shade900,
          border: Border.all(
            color: Theme.of(context).colorScheme.onSecondary,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(8))),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(criptoObject.marketCapRank.toString()),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 15,
                    backgroundImage: NetworkImage(criptoObject.image),
                  ),
                ),
                Text(criptoObject.symbol),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(criptoObject.name),
              Text("\$ ${criptoObject.currentPrice.toString()}"),
            ],
          ),
          const Spacer(),
          Row(
            children: [
              ElevatedButton.icon(
                onPressed: () => context
                    .read<CoinsBloc>()
                    .add(AddToWatchListEvent(coin: criptoObject)),
                icon: const Icon(Icons.add),
                label: const Text('Watch List'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
