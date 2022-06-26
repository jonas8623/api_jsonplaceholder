import 'package:api_json/bloc/bloc.dart';
import 'package:api_json/models/models.dart';
import 'package:api_json/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // late Future<List<User>> users;
  // AbstractUserService apiService = UserService();
  late UserBloc _userBloc;
  
  @override
  void initState() {
    super.initState();
    // users = apiService.fetchUser();
    _userBloc = UserBloc();
    _userBloc.add(LoadedListUserEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
          bloc: _userBloc,
          builder: (context, state) {
            if (state is LoadingUserState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is FetchUserState) {
              final user = state.users;
              return Scaffold(
                body: ListView.builder(
                    itemCount: user!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(user[index].name.toString()),
                        subtitle: Text(user[index].website.toString()),
                      );
                    }
                ),
              );
            }
            return Container();
          });
  }
}



// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     body: Center(
//         child: FutureBuilder<List<User>>(
//             future: users,
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 return ListView.builder(
//                   itemCount: snapshot.data!.length,
//                   itemBuilder: (context, index) {
//                     User user = snapshot.data![index];
//                     return ListTile(
//                       title: Text(user.name!),
//                       subtitle: Text(user.website!),
//                     );
//                   },
//                 );
//               } else if (snapshot.hasError) {
//                 return Text(snapshot.error.toString());
//               }
//               return const CircularProgressIndicator();
//             })
//     ),
//   );
// }
