import 'package:app/feature/common/card/view/card_view.dart';
import 'package:app/feature/common/list/view/list_view.dart';
import 'package:app/feature/common/ad/view/ad_view.dart';
import 'package:app/src/dummuy_data.dart';
import 'package:app/src/fonts.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '🏘️ 동화 골목',
          style: FontSystem.title,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 100,
              child: MultipleAdWidgets(adList: adList),
            ),
            SizedBox(
              height: 381,
              child: MultipleCardWidgets(
                tagData: TagData,
                dataList: dataList,
              ),
            ),
            SizedBox(
              height: 410,
              child: MultipleListWidgets(
                musicList: musicList,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
