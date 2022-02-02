import 'package:auth/domain/address.dart';
import 'package:auth/domain/api_clients/api_client_user.dart';
import 'package:auth/domain/api_clients/api_client_userID.dart';
import 'package:auth/domain/user.dart';
import 'package:auth/domain/userID.dart';
import 'package:auth/resources/style.dart';
import 'package:auth/user_list/userID_list_widget.dart';
import 'package:flutter/material.dart';

class UserListWidget extends StatefulWidget {
  const UserListWidget({Key? key}) : super(key: key);

  @override
  State<UserListWidget> createState() => _UserListWidgetState();
}

class _UserListWidgetState extends State<UserListWidget> {
  late Future<List<User>> futureUser;
  late List<User> usersListData;
  bool isTap = true;

  @override
  void initState() {
    super.initState();
    futureUser = fetchUser();
  }

// построение модели списка с необходимыми данными
  ListView usersListView(data) {
    return ListView.builder(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: const EdgeInsets.only(top: 20),
        itemCount: data.length,
        itemBuilder: (context, index) {
          final userData = usersListData[index];

          return ExpansionTile(
            key: Key('$index'),
            title: Text(userData.name, style: titleText,),
            subtitle: Text(userData.email),
            leading: const Icon(Icons.face_retouching_natural),
            children: <Widget>[
              Container(
                color: Colors.grey.withAlpha(55),
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Имя пользователя: ${userData.username}'),
                      Text('Улица: ${userData.address.street}'),
                      Text('Квартира: ${userData.address.suite}'),
                      Text('Город: ${userData.address.city}'),
                      Text('Индекс: ${userData.address.zipcode}'),
                      Text('Геолокация: ${userData.address.geo.lat}'),
                      Text('Геолокация: ${userData.address.geo.lng}'),
                    ],
                  ),
                ),
              )
            ],
          );


        });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: FutureBuilder<List<User>>(
          future: futureUser,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              usersListData = snapshot.data!;
              return usersListView(usersListData);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            // по умолчанию показывать счётчик загрузки (прогресс)
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
