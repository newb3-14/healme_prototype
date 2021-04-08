import 'package:flutter/material.dart';
import 'package:prototype/auth/auth.dart';
import 'package:prototype/shared/constants.dart';

class Authentication extends StatefulWidget {
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  bool _isSignin = true;
  final GlobalKey<FormState> _formKey = GlobalKey();
  final AuthService _auth = AuthService();

  String email = "";
  String password = "";


  Future<void> _submit() async {
    if(!_formKey.currentState.validate()){
      return;
    }
    _formKey.currentState.save();

    try{
      if(_isSignin == true){
        await _auth.signInWithEmailandPass(email, password); 
      }
      else{
        await _auth.registerWithEmailandPass(email, password);
      }
    }catch(e){
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Container(
        height: size.height,
        child: Stack(
          children: [
            Container(
              color: kPrimaryColor,
            ),
            Positioned(
              bottom: size.height * 0.5,
              child: Container(
                height: size.height * 0.1,
                width: size.width,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50)),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: size.width,
                height: size.height * 0.5,
                decoration: BoxDecoration(color: Colors.grey[200]),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        width: size.width * 0.9,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: TextFormField(
                          decoration: InputDecoration(
                              icon: Icon(Icons.email), labelText: "Email"),
                              onChanged: (value){
                                email = value;
                              },
                          validator: (value) {
                            if (value.isEmpty || !value.contains("@")) {
                              return "Invalid Email";
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: size.width * 0.9,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: TextFormField(
                          onChanged: (value){
                            password = value;
                          },
                          decoration: InputDecoration(
                              icon: Icon(Icons.lock), labelText: "Password"),
                              validator: (value){
                                if(value.isEmpty || value.length <5){
                                  return "Password is too short";
                                }
                                return null;
                              },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      if (!_isSignin)
                        Container(
                          width: size.width * 0.9,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: TextFormField(
                            decoration: InputDecoration(
                                icon: Icon(Icons.lock),
                                labelText: "Retype Password"),
                                validator: (value){
                                  if(value != password){
                                    return "Password doesn't match";
                                  }
                                  return null;
                                },
                          ),
                        ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: size.width * 0.6,
                        height: size.height * 0.05,
                        child: ElevatedButton(
                          onPressed: _submit,
                          child: Text(_isSignin ? "Sign In" : "Sign Up"),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(_isSignin
                              ? "Don't have account?"
                              : "Already have an Account?"),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  _isSignin = !_isSignin;
                                });
                              },
                              child: Text(_isSignin ? "Sign Up" : "Sign In"))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
