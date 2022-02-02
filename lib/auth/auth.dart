import 'package:auth/resources/style.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({Key? key}) : super(key: key);

  @override
  _AuthWidgetState createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  var loginContr = '';
  var passwordContr = '';
  String? errorText;

  final loginTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadData();
  }

  // Загружаем значения логина и пароля при запуске
  void loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      loginContr = (prefs.getString('login') ?? '_');
      passwordContr = (prefs.getString('password') ?? '_');
    });
  }

// сохранение данных в хранилище после клика
  safeData() async {
    loginContr = loginTextController.text.toString();
    passwordContr = passwordTextController.text.toString();
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString('login', loginContr);
      prefs.setString('password', passwordContr);
    });
  }

  void auth() {
    if (loginContr.isNotEmpty && passwordContr.isNotEmpty) {
      safeData(); // здесь мы храним значение логина и пароля
      errorText = null;
      Navigator.of(context).pushReplacementNamed('/screen');
    } else {
      errorText = 'Не верный логин или пароль';
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final errorText = this.errorText;
    return Scaffold(
        body: SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          children: [
            const SizedBox(
              height: 120,
            ),
            const SizedBox(
              width: 110,
              height: 84,
              child: Image(
                image: AssetImage('assets/dart_logo.png'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            if (errorText != null) ...[
              Text(errorText, style: registrSecondTextStyle),
              const SizedBox(
                height: 10,
              ),
            ],
            const Text('Username', style: registrPrimaryTextStyle),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: loginTextController,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                isCollapsed: true,
                contentPadding: EdgeInsets.all(10),
                filled: true,
                fillColor: Color(0xFFeceff1),
                enabledBorder: borderStyle,
                focusedBorder: borderStyle,
                labelText: 'Имя',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text('Password', style: registrPrimaryTextStyle),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: passwordTextController,
              obscureText: true,
              decoration: const InputDecoration(
                isCollapsed: true,
                contentPadding: EdgeInsets.all(10),
                filled: true,
                fillColor: Color(0xFFeceff1),
                enabledBorder: borderStyle,
                focusedBorder: borderStyle,
                labelText: 'Пароль',
              ),
            ),
            const SizedBox(
              height: 28,
            ),
            ButtonBar(
              children: [
                ElevatedButton(
                    onPressed: () {
                      auth();
                    },
                    child: const Text('Login'),
                    style:
                        ButtonStyle(elevation: MaterialStateProperty.all(8))),
                TextButton(
                  onPressed: () {
                    loginTextController.clear();
                    passwordTextController.clear();
                  },
                  child: const Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
