import 'package:bloc/bloc.dart';
import 'user_state.dart';
import 'user_event.dart';
import 'package:RedditCloneMobile/repositories/repositories.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;
  UserBloc({this.userRepository}) : assert(userRepository != null);

  @override
  UserState get initialState => UserLoginLoading();

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is Login) {
      yield UserLoginLoading();

      try {
        final Map<String, dynamic> response = await userRepository.login(event.username, event.password);
        if (response.isNotEmpty) {
          yield UserLoginFinished();
        } else {
          yield UserLoginError();
        }
      } catch (err) {
        yield UserLoginError();
      }
    } else if (event is Register) {
      yield UserRegisterLoading();

      try {
        final Map<String, dynamic> response = await userRepository.register(event.username, event.email, event.password);
        if (response.isNotEmpty) {
          yield UserRegisterFinished();
        } else {
          yield UserRegisterError();
        }
      } catch (err) {
        yield UserRegisterError();
      }
    } else {
      yield UserLogoutLoading();

      try {
        final bool isLogout = await userRepository.logout();
        if (isLogout) {
          yield UserLogoutFinished();
        } else {
          yield UserLogoutError();
        }
      } catch (err) {
        yield UserLogoutError();
      }
    }
  }
}