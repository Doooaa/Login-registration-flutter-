import 'package:flutter/material.dart';
import 'register.dart';

class Login extends StatefulWidget {

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  select_screen(BuildContext context, int n) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return  const Register();
    }));
  }

  GlobalKey<FormState>  formstate =  GlobalKey<FormState>();

  x(){
    var data=formstate.currentState;
    if(data!.validate())
      print("valid");
    else
      print("not valid");
  }

  var red=Colors.white;
   var str=r'[a-zA-Z0-9\+\.\_\%\-\+]{1,256}\@[a-zA-Z0-9]'
       r'[a-zA-Z0-9\-]{0,64}(\.[a-zA-Z0-9][a-zA-Z0-9\-]{0,25})+';
  convertToError(int value)
  {
    if(value==1) {
      setState(() {
        red=Colors.deepOrangeAccent;
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
                 key: formstate,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height:350,),
                  const Text("LOGIN",
                      style: TextStyle(fontSize: 35, color: Colors.black,fontWeight:FontWeight.bold)),
                  const Text("log in now to brows our hot offers",
                    style: TextStyle(fontSize: 20, color: Colors.black38)),
                  const SizedBox(height:15,),
                  TextFormField(
                    validator: (text){
                      if(text==str) {
                        convertToError(1);
                        return "please enter correct email !";

                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      filled:true,
                      fillColor:red,
                      border:  OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
                      hintText: "Email",
                      hintStyle: const TextStyle(fontSize: 20),
                      prefixIcon: const Icon(Icons.email_outlined, size: 25),
                    ),
                  ),
                  const SizedBox(height:15,),
                  TextFormField(
                    validator: (text){
                      if(text!.length<4) {
                        convertToError(1);
                        return "please enter more than 4 key!";

                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
                      filled: true,
                      fillColor: red,
                      hintText: "Password",
                      hintStyle: const TextStyle(fontSize: 20),
                      prefixIcon: const Icon(Icons.lock_outline, size: 25),
                      suffixIcon: const Icon(Icons.visibility_outlined, size: 25),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    color: Colors.blue,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 145, vertical: 4),
                    child: TextButton(
                      onPressed: x,

                      child: const Text("LOGIN",
                          style: const TextStyle(fontSize: 20, color: Colors.white,)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(60,20,0,0),
                    child: Row(
                      children: [
                        const Text(
                          "Don't have account  ",
                          style: TextStyle(fontSize: 18),),
                        InkWell(
                          onTap: () {
                                select_screen(context, 1);
                          },
                          child: const Text(
                            "register",
                            style: TextStyle(fontSize: 20, color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        );
  }
}


