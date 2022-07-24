import '../exports.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    final foodieModel = Provider.of<DataClass>(context, listen: false);
    foodieModel.getData();
  }

  @override
  Widget build(BuildContext context) {
    final foodieModel = Provider.of<DataClass>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        elevation: 0,
        title: Text(
          foodieModel.food?.mealtime ?? '',
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: Container()
    );
  }
}
