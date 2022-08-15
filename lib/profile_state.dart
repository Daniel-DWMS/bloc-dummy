part of 'profile_bloc.dart';

@immutable
class ProfileState {
  final String userName;

  final String email;

  final bool isFocused;

  final ProfileStatus status;

  const ProfileState({
    required this.userName,
    required this.email,
    required this.isFocused,
    required this.status,
  });

  factory ProfileState.initial() {
    return const ProfileState(
      userName: "",
      email: "",
      isFocused: false,
      status: ProfileStatus.idle,
    );
  }

  ProfileState copyWith(
      {String? userName,
      String? email,
      bool? isFocused,
      ProfileStatus? status}) {
    return ProfileState(
        userName: userName ?? this.userName,
        email: email ?? this.email,
        isFocused: isFocused ?? this.isFocused,
        status: status ?? this.status);
  }
}

enum ProfileStatus {
  idle,
  loading,
  error,
}
