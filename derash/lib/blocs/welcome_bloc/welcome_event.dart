part of 'welcome_bloc.dart';

@immutable
abstract class WelcomeEvent extends Equatable{}

class Initialize extends WelcomeEvent{
  @override
  List<Object?> get props => [];

}
