import 'package:flutter/material.dart';

class passwordpage extends StatefulWidget {
  const passwordpage({super.key});

  @override
  State<passwordpage> createState() => _passwordpageState();
}

class _passwordpageState extends State<passwordpage> {
  final usernamecontrol = TextEditingController();
  final passwordcontrol = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 237, 240, 240),
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.credit_card,
                    size: 80,
                  ),
                  Text(
                    'welcome to sign In',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      // Label text for the TextField
                      hintText:
                          'Enter your Email id  ', // Hint text shown when the TextField is empty
                      prefixIcon: Icon(Icons
                          .email_rounded), // Icon displayed before the input field
                      border: OutlineInputBorder(
                        // Border around the TextField
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                            color: Colors.blue), // Color of the border
                      ),
                      filled:
                          true, // Whether to fill the area around the TextField
                      fillColor: Colors.grey[
                          200], // Color to fill the area around the TextField
                      contentPadding:
                          EdgeInsets.all(12.0), // Padding inside the TextField
                    ),
                    style: TextStyle(
                        fontSize:
                            16.0), // Style for the text entered in the TextField
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    padding: EdgeInsets.only(top: 15),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Enter the password',
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                        contentPadding: EdgeInsets.all(12.0),
                      ),
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text('Forgot Password'),
                    ),
                  ),
                  ElevatedButton(onPressed: () {}, child: Text('sign in')),
                  Text('----or continue with----'),
                ]),
          ),
        ),
      ),
    );
  }
}
