
import 'package:criptoapp/screens/coins/coins_bloc/coins_bloc.dart';
import 'package:criptoapp/screens/widgets/card_widget.dart';
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


