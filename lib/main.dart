import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:login/moduls/UserModel.dart';
import 'package:login/services/auth.dart';
import 'package:login/services/wrapper.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCYud1E4TT1VMsq3LX43nb3r0iqRZ66jDE",
            appId: "1:66998746569:web:7e358cf470fcb75b767c18",
            messagingSenderId: "66998746569",
            projectId: "new-project-50717"));
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel?>.value(
      initialData: UserModel(uid: ""),
      value: AuthServices().user,
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}
