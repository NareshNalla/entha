import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:controlshop/notifiers/login_notifier.dart';
import 'package:provider/provider.dart';
import 'login/login.dart';
import 'notifiers/item_notifier.dart';
import 'screens/home_screen.dart';
import 'notifiers/app_state.dart';
import 'package:controlshop/notifiers/app_state.dart';
import 'package:controlshop/notifiers/created_items_notifier.dart';
import 'package:controlshop/notifiers/transaction_notifier.dart';
import 'package:controlshop/screens/home_screen.dart';
import 'notifiers/calculation_notifier.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ItemNotifier()),
      ChangeNotifierProvider<AppState>(
        create: (_) => AppState(),
      ),
      ChangeNotifierProvider<CalculationItemAmt>(
          create: (_) => CalculationItemAmt()
      ),
      ChangeNotifierProvider<CreatedItems>(
          create: (_) => CreatedItems()
      ),
      ChangeNotifierProvider(
          create: (_) => Transactions()
      ),
      ChangeNotifierProvider(
          create: (_) => LoginNotifier()
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: LoginScreen());
  }
}

FirebaseApp app = Firebase.app('controlshop');

class InitializerWidget extends StatefulWidget {
  const InitializerWidget({Key? key}) : super(key: key);

  @override
  _InitializerWidgetState createState() => _InitializerWidgetState();
}

class _InitializerWidgetState extends State<InitializerWidget> {
  FirebaseAuth? _auth;

  User? _user;

  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    _auth = FirebaseAuth.instance;

    _user = _auth!.currentUser;

    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Scaffold(
            body: const Center(
              child: const CircularProgressIndicator(),
            ),
          )
        : _user == null
            ? LoginScreen()
            : Homescreen();
  }
}
