import 'package:criptoapp/models/crpto_models.dart';
import 'package:criptoapp/screens/watchlist/watchlist_bloc/watchlist_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WatchlistCardWidget extends StatelessWidget {
  const WatchlistCardWidget({
    super.key,
    required this.criptoObject, required this.index,
    
  });
  final CryptoCoins criptoObject;
  final int index;
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
                Text('data'),
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
                    .read<WatchlistBloc>()
                    .add(RemoveCoinEvent(index:index )),
                icon: const Icon(Icons.delete),
                label: const Text('Remove'), 
              ),
            ],
          ),
        ],
      ),
    );
  }
}