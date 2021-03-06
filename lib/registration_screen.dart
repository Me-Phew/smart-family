import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:smart_family/colors.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:smart_family/helpers/resolve_error.dart';
import 'package:smart_family/static_routes.dart';
import 'static_routes.dart';
import 'pages.dart';
import 'registration_service.dart';
import 'package:http/src/response.dart';

class Register extends StatefulWidget{
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  String choosenValue = '';
  List roleItem = [
    'mama', 'tata', 'syn', 'córka'
  ];

  @override
  void initState(){
    super.initState();
    choosenValue = roleItem[0];
  }
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final rePasswordController = TextEditingController();
  showAlert(String desc){
    Alert(
      context: context,
      title: 'Nie tak szybko...',
      desc: desc,
      buttons: [
        DialogButton(
          child: const Text('OK'),
          onPressed: () => Navigator.pop(context),
          color: const Color(0xEEFFFFFF),
        ),
      ],
    ).show();
  }
  notSamePasswords(){
    Alert(
      context: context,
      title: 'Nie tak szybko...',
      desc: 'Podane hasła muszą się zgadzać',
      buttons: [
        DialogButton(
          child: const Text('OK'),
          onPressed: () => Navigator.pop(context),
          color: const Color(0xEEFFFFFF),
        ),
      ],
    ).show();
  }
  nullFieldAllert(){
    Alert(
      context: context,
      title: 'Nie tak szybko...',
      desc: 'Te pola nie mogą być puste',
      buttons: [
        DialogButton(
          child: const Text('OK'),
          onPressed: () => Navigator.pop(context),
          color: const Color(0xEEFFFFFF),
        ),
      ],
    ).show();
  }
  bool checkForEmptyTextField(){
    String email, password, name, surename, repassword;
    email = emailController.text;
    password = passwordController.text;
    name = nameController.text;
    repassword = rePasswordController.text;
    surename = surnameController.text;
    if(email == '' || password == '' || name == '' || surename == '' || repassword == ''){
      nullFieldAllert();
      return false;
    } else if(password != repassword) {
      notSamePasswords();
      return false;
    } else {
      return true;
    }
  }

   Widget buildName(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const Text(
        'Imię',
        style: TextStyle(
          color: textColor,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 10),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: turquoise,
          borderRadius: BorderRadius.circular(30),
        ),
        height: 45,
        child: TextField(
          controller: nameController,
          cursorColor: backgroundColor,
          style: const TextStyle(
            color: backgroundColor,
          ),
          decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 12),
            prefixIcon: Icon(
              Icons.person,
              color: backgroundColor,
            ),
            hintText: 'Imię',
            hintStyle: TextStyle(
              color: Colors.white38,
            ),
          ),
        ),
      ),
    ],
  );
}

   Widget buildSurname(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const Text(
        'Nazwisko',
        style: TextStyle(
          color: textColor,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 10),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: turquoise,
          borderRadius: BorderRadius.circular(30),
        ),
        height: 45,
        child: TextField(
          controller: surnameController,
          cursorColor: backgroundColor,
          style: const TextStyle(
            color: backgroundColor,
          ),
          decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 12),
            prefixIcon: Icon(
              Icons.person,
              color: backgroundColor,
            ),
            hintText: 'Nazwisko',
            hintStyle: TextStyle(
              color: Colors.white38,
            ),
          ),
        ),
      ),
    ],
  );
}

  Widget buildEmail(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const Text(
        'Email',
        style: TextStyle(
          color: textColor,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 10),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: turquoise,
          borderRadius: BorderRadius.circular(30),
        ),
        height: 45,
        child: TextField(
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          cursorColor: backgroundColor,
          style: const TextStyle(
            color: backgroundColor,
          ),
          decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 12),
            prefixIcon: Icon(
              Icons.email,
              color: backgroundColor,
            ),
            hintText: 'Email',
            hintStyle: TextStyle(
              color: Colors.white38,
            ),
          ),
        ),
      ),
    ],
  );
}

Widget buildPassword(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const Text(
        'Hasło',
        style: TextStyle(
          color: textColor,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 10),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: turquoise,
          borderRadius: BorderRadius.circular(30),
        ),
        height: 45,
        child: TextField(
          controller: passwordController,
          obscureText: true,
          cursorColor: backgroundColor,
          style: const TextStyle(
            color: backgroundColor,
          ),
          decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 12),
            prefixIcon: Icon(
              Icons.lock,
              color: backgroundColor,
            ),
            hintText: 'Hasło',
            hintStyle: TextStyle(
              color: Colors.white38,
            ),
          ),
        ),
      ),
    ],
  );
}

Widget buildRePassword(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const Text(
        'Powtórz hasło',
        style: TextStyle(
          color: textColor,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 10),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: turquoise,
          borderRadius: BorderRadius.circular(30),
        ),
        height: 45,
        child: TextField(
          controller: rePasswordController,
          obscureText: true,
          cursorColor: backgroundColor,
          style: const TextStyle(
            color: backgroundColor,
          ),
          decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 12),
            prefixIcon: Icon(
              Icons.lock,
              color: backgroundColor,
            ),
            hintText: 'Powtórz hasło',
            hintStyle: TextStyle(
              color: Colors.white38,
            ),
          ),
        ),
      ),
    ],
  );
}

Widget buildRegisterBtn(){
  return Container(
    padding:  const EdgeInsets.symmetric(vertical: 15),
    width: double.infinity,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 5,
        padding: const EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        primary: const Color(0xEEFFFFFF),
      ),
      onPressed: () async {
        if(checkForEmptyTextField()) {
          Response res = await registerUser(nameController.text, surnameController.text, emailController.text, choosenValue, passwordController.text, rePasswordController.text);
          if (res.body.contains('errorNum')) {
            showAlert(resolveError(res.body[res.body.indexOf("errorNum")]));
          } else {
            goToPage(context, Pages.login);
          }
        }
        },
      child: const Text(
        'Zarejestruj się',
        style: TextStyle(
          color: backgroundColor,
          fontSize: 18, 
          fontWeight: FontWeight.bold
          ),
      ),
    )
  );
}

Widget buildLogInBtn(){
  return GestureDetector(
    onTap: (){
      goToPage(context, Pages.login);
    },
    child: RichText(
      text: const TextSpan(
        children: [
          TextSpan(
            text: 'Masz już konto? ',
            style: TextStyle(
              color: textColor,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextSpan(
            text: 'Zaloguj się',
            style: TextStyle(
              color: turquoise,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
      ])
    ),
  );
}

Widget buildDropDown(){
  return Theme(
    data: Theme.of(context).copyWith(
      canvasColor: turquoise,
    ),
    child: DropdownButton(
      style: const TextStyle(
        color: textColor,
      ),
      hint: const Text('Wybierz swoją rolę'),
      value: choosenValue,
      onChanged: (value){
        setState(()
        {
          choosenValue = value as String;
        });
      },
      items: roleItem.map((item){
        return DropdownMenuItem(value: item, child: Text(item),);
      }).toList()
    ),
  );
}

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: backgroundColor,
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 60,
                  ),
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'Zarejestruj się',
                      style: TextStyle(
                        color: textColor,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 40),
                    buildDropDown(),
                    const SizedBox(height: 15),
                    buildName(),
                    const SizedBox(height: 15),
                    buildSurname(),
                    const SizedBox(height: 15),
                    buildEmail(),
                    const SizedBox(height: 15),
                    buildPassword(),
                    const SizedBox(height: 15),
                    buildRePassword(),
                    const SizedBox(height: 15),
                    buildRegisterBtn(),
                    buildLogInBtn(),
                  ],
                ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}