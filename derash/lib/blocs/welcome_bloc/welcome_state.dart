part of 'welcome_bloc.dart';

@immutable
abstract class WelcomeState extends Equatable{}

class Uninitialized extends WelcomeState {
  @override
  List<Object?> get props => [];

}
class Initialized extends WelcomeState{
  @override
  List<Object?> get props => [];

}
