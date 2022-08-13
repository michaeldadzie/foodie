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
    return RefreshIndicator(
      color: Colors.black,
      onRefresh: () => foodieModel.getData(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: foodieModel.loading == false
            ? SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      const SizedBox(height: 50),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Container(
                      //       height: 50,
                      //       width: 50,
                      //       decoration: BoxDecoration(
                      //         color: Colors.blueGrey.withOpacity(0.1),
                      //         border: Border.all(
                      //           color: Colors.transparent,
                      //         ),
                      //         borderRadius: const BorderRadius.all(
                      //           Radius.circular(15),
                      //         ),
                      //       ),
                      //       child: Center(
                      //         child: menuButton,
                      //       ),
                      //     ),
                      //     Container(
                      //       height: 50,
                      //       width: 50,
                      //       decoration: BoxDecoration(
                      //         color: Colors.blueGrey.withOpacity(0.1),
                      //         border: Border.all(
                      //           color: Colors.transparent,
                      //         ),
                      //         borderRadius: const BorderRadius.all(
                      //           Radius.circular(15),
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 120,
                          decoration: BoxDecoration(
                            color: Colors.blueGrey.withOpacity(0.1),
                            border: Border.all(
                              color: Colors.transparent,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Colors.transparent,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      '✨',
                                      style: TextStyle(fontSize: 40),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Expanded(
                                  child: SuggestText(
                                      text:
                                          'It\'s ${foodieModel.food?.mealtime} time, Let me suggest something to eat...'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: ListView(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            FoodieWidget(
                              name: foodieModel.food?.option1?.name ?? '',
                              imagelink:
                                  'https://${foodieModel.food?.option1?.img3}',
                            ),
                            FoodieWidget(
                              name: foodieModel.food?.option2?.name ?? '',
                              imagelink:
                                  'https://${foodieModel.food?.option2?.mainImg}',
                            ),
                            FoodieWidget(
                              name: foodieModel.food?.fancy?.name ?? '',
                              imagelink:
                                  'https://${foodieModel.food?.fancy?.img2}',
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView(
                  children: const [
                    SizedBox(height: 70),
                    CustomPlaceholder(),
                    CustomPlaceholder(),
                    CustomPlaceholder(),
                  ],
                ),
              ),
      ),
    );
  }
}

Widget get menuButton {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        height: 3,
        width: 24,
        color: Colors.black,
      ),
      const SizedBox(height: 5),
      Container(
        height: 3,
        width: 12,
        color: Colors.black,
      ),
    ],
  );
}
