import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iknow/screens/home/home_screen.dart';

String emailRegister;
String nameRegister;
String areaRegister;
String passwordRegister;
final _auth = FirebaseAuth.instance;

class SignUpScreen extends StatefulWidget {

  static String id = 'signup';

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child : Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "S I G N   U P",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 35.0,),
              Flexible(
                child: Image.asset('assets/icons/signup.png',
                  height: 150.0,
                  scale: 1.0,
                ),
              ),
              SizedBox(height: 15.0,),
              _nameTextField(),
              SizedBox(height: 15.0,),
              _userTextField(),
              SizedBox(height: 15.0,),
              _areaTextField(),
              SizedBox(height: 15.0,),
              _passwordTextField(),
              SizedBox(height: 20.0,),
              _buttonSignUp(),
              SizedBox(height: 10.0,),
              /*AlreadyHaveAnAccountChecked(
                press: () {},
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
Widget _nameTextField(){
  return StreamBuilder(
    builder: (BuildContext context, AsyncSnapshot snapshot){
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        child: TextField(
          keyboardType: TextInputType.text,
          decoration: InputDecoration( 
            icon: Icon(Icons.account_box_rounded),
            hintText: '',
            labelText: 'Name',
          ),
          onChanged: (value){
            nameRegister = value;
          },
        ),
      );
    }
  );
}

/*
Widget _apellTextField(){
  return StreamBuilder(
    builder: (BuildContext context, AsyncSnapshot snapshot){
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        child: TextField(
          keyboardType: TextInputType.text,
          decoration: InputDecoration( 
            icon: Icon(Icons.account_box_rounded ),
            hintText: 'Perez Rodriguez',
            labelText: 'Last name',
          ),
          onChanged: (value){
            // brbrbr
          },
        ),
      );
    }
  );
}
*/

Widget _userTextField(){
  return StreamBuilder(
    builder: (BuildContext context, AsyncSnapshot snapshot){
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration( 
            icon: Icon(Icons.email),
            hintText: 'example@gmail.com',
            labelText: 'Email',
          ),
          onChanged: (value){
            emailRegister = value;
          },
        ),
      );
    }
  );
}

Widget _areaTextField(){
  return StreamBuilder(
    builder: (BuildContext context, AsyncSnapshot snapshot){
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        child: TextField(
          keyboardType: TextInputType.text,
          decoration: InputDecoration( 
            icon: Icon(Icons.group ),
            hintText: 'Admin. , Tesoreria, etc',
            labelText: 'Area',
          ),
          onChanged: (value){
            areaRegister = value;
          },
        ),
      );
    }
  );
}

_passwordTextField(){
    return StreamBuilder(
    builder: (BuildContext context, AsyncSnapshot snapshot){
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        child: TextField(
          keyboardType: TextInputType.text,
          obscureText: true,
          decoration: InputDecoration( 
            icon: Icon(Icons.lock),
            hintText: '',
            labelText: 'Password',
            suffixIcon: Icon(
              Icons.visibility,
              color: Colors.grey[600],
            ),
          ),
          onChanged: (value){
            passwordRegister = value;
          },
        ),
      );
    }
  );
}

Widget _buttonSignUp(){
  return StreamBuilder(
    builder: (BuildContext context, AsyncSnapshot snapshot){
      return RaisedButton(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 100.0, vertical:14),
          child: Text('SIGN UP',
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        elevation: 10.0,
        color: Colors.tealAccent[400],
        onPressed:() async {
          try{
            final newUser = _auth.createUserWithEmailAndPassword(email: emailRegister, password: passwordRegister);
            if (newUser != null){
              Navigator.push(context,
                MaterialPageRoute(
                  builder: (context){
                    return HomeScreen();
                  },
                ),
              );
            }
          }catch(e) {print(e);}
        }
      );
    }
  );
}