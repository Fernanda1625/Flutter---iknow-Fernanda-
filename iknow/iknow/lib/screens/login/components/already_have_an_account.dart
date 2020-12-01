import 'package:flutter/material.dart';

class AlreadyHaveAnAccountChecked extends StatelessWidget {
  final bool login;
  final Function press;
  const AlreadyHaveAnAccountChecked({
    Key key,
    this.login = true,
    this.press,
  }): super(key: key);

  @override
  Widget build( BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          login ? "Don't have an Account ? " : "Already have an Account ?",
          style: TextStyle(color: Colors.grey[600]),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? "Sign Up " : "Sign In", 
            style: TextStyle(
              color: Colors.tealAccent[400], 
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}