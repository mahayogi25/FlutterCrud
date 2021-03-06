import 'package:flutter/material.dart';
import 'package:tugas_crud/model/user.dart';
import 'package:tugas_crud/fragments/form.dart';
import 'detail.dart';
import 'package:tugas_crud/service/user_service.dart';
import 'package:tugas_crud/util/capitalize.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  UserApiService apiService;

  @override
  void initState() {
    super.initState();
    apiService = UserApiService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: apiService.getUsers(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                  "Something wrong with message: ${snapshot.error.toString()}"),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            List<User> users = snapshot.data;
            print(users);
            return _buildListView(users);
          } else {
            return Center(
              child: Container(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (BuildContext context) => FormUser()) 
          );
        }
      ),
    );
  }

  Widget _buildListView(List<User> users) {
    return  ListView.separated(
      separatorBuilder: (BuildContext context, int i) => Divider(color: Colors.grey[400]),
      itemCount: users.length,
      itemBuilder: (context, index) {
        User user = users[index];
        return ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (BuildContext context) => DetailUser(id: user.id, key: ValueKey(user.id))) 
            );
          },
          leading: Icon(Icons.people),
          title: Text(user.fullName),
          subtitle: Text(capitalize(user.gender)),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(user.grade.toUpperCase()),
              Text(user.phone)
            ],
          ),
        );  
      },
    );
  }
}