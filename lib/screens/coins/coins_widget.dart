import 'package:criptoapp/models/crpto_models.dart';
import 'package:criptoapp/screens/coins/coins_bloc/coins_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoinsWidget extends StatefulWidget {
  const CoinsWidget({
    super.key,
  });

  @override
  State<CoinsWidget> createState() => _CoinsWidgetState();
}

class _CoinsWidgetState extends State<CoinsWidget> {
  @override
  void initState() {
    super.initState();
    context.read<CoinsBloc>().add(FetchCoinsSuccessEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: BlocConsumer<CoinsBloc, CoinsState>(
      buildWhen: (previous, current) => current is! CoinActionState,
      listenWhen: (previous, current) => current is CoinActionState,
      listener: (context, state) {
        if (state is CoinAddedMessageState) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              behavior: SnackBarBehavior.floating,
              margin: EdgeInsets.all(10),
              duration: Duration(seconds: 1),
              backgroundColor: Colors.green,
              content: Text(
                "Coin Added Successfuly!!",
                style: TextStyle(color: Colors.white),
              )));
        }
      },
      builder: (context, state) {
        if (state is CoinSuccessState) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(
                itemBuilder: (context, index) =>
                    CoinCardWidget(criptoObject: state.criptoList[index]),
                separatorBuilder: (context, index) => const SizedBox(
                      height: 20,
                    ),
                itemCount: state.criptoList.length),
          );
        } else if (state is CoinLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    ));
  }
}

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
