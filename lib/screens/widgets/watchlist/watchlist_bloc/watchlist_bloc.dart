import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:criptoapp/models/crpto_models.dart';
import 'package:criptoapp/screens/Widgets/watchlist/watchListData.dart';

part 'watchlist_event.dart';
part 'watchlist_state.dart';

class WatchlistBloc extends Bloc<WatchlistEvent, WatchlistState> {
  WatchlistBloc() : super(WatchlistInitial()) {
    on<FetchWatchListEvent>(fetchWatchlist);
    on<RemoveCoinEvent>(removeCoin);
  }

  FutureOr<void> fetchWatchlist(
      FetchWatchListEvent event, Emitter<WatchlistState> emit) {
    emit(WatchlistSuccessState(watchLists: watchList));
  }

  FutureOr<void> removeCoin(
      RemoveCoinEvent event, Emitter<WatchlistState> emit) {
    watchList.removeAt(event.index);
     emit(WatchlistSuccessState(watchLists: watchList));
  }
}
