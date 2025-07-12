import 'package:business_app/shared/widgets/custom_app_bar.dart';
import 'package:business_app/theme/app_color.dart';
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
      appBar: CustomAppBar(title: 'Buscar', showBackButton: true),
      body: SafeArea(
        child: Container(
          constraints: const BoxConstraints.expand(),
          color: AppColors.background,
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
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Container(
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
                        ),
                        RecentSearchItem(label: 'Raspberry Cake'),
                        RecentSearchItem(label: 'Berry Burst Bonanza'),
                        RecentSearchItem(label: 'Velvet Dream Delight'),

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

class RecentSearchItem extends StatelessWidget {
  final String label;
  const RecentSearchItem({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        margin: const EdgeInsets.only(bottom: 9, left: 31, right: 31),
        width: double.infinity,
        child: Row(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                child: Text(
                  label,
                  style: TextStyle(color: Color(0xFF000000), fontSize: 16),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              margin: const EdgeInsets.symmetric(vertical: 3),
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
    );
  }
}
