import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search')),
      body: SafeArea(
        child: Container(
          constraints: const BoxConstraints.expand(),
          color: Color(0xFFFFFFFF),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Color(0xFFFFFFFF),
                  ),
                  width: double.infinity,
                  height: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IntrinsicHeight(
                          child: Container(
                            margin: const EdgeInsets.only(
                              top: 15,
                              bottom: 10,
                              left: 31,
                              right: 31,
                            ),
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                    vertical: 4,
                                  ),
                                  width: 30,
                                  child: Text(
                                    "7:05",
                                    style: TextStyle(
                                      color: Color(0xFF000000),
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                IntrinsicWidth(
                                  child: IntrinsicHeight(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(
                                            right: 9,
                                          ),
                                          width: 25,
                                          height: 25,
                                          child: Image.network(
                                            "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/NNxOM3GR7F/ghdltr7l_expires_30_days.png",
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(
                                            right: 9,
                                          ),
                                          width: 25,
                                          height: 25,
                                          child: Image.network(
                                            "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/NNxOM3GR7F/8tp1n7e0_expires_30_days.png",
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        Container(
                                          width: 25,
                                          height: 25,
                                          child: Image.network(
                                            "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/NNxOM3GR7F/vxxxe5yx_expires_30_days.png",
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        IntrinsicHeight(
                          child: Container(
                            margin: const EdgeInsets.only(
                              bottom: 30,
                              left: 14,
                              right: 14,
                            ),
                            width: double.infinity,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  margin: const EdgeInsets.only(right: 15),
                                  width: 50,
                                  height: 50,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(25),
                                    child: Image.network(
                                      "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/NNxOM3GR7F/lbbfvc2h_expires_30_days.png",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      print('Pressed');
                                    },
                                    child: IntrinsicHeight(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                          color: Color(0xFFECECEC),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 13,
                                        ),
                                        margin: const EdgeInsets.symmetric(
                                          vertical: 1,
                                        ),
                                        width: double.infinity,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                              ),
                                              margin: const EdgeInsets.only(
                                                left: 20,
                                                right: 15,
                                              ),
                                              width: 26,
                                              height: 24,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                                child: Image.network(
                                                  "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/NNxOM3GR7F/nx26lynq_expires_30_days.png",
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                width: double.infinity,
                                                child: Text(
                                                  "Search...",
                                                  style: TextStyle(
                                                    color: Color(0xFF000000),
                                                    fontSize: 20,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                              ),
                                              margin: const EdgeInsets.only(
                                                right: 22,
                                              ),
                                              width: 26,
                                              height: 24,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                                child: Image.network(
                                                  "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/NNxOM3GR7F/a01xpju2_expires_30_days.png",
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 17, left: 31),
                          child: Text(
                            "Recent Search",
                            style: TextStyle(
                              color: Color(0xFF000000),
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        IntrinsicHeight(
                          child: Container(
                            margin: const EdgeInsets.only(
                              bottom: 9,
                              left: 31,
                              right: 31,
                            ),
                            width: double.infinity,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    width: double.infinity,
                                    child: Text(
                                      "Raspberry Cake",
                                      style: TextStyle(
                                        color: Color(0xFF000000),
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  margin: const EdgeInsets.symmetric(
                                    vertical: 3,
                                  ),
                                  width: 24,
                                  height: 24,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(25),
                                    child: Image.network(
                                      "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/NNxOM3GR7F/h5u8dvhq_expires_30_days.png",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        IntrinsicWidth(
                          child: IntrinsicHeight(
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 9),
                              child: Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(right: 154),
                                    child: Text(
                                      "Berry Burst Bonanza",
                                      style: TextStyle(
                                        color: Color(0xFF000000),
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    margin: const EdgeInsets.symmetric(
                                      vertical: 3,
                                    ),
                                    width: 24,
                                    height: 24,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(25),
                                      child: Image.network(
                                        "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/NNxOM3GR7F/y1i5o8lb_expires_30_days.png",
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        IntrinsicHeight(
                          child: Container(
                            margin: const EdgeInsets.only(
                              bottom: 19,
                              left: 31,
                              right: 31,
                            ),
                            width: double.infinity,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Container(
                                    width: double.infinity,
                                    child: Text(
                                      "Velvet Dream Delight",
                                      style: TextStyle(
                                        color: Color(0xFF000000),
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  margin: const EdgeInsets.symmetric(
                                    vertical: 7,
                                  ),
                                  width: 24,
                                  height: 24,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(25),
                                    child: Image.network(
                                      "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/NNxOM3GR7F/2ska3g7e_expires_30_days.png",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 17, left: 31),
                          child: Text(
                            "Recent View",
                            style: TextStyle(
                              color: Color(0xFF000000),
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        IntrinsicWidth(
                          child: IntrinsicHeight(
                            child: Container(
                              margin: const EdgeInsets.only(
                                bottom: 15,
                                left: 32,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    margin: const EdgeInsets.only(right: 21),
                                    width: 100,
                                    height: 100,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(25),
                                      child: Image.network(
                                        "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/NNxOM3GR7F/sv48yvkc_expires_30_days.png",
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  IntrinsicWidth(
                                    child: IntrinsicHeight(
                                      child: Container(
                                        margin: const EdgeInsets.only(top: 7),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(
                                                bottom: 4,
                                              ),
                                              child: Text(
                                                "Chocolate Chip Cascade",
                                                style: TextStyle(
                                                  color: Color(0xFF000000),
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                bottom: 4,
                                              ),
                                              child: Text(
                                                "Cookies",
                                                style: TextStyle(
                                                  color: Color(0xFF000000),
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              "\$20.00",
                                              style: TextStyle(
                                                color: Color(0xFF000000),
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        IntrinsicWidth(
                          child: IntrinsicHeight(
                            child: Container(
                              margin: const EdgeInsets.only(
                                bottom: 69,
                                left: 32,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    margin: const EdgeInsets.only(right: 27),
                                    width: 100,
                                    height: 100,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(25),
                                      child: Image.network(
                                        "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/NNxOM3GR7F/iugb8o74_expires_30_days.png",
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  IntrinsicWidth(
                                    child: IntrinsicHeight(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(
                                              bottom: 4,
                                            ),
                                            child: Text(
                                              "Choco Bliss Cupcakes",
                                              style: TextStyle(
                                                color: Color(0xFF000000),
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(
                                              bottom: 4,
                                            ),
                                            child: Text(
                                              "Cup Cake",
                                              style: TextStyle(
                                                color: Color(0xFF000000),
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "\$22.00",
                                            style: TextStyle(
                                              color: Color(0xFF000000),
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        IntrinsicHeight(
                          child: Container(
                            margin: const EdgeInsets.only(
                              bottom: 25,
                              left: 31,
                              right: 31,
                            ),
                            width: double.infinity,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  margin: const EdgeInsets.only(right: 22),
                                  width: 100,
                                  height: 100,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(25),
                                    child: Image.network(
                                      "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/NNxOM3GR7F/gu9svrrl_expires_30_days.png",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: IntrinsicHeight(
                                    child: Container(
                                      margin: const EdgeInsets.only(top: 3),
                                      width: double.infinity,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(
                                              bottom: 4,
                                            ),
                                            width: double.infinity,
                                            child: Text(
                                              "Strawberry Fields Frosted",
                                              style: TextStyle(
                                                color: Color(0xFF000000),
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(
                                              bottom: 4,
                                            ),
                                            child: Text(
                                              "Donut",
                                              style: TextStyle(
                                                color: Color(0xFF000000),
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "\$25.00",
                                            style: TextStyle(
                                              color: Color(0xFF000000),
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        IntrinsicHeight(
                          child: Container(
                            margin: const EdgeInsets.only(
                              bottom: 74,
                              left: 28,
                              right: 28,
                            ),
                            width: double.infinity,
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  margin: const EdgeInsets.only(right: 18),
                                  width: 100,
                                  height: 100,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(25),
                                    child: Image.network(
                                      "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/NNxOM3GR7F/9zi5apwf_expires_30_days.png",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: IntrinsicHeight(
                                    child: Container(
                                      width: double.infinity,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(
                                              bottom: 4,
                                            ),
                                            width: double.infinity,
                                            child: Text(
                                              "Chocolate Caramel Donuts",
                                              style: TextStyle(
                                                color: Color(0xFF000000),
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(
                                              bottom: 4,
                                            ),
                                            child: Text(
                                              "Donut",
                                              style: TextStyle(
                                                color: Color(0xFF000000),
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "\$18.00",
                                            style: TextStyle(
                                              color: Color(0xFF000000),
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
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
