import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool vs = true;
  GlobalKey <FormState> formkey= GlobalKey <FormState>();
  Valid(){
    var data=formkey.currentState;
    if(data!.validate()) {
      print("valid");
    } else {
      print("not valid");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("registration"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  const Text("REGISTER",
                      style: TextStyle(
                          fontSize: 35,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                  const Text("register in now to brows our hot offers",
                      style: TextStyle(fontSize: 20, color: Colors.black38)),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                      validator: (text){
                       if(text!.isEmpty) {
                         return "plase enter your name";
                       }
                      },
                    // style: TextStyle(color:),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Name',
                        prefixIcon: Icon(
                          Icons.person,
                        ),
                        hintStyle: TextStyle(
                          fontSize: 18,
                        )),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        hintText: 'Email',
                        border: OutlineInputBorder(),
                        hintStyle: TextStyle(),
                        prefixIcon: Icon(Icons.email),
                        labelStyle: TextStyle(
                          fontSize: 23,
                        )),
                    validator: (text){
                      if(text!.length<16) {
                        return "please enter correct email !";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height:15,),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Password',
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.lock_outline, size: 25),
                      hintStyle: const TextStyle(),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            vs = !vs;
                          });
                        },
                        icon: Icon(
                          vs ? Icons.visibility : Icons.visibility_off,
                        ),
                      ),
                    ),
                    obscureText: vs,
                    keyboardType: TextInputType.visiblePassword,
                    validator: (text){
                      if(text!.length<4) {
                        return "please enter correct password more than 4 key !";

                      }
                      return null;
                    },
                  ),
                  const SizedBox(height:15,),
                  TextFormField(

                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintStyle: TextStyle(),
                        border: OutlineInputBorder(),
                        hintText: 'Phone',
                        prefixIcon: Icon(
                          Icons.phone,
                        ),
                      ),
                    validator: (text){
                        if(text!.length<12) {
                          return "plase enter correct number";
                        }
                          return null;
                    },),
                  Container(
                    color: Colors.blue,
                    margin: const EdgeInsets.only(top: 15),
                    padding: const EdgeInsets.fromLTRB(122, 2, 122, 0),
                    child: TextButton(
                      onPressed: Valid,
                      child: const Text("REGISTER",
                          style: TextStyle(color: Colors.white, fontSize: 22)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
