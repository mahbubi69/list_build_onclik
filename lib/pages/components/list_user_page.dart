import 'package:flutter/material.dart';
import 'package:list_view_onclik/core/model/user.dart';
import 'package:list_view_onclik/core/repository/repository.dart';

class ListUserPage extends StatefulWidget {
  const ListUserPage({Key? key}) : super(key: key);

  @override
  _ListUserState createState() => _ListUserState();
}

class _ListUserState extends State<ListUserPage> {
  var repoUserList;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    repoUserList = Repository().getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<User>>(
        future: repoUserList,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            List<User> dataUser = snapshot.data;
            print(dataUser.length);
            return ListView.builder(
                itemCount: dataUser.length,
                itemBuilder: (context, index) {
                  User users = dataUser[index];
                  return GestureDetector(
                    onTap: () {
                      ShowDialogFunc(context, users.pictures.large,
                          users.name!.first, users.name!.last);
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Row(
                            children: <Widget>[
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                    color: Colors.deepPurple,
                                    borderRadius: BorderRadius.circular(60 / 2),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            users.pictures.large))),
                              ),
                              const SizedBox(
                                width: 6.0,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    ' ' + users.name!.first,
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  )
                                ],
                              ),
                              Text(
                                ' ' + users.name!.last,
                                style: const TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                });
          }
        },
      ),
    );
  }
}

ShowDialogFunc(
  context,
  String images,
  String firsName,
  String lastMame,
) {
  return showDialog(
      context: context,
      builder: (context) {
        return Center(
            child: Material(
          type: MaterialType.transparency,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            padding: const EdgeInsets.all(15),
            width: 320,
            height: 320,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    images,
                    height: 200,
                    width: 200,
                  ),
                ),
                Text(
                  ' ' + firsName,
                  style: const TextStyle(fontSize: 20, color: Colors.grey),
                ),
                Text(
                  ' ' + lastMame,
                  style: const TextStyle(fontSize: 20, color: Colors.grey),
                ),
              ],
            ),
          ),
        ));
      });
}
