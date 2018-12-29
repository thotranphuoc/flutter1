import 'package:flutter/material.dart';
import './products.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  String _emailValue;
  String _passValue;
  bool _acceptTerms = false;
  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500 : deviceWidth * 0.95;
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        decoration: _buildBackgroundImage(),
        padding: EdgeInsets.all(10.0),
        child: Center(
            child: SingleChildScrollView(
          child: Container(
            width: targetWidth,
            child: Column(
              children: <Widget>[
                _buildEmailTextField(),
                SizedBox(
                  height: 10.0,
                ),
                _buildPasswordTextField(),
                _buildAcceptTermSwitchList(),
                SizedBox(
                  height: 10.0,
                ),
                RaisedButton(
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  child: Text('Login'),
                  onPressed: _submitForm,
                ),
              ],
            ),
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

  BoxDecoration _buildBackgroundImage() {
    return BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5), BlendMode.dstATop),
            image: AssetImage('assets/background.jpg')));
  }

  Widget _buildEmailTextField() {
    return TextField(
      decoration: InputDecoration(
          labelText: 'Email', filled: true, fillColor: Colors.white),
      keyboardType: TextInputType.emailAddress,
      onChanged: (String value) {
        print(value);
        setState(() {
          _emailValue = value;
        });
      },
    );
  }

  Widget _buildPasswordTextField() {
    return TextField(
      decoration: InputDecoration(
          labelText: 'Password', filled: true, fillColor: Colors.white),
      obscureText: true,
      onChanged: (String value) {
        print(value);
        setState(() {
          _passValue = value;
        });
      },
    );
  }

  Widget _buildAcceptTermSwitchList() {
    return SwitchListTile(
      value: _acceptTerms,
      onChanged: (bool newvalue) {
        setState(() {
          _acceptTerms = newvalue;
        });
      },
      title: Text('Accept terms'),
    );
  }

  void _submitForm() {
    Navigator.pushReplacementNamed(context, '/products');
  }
}
