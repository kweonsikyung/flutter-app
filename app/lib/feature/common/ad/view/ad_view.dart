import 'package:flutter/material.dart';

/// 홈 화면 최상단에 들어가는 이미지형 광고 위젯

class AdWidget extends StatelessWidget {
  /// 이미지 경로
  final String imagePath;

  const AdWidget({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
      ),
    );
  }
}

class MultipleAdWidgets extends StatelessWidget {
  final List<Map<String, String>> adList;

  const MultipleAdWidgets({Key? key, required this.adList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: adList.length,
        itemBuilder: (context, index) {
          final item = adList[index];
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            child: AdWidget(imagePath: item['imagePath']!),
          );
        },
      ),
    );
  }
}
