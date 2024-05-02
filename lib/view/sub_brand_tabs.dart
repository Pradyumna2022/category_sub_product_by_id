import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:prodsubecom/view/brand.dart';
import 'package:prodsubecom/view/subcat_brand.dart';

class SubBrandTabs extends StatefulWidget {
  const SubBrandTabs({super.key});

  @override
  State<SubBrandTabs> createState() => _SubBrandTabsState();
}

class _SubBrandTabsState extends State<SubBrandTabs>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.mic)),
          IconButton(onPressed: () {}, icon: Icon(Icons.card_travel))
        ],
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          "Sports",
          style: TextStyle(color: Colors.deepPurple),
        ),
        bottom: TabBar(
          dividerHeight: 0,
          controller: _tabController,
          tabs: [
            Tab(icon: Text("Sub-Category")),
            Tab(icon: Text("Brand")),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: SubCategoryAndBrandScreen(),
          ),
          BrandScreen()
        ],
      ),
    );
  }
}
