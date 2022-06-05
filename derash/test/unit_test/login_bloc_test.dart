import 'package:bloc_test/bloc_test.dart';
import 'package:derash/blocs/auth/login_bloc/login_bloc.dart';
import 'package:derash/models/user.dart';
import 'package:derash/repository/user_reporitory.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  late UserRepository repository;

  setUp(() {
    repository = MockUserRepository();
  });

  group('LoginBloc', () {
    test('initial state is LoginState', () {
      final loginBloc = LoginBloc(repository);
      expect(loginBloc.state, Unauthenticated());
    });

    group('LoginSubmitted', () {
      String password = 'password';
      String email = 'username';
      final user = User(username: 'username', email: 'email');

      // bloc test for login successfull
      blocTest<LoginBloc, LoginState>(
        'emits [LoginInProgress, Authenticated] when logIn succed',
        setUp: () async {
          when(
            () => repository.login(email, password),
          ).thenAnswer((_) async {
            return user;
          });
        },
        build: () => LoginBloc(repository),
        act: (bloc) {
          bloc.add(Login('email', 'password'));
        },
        expect: () => [Loging(), Authenticated(user)],
      );

      blocTest<LoginBloc, LoginState>(
        'emits [LoginInProgress, loginfail] when logIn fail',
        setUp: () {
          when(
            () => repository.login(email, password),
          ).thenThrow(Exception('oops'));
        },
        build: () => LoginBloc(repository),
        act: (bloc) {
          bloc..add(Login('email', 'password'));
        },
        expect: () => [Loging()],
      );
    });
  });
}
