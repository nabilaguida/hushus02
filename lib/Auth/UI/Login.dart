import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool remember = false ;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xff14141F),
      body: Column(
        children: [
          Container(
            height: height * 0.28,
            width: width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("Assets/loginbg.png"),
                fit: BoxFit.fill,
              ),
              color: Color(0xff14141F),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Log In',
                    style: GoogleFonts.sen(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Please Sign in to your existing account',
                    style: GoogleFonts.sen(fontSize: 16, color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: height * 0.03),
              width: width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.07),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Email",
                      style: GoogleFonts.sen(
                        fontSize: 16,
                        color: Color(0xff32343E),
                      ),
                    ),
                    Container(
                      width: width,
                      height: height * 0.09,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                        child: Center(
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    Text(
                      "Password",
                      style: GoogleFonts.sen(
                        fontSize: 16,
                        color: Color(0xff32343E),
                      ),
                    ),
                    Container(
                      width: width,
                      height: height * 0.09,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                        child: Center(
                          child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                            activeColor: Color(0xffFF7622),
                            value: remember, onChanged: (value){
                          setState(() {
                            remember = value ?? false ;
                          });
                        }),
                        Text('Remember me',style: GoogleFonts.sen(fontSize: 14,color: Color(0xff7E8A97))),
                        Spacer(),
                        Text("Forgot Password",style: GoogleFonts.sen(fontSize: 14,color: Color(0xffFF7622)),),
                      ],
                    ),
                    SizedBox(height: height*0.01,),
                    Container(
                      width: width,
                      height: height*0.09,
                      decoration: BoxDecoration(
                        color: Color(0xffFF7622),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Center(
                        child: Text(
                          "LogIn",
                          style: GoogleFonts.sen(fontSize: 18,color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Center(
                      child:  RichText(
                        text: TextSpan(
                          text: "Don’t have an account?",
                          style: GoogleFonts.sen(
                            fontSize: 16,
                            color: Color(0xff32343E),
                          ),
                          children: [
                            TextSpan(
                            text: " SignUp",
                            style: GoogleFonts.sen(
                              fontSize: 16,
                              color: Color(0xffFF7622),
                            ),)
                          ]
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Center(
                      child: Text('Or',style: GoogleFonts.sen(
                        fontSize: 16,
                        color: Color(0xff32343E),
                      ),),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Container(
                      width: width,
                      height: height*0.09,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,


                        ),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("Assets/google.png",width: width*0.1,),
                            SizedBox(width: width*0.05,),
                            Text(
                              "Google",
                              style: GoogleFonts.sen(fontSize: 18,color: Color(0xff32343E)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
