part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {

  const ProfileEvent();
}

class ProfileUserNameChangedEvent extends ProfileEvent {

  final String userName;

  const ProfileUserNameChangedEvent({required this.userName});
}

class ProfileLogoutButtonPressedEvent extends ProfileEvent {

  const ProfileLogoutButtonPressedEvent();
}

class ProfileFetchDataEvent extends ProfileEvent {

  const ProfileFetchDataEvent();
}