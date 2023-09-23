import 'package:criptoapp/screens/watchlist/watchlist_bloc/watchlist_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WatchListWidget extends StatefulWidget {
  const WatchListWidget({
    super.key,
  });

  @override
  State<WatchListWidget> createState() => _WatchListWidgetState();
}

class _WatchListWidgetState extends State<WatchListWidget> {
  @override
  void initState() {
    super.initState();
    context.read<WatchlistBloc>().add(FetchWatchListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: BlocConsumer<WatchlistBloc, WatchlistState>(
      buildWhen: (previous, current) => current is! WatchlistActionState,
      listenWhen: (previous, current) => current is WatchlistActionState,
      listener: (context, state) {
        if (state is CoinRemovedMessageState) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              behavior: SnackBarBehavior.floating,
              margin: EdgeInsets.all(10),
              duration: Duration(seconds: 1),
              backgroundColor: Colors.red,
              content: Text(
                "Coin Removed Successfuly",
                style: TextStyle(color: Colors.white),
              )));
        }
      },
      builder: (context, state) {
        if (state is WatchlistSuccessState) {
          return ListView.builder(
            itemCount: state.watchLists.length,
            itemBuilder: (context, index) => ListTile(
                leading: Text(state.watchLists[index].name),
                trailing: TextButton.icon(
                    onPressed: () => context
                        .read<WatchlistBloc>()
                        .add(RemoveCoinEvent(index: index)),
                    icon: const Icon(Icons.delete),
                    label: const Text('Remove'))),
          );
        } else {
          return const SizedBox.expand();
        }
      },
    ));
  }
}
