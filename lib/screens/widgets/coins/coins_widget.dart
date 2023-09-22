import 'package:criptoapp/screens/Widgets/coins/coins_bloc/coins_bloc.dart';
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
      listener: (context, state) {},
      builder: (context, state) {
        if (state is CoinSuccessState) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.criptoList.length,
            itemBuilder: (context, index) => ListTile(
              leading: Text(state.criptoList[index].name),
              trailing: IconButton(
                  onPressed: () => context
                      .read<CoinsBloc>()
                      .add(AddToWatchListEvent(coin: state.criptoList[index])),
                  icon: const Icon(Icons.add)),
            ),
          );
        }else if(state is CoinLoadingState){
          return const Center(child: CircularProgressIndicator(),);
        }
         else {
          return const SizedBox.shrink();
        }
      },
    ));
  }
}
