import 'exports.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Foodie());
  // SystemChrome.setSystemUIOverlayStyle(
  //   const SystemUiOverlayStyle(
  //     statusBarColor: Colors.transparent, // status bar color
  //   ),
  // );
}

class Foodie extends StatelessWidget {
  const Foodie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create: (context) => DataClass(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}

