import 'package:criptoapp/screens/Widgets/coins/coins_widget.dart';
import 'package:criptoapp/screens/Widgets/watchlist/watchlist_widget.dart';
import 'package:flutter/material.dart';

class ScreenHome extends StatelessWidget { 
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Cryptocurrency Prices'),
            backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
            bottom: const TabBar(indicatorSize: TabBarIndicatorSize.tab, tabs: [
              Tab(
                text: 'Top Coins',
              ),
              Tab(
                text: 'Watch List',
              ),
            ]),
          ),
          body: const TabBarView(children: [
            CoinsWidget(),
            WatchListWidget(),
          ])),
    );
  }
}


