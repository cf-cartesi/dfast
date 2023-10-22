import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'dart:io' as io;
import 'package:path_provider/path_provider.dart';
import 'package:web3_dart/shared/app_conf.dart';
import 'package:web3_dart/user/application/user.dart';
import 'package:web3_dart/user/presentation/homepage.dart';
import 'package:web3_dart/user/presentation/trips.dart';
import 'package:web3_dart/web3Account/application/account.dart';
import 'package:web3_dart/web3Account/presentation/create.dart';
import 'package:web3_dart/web3Account/presentation/manage.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DFast',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'DFaST Home Page'),
      routes: {
        UserHomePage.route: (context) => const UserHomePage(),
        TripsPage.route: (context) => const TripsPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final userAccounts = <Map<String, dynamic>> [];

  @override
  void initState() {
    super.initState();
    initialization();
  }


  void initialization() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.

    // create directories used by the app
    final appDirectory = await getApplicationDocumentsDirectory();
    String accountsDirectoryPath = "${appDirectory.path}/accounts";
    io.Directory dir = await _createDirectory(accountsDirectoryPath);

    _getAccountList(dir);

    // load default network AppConf
    AppConf.load("localhost");

    FlutterNativeSplash.remove();
  }


  Future<io.Directory> _createDirectory(String directoryPath) async {
    io.Directory dir =  io.Directory(directoryPath);
    if(await dir.exists()) {
      return dir;
    }

    dir = await dir.create(recursive: true);
    return dir;
  }

  void _getAccountList(io.Directory dir) {
    List accountsFiles = dir.listSync();

    setState(() {
      for (var i = 0; i < accountsFiles.length; i++) {
        String content = File(accountsFiles[i].path).readAsStringSync();
        Map<String, dynamic> account = jsonDecode(content);
        account["filepath"] = accountsFiles[i].path;
        userAccounts.add(account);
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called.
    if (userAccounts.isEmpty) {
      return CreateWallet(callback: _nav2UserPage);
    } else {
      return ManageWallet(userAccounts, _nav2UserPage);
    }
  }

  void _nav2UserPage(Account userAccount) {
    User user = User(userAccount);
    Navigator.pushReplacementNamed(
        context, UserHomePage.route, arguments: user);
  }
}