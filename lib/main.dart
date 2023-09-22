import 'package:criptoapp/screens/Widgets/coins/coins_bloc/coins_bloc.dart';
import 'package:criptoapp/screens/Widgets/watchlist/watchlist_bloc/watchlist_bloc.dart';
import 'package:criptoapp/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CoinsBloc(),),
         BlocProvider(create: (context) => WatchlistBloc(),),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.deepPurple, brightness: Brightness.dark),
          useMaterial3: true,
        ),
        home: const ScreenHome(),
      ),
    );
  }
}
