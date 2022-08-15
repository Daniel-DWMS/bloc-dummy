import 'package:bloc_dummy/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            ProfileBloc(userRepository: RepositoryProvider.of(context)),
        child: const _ProfileContent());
  }
}

class _ProfileContent extends StatefulWidget {
  const _ProfileContent();

  //final ProfileBloc bloc = BlocProvider.of(context);
  //bloc.add(event)
  //BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) => )
  //BlocListener<ProfileBloc, ProfileState>(listener: (context, state) =>)
  //BlocConsumer<ProfileBloc, ProfileState>(builder: (context, state),)

  // BlocProvider.of (bloc.add) -> zum Senden von Events z.B. Buttonklick oder Text ändert sich
  // BlocBuilder -> Wir wollen Stateänderungen mitbekommen und rerendern
  // BlocListener -> Wir wollen auf eine Stateänderung hören und eine Aktion ausführen
  // BlocConsumer -> Kombiniert Builder und Listener

  @override
  State<StatefulWidget> createState() => _ProfileContentState();

}

class _ProfileContentState extends State<_ProfileContent> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProfileBloc>(context).add(const ProfileFetchDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    final ProfileBloc bloc = BlocProvider.of<ProfileBloc>(context);
    print("build called");
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text("email"),
          const SizedBox(height: 8),
          BlocBuilder<ProfileBloc, ProfileState>(
              buildWhen: (previous, current) =>
              previous.userName != current.userName,
              builder: (context, state) {
                print("Rebuild");
                return Text(state.userName);
              }),
          const SizedBox(height: 16),
          TextField(
              onChanged: (text) =>
                  bloc.add(ProfileUserNameChangedEvent(userName: text)))
        ],
      ),
    );
  }
}
