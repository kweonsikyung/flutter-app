import 'package:app/src/colors.dart';
import 'package:app/src/fonts.dart';
import 'package:flutter/material.dart';

/// 이미지, 제목, 설명, 주석을 갖는 카드형 위젯
class ListWidget extends StatelessWidget {
  /** 제목 */
  final String title;
  /** 설명 */
  final String description;
  /** 주석 */
  final String caption;
  /** 이미지 경로 ('assets/ ***') */
  final String imagePath;

  const ListWidget({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.caption,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, right: 20),
      child: Flex(
        direction: Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imagePath,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text(
                    title,
                    style: FontSystem.body1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 0),
                  child: Text(
                    description,
                    style: FontSystem.body2,
                  ),
                ),
                Text(
                  caption,
                  style: FontSystem.caption,
                ),
              ],
            ),
          ),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ColorSystem.Primary.withOpacity(0.1),
            ),
            child: Icon(
              Icons.play_arrow,
              color: ColorSystem.Primary,
              size: 20,
            ),
          )
        ],
      ),
    );
  }
}

class MultipleListWidgets extends StatelessWidget {
  final List<Map<String, String>> musicList;

  const MultipleListWidgets({
    Key? key,
    required this.musicList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '🎧 클립스토리를 귀로 감상해보세요',
            style: FontSystem.title,
          ),
          SizedBox(height: 20),
          ListView.builder(
            shrinkWrap: true,
            itemCount: musicList.length,
            itemBuilder: (context, index) {
              final item = musicList[index];
              return SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ListWidget(
                  imagePath: item['imagePath'] ?? '',
                  title: item['title'] ?? '',
                  description: item['description'] ?? '',
                  caption: item['caption'] ?? '',
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
