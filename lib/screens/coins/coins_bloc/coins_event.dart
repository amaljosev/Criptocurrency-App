part of 'coins_bloc.dart';

abstract class CoinsEvent {}

final class FetchCoinsSuccessEvent extends CoinsEvent{}
final class AddToWatchListEvent extends CoinsEvent{
  final CryptoCoins coin;
  AddToWatchListEvent({required this.coin}); 
}
