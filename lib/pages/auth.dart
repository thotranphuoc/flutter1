import 'package:flutter/material.dart';
import './products.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  final Map<String, dynamic> _formData = {
    'email': null,
    'password': null,
    'termAccepted': false
  };
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();

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
            child: Form(
              key: _keyForm,
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
                    textColor: Colors.white,
                    child: Text('Login'),
                    onPressed: _submitForm,
                  ),
                ],
              ),
            ),
          ),
        )),
      ),
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
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Email', filled: true, fillColor: Colors.white),
      validator: (String value) {
        if (value.isEmpty ||
            !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                .hasMatch(value)) {
          return 'Please enter a vilid email';
        }
      },
      onSaved: (String value) {
        _formData['email'] = value;
      },
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget _buildPasswordTextField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Password', filled: true, fillColor: Colors.white),
      validator: (String value) {
        if (value.isEmpty || value.trim().length < 6) {
          return 'Password is required and should be 6+ long';
        }
      },
      onSaved: (String value) {
        _formData['password'] = value;
      },
      obscureText: true,
    );
  }

  Widget _buildAcceptTermSwitchList() {
    return SwitchListTile(
      value: _formData['termAccepted'],
      onChanged: (bool newvalue) {
        setState(() {
          _formData['termAccepted'] = newvalue;
        });
      },
      title: Text('Accept terms'),
    );
  }

  void _submitForm() {
    if (!_keyForm.currentState.validate() || !_formData['termAccepted']) {
      return;
    }
    _keyForm.currentState.save();
    print(_formData);
    Navigator.pushReplacementNamed(context, '/products');
  }
}
