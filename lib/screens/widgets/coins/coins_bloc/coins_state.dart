part of 'coins_bloc.dart';

abstract class CoinsState {}

abstract class ActionState extends CoinsState{}

final class CoinInitialState extends CoinsState{}
final class CoinLoadingState extends CoinsState{}
final class CoinSuccessState extends CoinsState{
  List <CryptoCoins> criptoList=[];
  CoinSuccessState({required this.criptoList});
}
final class CoinErrorState extends CoinsState{}

