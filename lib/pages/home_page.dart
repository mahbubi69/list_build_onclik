import 'package:flutter/material.dart';
import 'package:list_view_onclik/pages/components/list_user_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List User'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[Colors.deepPurple, Colors.purple],
          )),
        ),
      ),
      body:const ListUserPage(),
    );
  }
}
