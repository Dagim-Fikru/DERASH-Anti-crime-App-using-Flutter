import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'welcome_event.dart';
part 'welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc() : super(Uninitialized()) {
    on<Initialize>((event, emit) async{
        await _sometime();
        emit(Initialized());
    });
  }


  Future<void> _sometime(){
    return Future.delayed(Duration(seconds: 4,));
  }
}
