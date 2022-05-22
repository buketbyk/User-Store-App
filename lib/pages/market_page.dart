import 'package:flutter/material.dart';

class MarketPage extends StatefulWidget {
  const MarketPage({Key? key}) : super(key: key);

  @override
  State<MarketPage> createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage> {
  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent[400],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Container(
                  height: width/2*0.9,
                  width: width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: NetworkImage("https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/gettyimages-1207188789.jpg"),
                          fit: BoxFit.cover
                      )
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.redAccent,
                    ),
                    child: Icon(Icons.add_business_rounded, color: Colors.white,),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
            child: RichText(
              text: TextSpan(
                  children: [
                    TextSpan(
                        text: "Location  ",
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: height*0.022,
                            fontStyle: FontStyle.italic
                        )
                    ),
                    TextSpan(
                        text: "Kayseri / Kocasinan / Sumer mahallesi / Next to the university",
                        style: TextStyle(
                          color: Colors.grey[900],
                          fontSize: height*0.02,
                        )
                    )
                  ]
              ),
            ),
          ),
          DefaultTabController(
            length: 2,
            child: TabBar(
              isScrollable: true,
              unselectedLabelColor: Colors.black,
              padding: EdgeInsets.all(8),
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.redAccent),

              tabs: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Colors.redAccent,style: BorderStyle.solid, width: 1)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Tab(
                      text: "  Word  ",
                    ),
                  ),
                ),
                Tab(
                  text: "  Word  ",
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
