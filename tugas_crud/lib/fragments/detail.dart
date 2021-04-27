import 'package:flutter/material.dart';
import 'package:tugas_crud/model/user.dart';
import 'package:tugas_crud/screen/user_edit.dart';
import 'package:tugas_crud/service/user_service.dart';
import 'package:tugas_crud/util/capitalize.dart';

class DetailUser extends StatefulWidget {

  final int id;
  DetailUser({@required this.id, Key key}):super(key: key);

  @override
  _DetailUserState createState() => _DetailUserState();
}

class _DetailUserState extends State<DetailUser> {

  UserApiService apiService;
  User _user;
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    apiService = UserApiService();
    super.initState();
  }

  _showSnackBar(message){
    final snackbar = SnackBar(content: Text(message),);
    _scaffoldkey.currentState.showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,

      appBar: AppBar(
        title: Text("Detail"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => {
            Navigator.pop(context),
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit), 
            onPressed: () {
              Navigator.push(context, 
              MaterialPageRoute(builder: (BuildContext context) => FormEditUser(
                user: _user,
                id: widget.id),
                ),
              );
            }
          ),
          IconButton(
            icon: Icon(Icons.delete), 
            onPressed: () {
              final onSuccess = (Object obj) async {
                _showSnackBar("Data Terhapus");
                await Future.delayed(Duration(seconds: 2)).then((Object obj) => Navigator.pop(context));
              };
              final onError = (Object obj) => _showSnackBar("Gagal");
              apiService.deleteUser(id: widget.id).then(onSuccess).catchError(onError);
            },
          ),
        ],
      ),
      body: Center(
        child: FutureBuilder<User>(
          future: apiService.getUserBy(widget.id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.none &&
                snapshot.hasData == null) {
              return LinearProgressIndicator();
            } else if (snapshot.connectionState == ConnectionState.done) {
              _user = snapshot.data;
              if(_user.id != 0){

                return ListView(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Image.asset(
                        'assets/images/${_user.gender}.png',
                        width: 150.0,
                        height: 150.0,
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.account_box),
                      title: Text(_user.fullName),
                      subtitle: const Text('Nama'),
                    ),
                    ListTile(
                      leading: Icon(Icons.phone),
                      title: Text(_user.phone),
                      subtitle: const Text('No.Hp'),
                    ),
                    ListTile(
                      leading: Icon(Icons.label),
                      title: Text(capitalize(_user.gender)),
                      subtitle: const Text('Gender'),
                    ),
                    ListTile(
                      leading: Icon(Icons.school),
                      title: Text(_user.grade.toUpperCase()),
                      subtitle: const Text('Grade'),
                    ),
                  ],
                );
              } else {
                return Text("Data Tidak Ditemukan");
              }
          
            } else {
              return Center(
                child: Container(),
              );
            }
          }
        ),
      ),
    );
  }
}