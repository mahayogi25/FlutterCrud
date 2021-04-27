import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'styles.dart';
 
class Aboutus extends StatefulWidget {
@override
_AboutusState createState() => _AboutusState();
}
 
class _AboutusState extends State<Aboutus> {
 
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
                            'Lontarku adalah aplikasi berbasis mobile yang dikembangkan untuk mempermudah membuat list siswa yang ikut kegiatan Les Privat Anda',
                            style: kTitleStyle,
                            ),
                          SizedBox(height: 15.0),
                          Text(
                            'dengan lontarku, semua catatan tidak akan tercecer dan mudah untuk dimanajemen',
                            style: kSubtitleStyle,
                          ),
                        ],
                      ),
                    ),
                  ]
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