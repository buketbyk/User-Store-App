import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:configurable_expansion_tile_null_safety/configurable_expansion_tile.dart';
import '../widgets/basket_icon.dart';
import '../widgets/chart.dart';
import '../widgets/counter.dart';
import '../widgets/decoration.dart';
import '../widgets/divider.dart';
import '../widgets/graph_info.dart';
import '../widgets/item_pic.dart';
import 'home_page.dart';

const Color customBackground = Color(0xffe6e6ec);

void main() => runApp(const lastShopping());

class lastShopping extends StatelessWidget {

  const lastShopping({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Column(
            children: [
              Text('Previous Orders',
                  style: style_arguments(
                      Colors.black, FontWeight.w500, height * 0.03, 'OpenSans')),
              divider(color: Colors.black54),
            ],
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget>
    with TickerProviderStateMixin {
  var currentItem = itemList.getData;
  int? _currIndex;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: currentItem.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8,10, 8, 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text("Last shopping",
                                style: style_arguments(
                                    Colors.black,
                                    FontWeight.w600,
                                    height * 0.021,
                                    'OpenSans')),
                            Icon(CupertinoIcons.shopping_cart)
                          ],
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        icon: const Icon(Icons.arrow_forward),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      lastShopping()));
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: width/2.5,
                            height: width/2,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                    image: NetworkImage("https://www.jonesandcane.co.uk/wp-content/uploads/2016/02/American-grocery-bag.jpg"),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 16, 8, 0),
                            child: Text(
                              "At: 12/04/2022",
                              style: style_arguments(
                                  Colors.black,
                                  FontWeight.w600,
                                  height * 0.021,
                                  'OpenSans'),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        flex: 1,
                        child: Chart(
                            graphInformation: [
                              GraphInfo("Total spend", 120),
                              GraphInfo("Total saved", 40),
                              // GraphInfo("Total spend", 120),
                            ],
                            maxValue: 160
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class itemList {
  static final getData = [
    {
      'name': 'name1 name1 name1 name1 name1name1name1',
      'thumbnail': 'thumbnail1',
      'brand': 'brand1',
      'amount': 'amount1',
      'price': '56.90',
    },
    {
      'name': 'name2',
      'thumbnail': 'thumbnail2',
      'brand': 'brand2',
      'amount': 'amount2',
      'price': '56.90',
    },
    {
      'name': 'name3name3name3name3',
      'thumbnail': 'thumbnail3',
      'brand': 'brand3',
      'amount': 'amount2',
      'price': '56.90',
    },
  ];
}
