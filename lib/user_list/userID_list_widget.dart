import 'package:auth/domain/address.dart';
import 'package:auth/domain/api_clients/api_client_userID.dart';
import 'package:auth/domain/userID.dart';
import 'package:flutter/material.dart';

class UserIDListWidget extends StatefulWidget {

  static const String routeName = '/userID';

  const UserIDListWidget({Key? key}) : super(key: key);

  @override
  _UserIDListWidgetState createState() => _UserIDListWidgetState();
}

class _UserIDListWidgetState extends State<UserIDListWidget> {


  late Future<List<UserID>> futureUserID;
  late List<UserID> usersIDListData;

  @override
  void initState() {
    super.initState();
    futureUserID = fetchUserID();
  }

// построение модели списка с необходимыми данными

    ListView usersIDListView(data) {
      return ListView.builder(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: const EdgeInsets.all(20),
          itemCount: data.length,
          itemBuilder: (context, index) {
            final userIDData = usersIDListData[index];
            return userListTileDetail(

                data[index].userId,
                data[index].id,
                data[index].title,
                data[index].completed,
                Icons.work);

          });
    }

// содержание списка

  Container userListTileDetail (int userId, int id, String title, bool completed, IconData icon) =>
      Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('$userId'),
            Text('$id'),
            Text(title),
            Text('$completed'),
            Text('$icon')
          ],
        ),
      );


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Список задач'),
      ),
      body: Center(
        child: FutureBuilder<List<UserID>>(
          future: futureUserID,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              usersIDListData = snapshot.data!;
              return usersIDListView(usersIDListData);
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

