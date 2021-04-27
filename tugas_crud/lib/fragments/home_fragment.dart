import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tugas_crud/fragments/form.dart';
import 'styles.dart';
 
class OnboardingScreen extends StatefulWidget {
@override
_OnboardingScreenState createState() => _OnboardingScreenState();
}
 
class _OnboardingScreenState extends State<OnboardingScreen> {
 
@override
Widget build(BuildContext context) {
  return Scaffold(
    resizeToAvoidBottomPadding: false ,
    body: AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            stops: [0.1, 0.4, 0.7, 0.9],
            colors: [
            Color(4278249078),
            Color(4278241363),
            Color(4278249078),
            Color(4278241363),
            ],
          ),
        ),
        child:
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[

              Container(
                height: 600.0,
                child: PageView(
                  physics: ClampingScrollPhysics(),
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Center(
                            child: Image(
                            image: AssetImage(
                              'assets/ikon1.png',
                              ),
                              height: 200.0,
                              width: 200.0,
                            ),
                          ),
                          SizedBox(height: 50.0),
                          Text(
                            'Hallo, Selamat Datang Kembali',
                            style: kTitleStyle,
                            ),
                          SizedBox(height: 15.0),
                          Text(
                            'Lakukan yang terbaik setiap saat, dan hargai dirimu dengan beristirahat',
                            style: kSubtitleStyle,
                          ),
                        ],
                      ),
                    ),
                  ]
                ),
              ),

                        Container(
                          margin: const EdgeInsets.only(top: 6.0),
                        child : new RaisedButton(
                            onPressed: (){
                              Navigator.of(context).push(new MaterialPageRoute(
                              builder: (BuildContext context) => FormUser(),));
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(80.0)
                            ),
                            elevation: 0.0,
                              padding: EdgeInsets.all(0.0),
                            child: Ink(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [Colors.blueAccent,Colors.blue]
                                ),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: Container(
                                
                                constraints: BoxConstraints(minWidth: 300.0, minHeight: 50.0),
                                alignment: Alignment.center,
                                child: Text("TAMBAH DATA",
                                style: TextStyle(color: Colors.black, fontSize: 26.0, fontWeight:FontWeight.w700),
                                ),
                              ),
                            )
                          ),
                        ),
            ]
          ),
        ),
      ),
    )
  );
  }
}