import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:criptoapp/Api/api_fuctions.dart';
import 'package:criptoapp/models/crpto_models.dart';
import 'package:criptoapp/screens/data/data_list.dart';

part 'coins_event.dart';
part 'coins_state.dart';

class CoinsBloc extends Bloc<CoinsEvent, CoinsState> {
  CoinsBloc() : super(CoinInitialState()) {
    on<FetchCoinsSuccessEvent>(fetchCoins);
    on<AddToWatchListEvent>(addToWatchList);
  }

  FutureOr<void> fetchCoins(
      FetchCoinsSuccessEvent event, Emitter<CoinsState> emit) async {
    emit(CoinLoadingState());
    final criptoCoins = await Api.getBitCoin();
    if (criptoCoins.isNotEmpty) {
      emit(CoinSuccessState(criptoList: criptoCoins));
    } else {
      emit(CoinErrorState());
    }
  }

  FutureOr<void> addToWatchList(
      AddToWatchListEvent event, Emitter<CoinsState> emit) {
    watchList.add(event.coin);
    emit(CoinAddedMessageState());
  }
}
