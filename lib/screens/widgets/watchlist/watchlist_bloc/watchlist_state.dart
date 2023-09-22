part of 'watchlist_bloc.dart';

abstract class WatchlistState {}

final class WatchlistInitial extends WatchlistState {}

final class WatchlistSuccessState extends WatchlistState {
   List<CryptoCoins> watchLists; 
   WatchlistSuccessState({required this.watchLists});
}

