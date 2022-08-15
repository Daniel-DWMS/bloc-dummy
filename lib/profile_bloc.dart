import 'package:bloc_dummy/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UserRepository userRepository;

  ProfileBloc({required this.userRepository}) : super(ProfileState.initial()) {
    on<ProfileFetchDataEvent>(_onFetchData);
    on<ProfileUserNameChangedEvent>(_onUserNameChanged);
    on<ProfileLogoutButtonPressedEvent>(_onLogoutButtonPressed);
  }

  void _onFetchData(
      ProfileFetchDataEvent event, Emitter<ProfileState> emit) async {
    try {
      final user = await userRepository.fetchUserById("1");
      emit(state.copyWith(
          userName: user.userName,
          email: user.email,
          status: ProfileStatus.idle));
    } catch (e) {
      emit(state.copyWith(status: ProfileStatus.error));
      // Handle the error
    }
  }

  void _onUserNameChanged(
      ProfileUserNameChangedEvent event, Emitter<ProfileState> emit) {
    emit(state.copyWith(userName: event.userName));
  }

  void _onLogoutButtonPressed(
      ProfileLogoutButtonPressedEvent event, Emitter<ProfileState> emit) {
    emit(state.copyWith(status: ProfileStatus.loading, isFocused: false));
  }
}
