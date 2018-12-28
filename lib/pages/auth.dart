import 'package:flutter/material.dart';
import './products.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  String _emailValue;
  String _passValue;
  bool _acceptTerms = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5), BlendMode.dstATop),
                image: AssetImage('assets/background.jpg'))),
        padding: EdgeInsets.all(10.0),
        child: Center(
            child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                    labelText: 'Email', filled: true, fillColor: Colors.white),
                keyboardType: TextInputType.emailAddress,
                onChanged: (String value) {
                  print(value);
                  setState(() {
                    _emailValue = value;
                  });
                },
              ),
              SizedBox(height: 10.0,),
              TextField(
                decoration: InputDecoration(
                    labelText: 'Password',
                    filled: true,
                    fillColor: Colors.white),
                obscureText: true,
                onChanged: (String value) {
                  print(value);
                  setState(() {
                    _passValue = value;
                  });
                },
              ),
              SwitchListTile(
                value: _acceptTerms,
                onChanged: (bool newvalue) {
                  setState(() {
                    _acceptTerms = newvalue;
                  });
                },
                title: Text('Accept terms'),
              ),
              SizedBox(
                height: 10.0,
              ),
              RaisedButton(
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                child: Text('Login'),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/products');
                },
              )
            ],
          ),
        )),
      ),
      // body: Center(
      //     child: RaisedButton(
      //         child: Text('LOGIN'),
      //         onPressed: () {
      //           Navigator.pushReplacementNamed(context, '/');
      //         }))
    );
  }
}
