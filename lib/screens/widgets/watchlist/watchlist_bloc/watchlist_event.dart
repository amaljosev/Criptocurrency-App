part of 'watchlist_bloc.dart';

abstract class WatchlistEvent {}

final class FetchWatchListEvent extends WatchlistEvent {}

final class RemoveCoinEvent extends WatchlistEvent {
  final int index;
  RemoveCoinEvent({required this.index});
}
